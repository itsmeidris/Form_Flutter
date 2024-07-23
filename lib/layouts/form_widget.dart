// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({super.key});

  @override
  _FormWidgetState createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {

  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>(); 
  
  // Initialize controllers for the text fields
  final _emailController = TextEditingController();
  final _numberController = TextEditingController();
  final _nameController = TextEditingController();

  //Create variables to store the text fields values
  late String _prevEmail, _prevNumber, _prevName;

  @override
  Widget build(BuildContext context) {
    final double height =
        MediaQuery.of(context).size.height; //Responsive height

    return Container(
      padding: const EdgeInsets.only(left: 40, right: 40),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(
              height: (height * .04),
            ),
            Text(
              "Welcome to my",
              style: GoogleFonts.lato(
                  fontSize: 30,
                  color: const Color.fromARGB(255, 29, 72, 106),
                  fontWeight: FontWeight.w400),
            ),
            Text(
              "Flutter Form !",
              style: GoogleFonts.lato(
                  fontSize: 30,
                  color: const Color.fromARGB(255, 29, 72, 106),
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: (height * 0.05),
            ),
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Enter your name',
                hintText: 'John Doe',
              ),
              validator: (value) {
                if (value!.isEmpty ||
                    !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                  return 'Please enter a valid name !';
                } else {
                  return null;
                }
              },
            ),
            SizedBox(
              height: (height * 0.05),
            ),
            TextFormField(
              controller: _numberController,
              decoration: const InputDecoration(
                labelText: 'Enter your number',
                hintText: '05 12 34 56 78',
              ),
              validator: (value) {
                if (value!.isEmpty ||
                    !RegExp(r'^(\+\d{1,2}\s?)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}$')
                        .hasMatch(value)) {
                  return 'Please enter a valid number !';
                } else {
                  return null;
                }
              },
            ),
            SizedBox(
              height: (height * 0.05),
            ),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Enter your email',
                hintText: 'johndoe@email.com',
              ),
              validator: (value) {
                if (value!.isEmpty ||
                    !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                        .hasMatch(value)) {
                  return 'Please enter a valid email !';
                } else {
                  return null;
                }
              },
            ),
            SizedBox(
              height: (height * 0.05),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Sign up",
                  style: GoogleFonts.lato(
                    fontSize: 22,
                    color: const Color.fromARGB(255, 29, 72, 106),
                    fontWeight: FontWeight.w300,
                    decoration: TextDecoration.underline,
                    decorationStyle: TextDecorationStyle.solid,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      //Store the current values
                      _prevEmail = _emailController.text;
                      _prevNumber = _numberController.text;
                      _prevName = _nameController.text;

                      //Creating custom snackbar
                      final snackBar = SnackBar(
                        content: Text('Form submitted successfully',
                            style: GoogleFonts.lato(color: Colors.white)),
                        action: SnackBarAction(
                          label: 'Undo',
                          onPressed: () {
                            setState(() {
                              //Restoring the values on the undo action
                              _emailController.text = _prevEmail;
                              _nameController.text = _prevName;
                              _numberController.text = _prevNumber;
                            });
                          },
                        ),
                        backgroundColor: const Color.fromARGB(255, 26, 116, 31),
                      );
                      setState(() {
                        //Clear the text fileds values after being submitted
                        _emailController.text = "";
                        _numberController.text = "";
                        _nameController.text = "";
                      });
                      //Display a snackbar the indicates that the infos were submitted successfully
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 29, 72, 106),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                  ),
                  child: const Icon(
                    Icons.check,
                    color: Colors.white,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
