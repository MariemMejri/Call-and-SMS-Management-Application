import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:tp1_2/model/contact.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;
  static Database? _db;

  final String tableContact = 'contacts';
  final String columnId = 'id';
  final String columnName = 'name';
  final String columnNumber = 'number';
  final String columnPhotoUrl = 'photoUrl';

  DatabaseHelper.internal();

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  Future<Database> initDb() async {
    String path = join(await getDatabasesPath(), 'contacts.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE $tableContact (
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnName TEXT NOT NULL,
            $columnNumber TEXT NOT NULL,
            $columnPhotoUrl TEXT NOT NULL
          )
        ''');
      },
    );
  }

  // Insert a contact
  Future<int> insertContact(Contact contact) async {
    final dbClient = await db;
    return await dbClient!.insert(tableContact, contact.toMap());
  }

  // Get all contacts
  Future<List<Contact>> getContacts() async {
    final dbClient = await db;
    final List<Map<String, dynamic>> maps = await dbClient!.query(tableContact);

    return List.generate(maps.length, (i) {
      return Contact.fromMap(maps[i]);
    });
  }

  // Delete a contact
  Future<int> deleteContact(String num) async {
    final dbClient = await db;
    return await dbClient!.delete(tableContact, where: '$columnNumber = ?', whereArgs: [num]);
  }

  // Update a contact
  Future<int> updateContact(Contact contact) async {
    final dbClient = await db;
    return await dbClient!.update(
      tableContact,
      contact.toMap(),
      where: '$columnId = ?',
      whereArgs: [contact.id],
    );
  }
}
