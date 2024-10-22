import 'package:flutter/material.dart';
import 'package:tp1_2/components/MyButton.dart';
import 'package:tp1_2/components/my_textfield.dart';
import 'package:tp1_2/model/contact.dart';
import 'package:tp1_2/dataBase/database_helper.dart';
import 'package:tp1_2/constant/myColors.dart';

class EditContactForm extends StatefulWidget {
  final Contact contact;
  
  const EditContactForm({super.key, required this.contact});

  @override
  _EditContactFormState createState() => _EditContactFormState();
}

class _EditContactFormState extends State<EditContactForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _numberController;
  final dbHelper = DatabaseHelper();

  @override
  void initState() {
    super.initState();
    // Initialize the text controllers with contact's current data
    _nameController = TextEditingController(text: widget.contact.name);
    _numberController = TextEditingController(text: widget.contact.number);
  }

  void _updateContact() async {
    if (_formKey.currentState!.validate()) {
      Contact updatedContact = Contact(
        id: widget.contact.id,
        name: _nameController.text,
        number: _numberController.text,
        photoUrl: widget.contact.photoUrl, // Keep the same photo
      );

      await dbHelper.updateContact(updatedContact);

      Navigator.pop(context, updatedContact); // Pass the updated contact back
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("Edit Contact", style: TextStyle(color: Colors.white)),
        backgroundColor: myBlue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              MyTextField(
                controller: _nameController,
                hintText: "Name",
                obsecureText: false,
              ),
              const SizedBox(height: 20),
              MyTextField(
                controller: _numberController,
                hintText: "Number",
                obsecureText: false,
                
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _updateContact,
                child: Text("Update Contact"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: myBlue,
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
