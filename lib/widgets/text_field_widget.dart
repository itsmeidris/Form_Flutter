//Text fields allow users to type text into an app.
//They are used to build forms, send messages, create search experiences...etc.

import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({super.key});

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final myNameController = TextEditingController();
  final myPasswordController = TextEditingController();

  //State variable for the current value of the TextField
  String myCurrentUserNameValue = '';
  String myCurrentPasswordValue = '';

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myNameController.dispose();
    myPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: TextField(
            autofocus: true, //Make the text field focusable 
            controller: myNameController, //Adding the controller property
            onChanged: (textLatestValue) {
              setState(() {
                myCurrentUserNameValue = textLatestValue;
              });
            },
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter your username',
                hintText: 'eg : edris02'
            ),
          ),
        ),
        //TextFormField wraps a TextField and integrates it with the
        //enclosing Form. This provides additional functionality,
        //such as validation and integration with other FormField widgets.
        Padding(
          padding: const EdgeInsets.all(8),
          child: TextFormField(
            autofocus: true,
            controller: myPasswordController,
            onChanged: (textLatestValue){
              setState(() {
                myCurrentPasswordValue = textLatestValue;
              });
            },
            decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter your password',
                hintText: 'eg : Abc@#1234.'
            ),
          ),
        ),

        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                'Current username value is: $myCurrentUserNameValue',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                'Current passowrd value is: $myCurrentPasswordValue',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: FloatingActionButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: SizedBox(
                        width: 200,
                        height: 100,
                        child: Column(
                          children: [
                            Text(myNameController.text),
                            Text(myPasswordController.text)
                          ],
                        ),
                      ),
                    );
                  });
            },
            tooltip: 'Show me the value',
            child: const Icon(Icons.text_fields),
          ),
        )
      ],
    );
  }
}
