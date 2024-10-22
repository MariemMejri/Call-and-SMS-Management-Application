import 'package:flutter/material.dart';
import 'package:tp1_2/components/MyButton.dart';
import 'package:tp1_2/components/my_textfield.dart';
import 'package:tp1_2/constant/myColors.dart';
import 'package:tp1_2/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({super.key, this.onTap});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _stayConnected = false;  // New variable to track checkbox state

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  // Check if user is already logged in with "Stay Connected"
  void _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isLoggedIn = prefs.getBool('isLoggedIn');
    if (isLoggedIn != null && isLoggedIn) {
      // Navigate to HomePage if already logged in
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    }
  }

  // Login Method
  void login(BuildContext context) async {
    if (_emailController.text == 'admin' && _passwordController.text == '1234') {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      
      // Save the login state based on the "Stay Connected" checkbox
      await prefs.setBool('isLoggedIn', _stayConnected);

      // Navigate to HomePage after login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      // Show an error message if login fails
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid username or password')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.lock,
              size: 60,
              color: Theme.of(context).colorScheme.tertiary,
            ),
            const Text("Welcome To Our App ", style: TextStyle(fontSize: 25, color: Colors.black)),

            const SizedBox(height: 20),
            const Text("Sign In", style: TextStyle(fontSize: 20, color: Colors.black)),
            const SizedBox(height: 50),
            MyTextField(
              hintText: "Email",
              obsecureText: false,
              controller: _emailController,
            ),
            const SizedBox(height: 15),
            MyTextField(
              hintText: "Password",
              obsecureText: true,
              controller: _passwordController,
            ),
            const SizedBox(height: 50),
            MyButton(
              text: "Login",
              onTap: () => login(context),
            ),
            const SizedBox(height: 20),

            // Checkbox to stay connected
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  value: _stayConnected,
                  onChanged: (bool? value) {
                    setState(() {
                      _stayConnected = value ?? false;
                    });
                  },
                ),
                const Text("Stay Connected", style: TextStyle(color: Colors.black)),
              ],
            ),

            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Not a member?", style: TextStyle(color: Colors.black)),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    " Register Now",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: myBlue),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
