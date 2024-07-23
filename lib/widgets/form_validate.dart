//To make apps secure and easy to use, check whether the information
//the user has provided is valid. If the user has correctly filled out
//the form, process the information. If the user submits incorrect
//information, display a friendly error message letting them know
//what went wrong.

// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class FormValidate extends StatefulWidget {
  const FormValidate({super.key});

  @override
  _FormValidateState createState() => _FormValidateState();
}

class _FormValidateState extends State<FormValidate> {
  
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            validator: (value) {
              //The validator receives the text that the user has entered.
              if (value == null || value.isEmpty) {
                return 'Name is required';
              }
              return null;
            },
            decoration: const InputDecoration(
                labelText: 'Name',
                hintText: 'Enter your name',
                border: OutlineInputBorder()),
          ),
          ElevatedButton(
            onPressed: () {
              //Validate returns true if the form is valid, or false otherwise.
              if (_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Processing data'),
                ));
              }
            },
            child: const Text('Submit'),
          )
        ],
      ),
    );
  }
}
