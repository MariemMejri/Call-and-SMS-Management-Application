import 'package:flutter/material.dart';
import 'package:tp1_2/model/contact.dart';

class ContactTile extends StatelessWidget {
  final Contact contact;
  ContactTile({
    super.key,
    required this.contact,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(12)),
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.symmetric(vertical: 25, horizontal: 10),
      child: ListTile(
        title: Text(contact.name),
        subtitle: Text(contact.number),
        leading: Image.asset(contact.photoUrl),
        onTap: () {
              // Handle tap event for contact
              print('Tapped on ${contact.name}');
            },
        //trailing: IconButton(icon: icon, onPressed: onPressed),
      ),
    );
  }
}
