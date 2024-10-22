import 'package:flutter/material.dart';
import 'package:tp1_2/components/MyButton.dart';
import 'package:tp1_2/components/my_textfield.dart';
import 'package:tp1_2/constant/myColors.dart';
import 'package:flutter/material.dart';
import 'package:tp1_2/dataBase/database_helper.dart';
import 'package:tp1_2/model/contact.dart';

class AddContactForm extends StatefulWidget {
  @override
  _AddContactFormState createState() => _AddContactFormState();
}

class _AddContactFormState extends State<AddContactForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _photoUrlController = TextEditingController();
  final dbHelper = DatabaseHelper();

  void _saveContact() async {
    final name = _nameController.text;
    final number = _numberController.text;
    final photoUrl = _photoUrlController.text;

    if (name.isNotEmpty && number.isNotEmpty) {
      final newContact = Contact(name: name, number: number, photoUrl: photoUrl);
      await dbHelper.insertContact(newContact);
      Navigator.pop(context, newContact); // Close the form after saving
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("Add Contact", style: TextStyle(color: Colors.white)),
        backgroundColor: myBlue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            MyTextField(
              hintText: "name",
              controller: _nameController,
              obsecureText: false,
            ),
            SizedBox(height: 20,),
            MyTextField(
              hintText: "Number",
              controller: _numberController,
              obsecureText: false,            ),
              SizedBox(height: 20,),
            MyTextField(
              hintText: "Photo URL",
              controller: _photoUrlController,
              obsecureText: false,
            ),
            SizedBox(height: 30),
            Container(
              width: 200,
              child: MyButton(
                onTap: _saveContact,
                text: "Save Contact",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
