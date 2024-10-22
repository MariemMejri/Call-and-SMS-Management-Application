import 'package:flutter/material.dart';
import 'package:tp1_2/model/contact.dart';

class Repertoire extends ChangeNotifier {

    final List<Contact> contacts = [
    Contact(
        name: 'John Doe',
        number: '+1 234 567 890',
        photoUrl: 'https://via.placeholder.com/150'),
    Contact(
        name: 'Jane Smith',
        number: '+1 987 654 321',
        photoUrl: 'https://via.placeholder.com/150'),
    Contact(
        name: 'Alice Johnson',
        number: '+1 555 555 555',
        photoUrl: 'https://via.placeholder.com/150'),
  ];

    List<Contact> get repertoire => contacts;

}
