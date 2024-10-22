import 'package:flutter/material.dart';

class Contact {
  int? id;
  final String name;
  final String number;
  final String photoUrl;

  Contact({this.id,required this.name, required this.number, required this.photoUrl});


  

 Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'number': number,
      'photoUrl': photoUrl,
    };
  }

  // Convert Map to Contact object
  factory Contact.fromMap(Map<String, dynamic> map) {
    return Contact(
      id: map['id'],
      name: map['name'],
      number: map['number'],
      photoUrl: map['photoUrl'],
    );
  }


}

