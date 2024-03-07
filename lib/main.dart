
import 'package:clinx/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluro/fluro.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final router = FluroRouter();
  defineRoutes(router);

  runApp(MyApp(
    router: router,
    initialRoute: Uri.base.queryParameters['documentId'],
  ));
}

void defineRoutes(FluroRouter router) {
  router.define(
    '/:documentId',
    handler: Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
        String? documentId = params['documentId']?[0];
        return MyForm(documentId: documentId);
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  final FluroRouter router;
  final String? initialRoute;

  const MyApp({Key? key, required this.router, this.initialRoute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form App',
      onGenerateRoute: router.generator,
      initialRoute: initialRoute ?? '/',
    );
  }
}

class MyForm extends StatefulWidget {
  final String? documentId;

  const MyForm({Key? key, this.documentId}) : super(key: key);

  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _problemController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form App'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(labelText: 'Phone'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _problemController,
                decoration: InputDecoration(labelText: 'Problem'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please describe the problem';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    saveFormData();
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void saveFormData() async {
    // Save the form data to Firebase as an array of maps
    try {
      final formReference = FirebaseFirestore.instance.collection('forms').doc(widget.documentId);

      await formReference.get().then((docSnapshot) async {
        if (docSnapshot.exists) {
          // Document exists, update the array
          await formReference.update({
            'data': FieldValue.arrayUnion([
              {
                'name': _nameController.text,
                'phone': _phoneController.text,
                'problem': _problemController.text,
              },
            ]),
          });
        } else {
          // Document doesn't exist, create it with the array as a map
          await formReference.set({
            'data': [
              {
                'name': _nameController.text,
                'phone': _phoneController.text,
                'problem': _problemController.text,
              },
            ],
            'documentId': widget.documentId,
          });
        }
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Form data saved successfully!')),
      );
    } catch (e) {
      print('Error saving form data: $e');
    }
  }
}