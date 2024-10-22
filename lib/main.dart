import 'package:flutter/material.dart';
import 'package:tp1_2/pages/home_page.dart';
import 'package:tp1_2/pages/login_page.dart';
import 'package:tp1_2/themes/light_mode.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();  // Ensure bindings are initialized
  //await Firebase.initializeApp(); // Uncomment if you're using Firebase
  
  // Check login state
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isLoggedIn ? HomePage() : LoginPage(),
      theme: LightMode,
    );
  }
}
