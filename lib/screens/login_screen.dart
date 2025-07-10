import 'package:flutter/material.dart';
import 'package:project_practice/constants/text_constants.dart';
import 'package:project_practice/controllers/user_controller.dart';
import 'package:project_practice/screens/registration_screen.dart';
import 'package:project_practice/screens/bottom_nav_bar.dart';
import 'package:project_practice/widgets/custom_buttons.dart';
import 'package:project_practice/widgets/textformfield.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final _userController = UserController(); 

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) { 
      final username = _usernameCtrl.text.trim();
      final password = _passwordCtrl.text.trim();

      final isValid = await _userController.checkLogin(username, password);

      if (isValid) {
        final prefs = await SharedPreferences.getInstance();
        prefs.setBool('isLoggedIn', true);
        prefs.setString('loggedInUser', username);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login successful!')),
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => BottomNavPage()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invalid username or password')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Image.asset("assets/images/Component 1.png", fit: BoxFit.cover),
                  const SizedBox(height: 15),
                  CustomTextField(
                    controller: _usernameCtrl,
                    hintText: TextConstants.logHintuser,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter username';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    controller: _passwordCtrl,
                    hintText: TextConstants.logHintpass,
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password required";
                      } else if (value.length < 6) {
                        return "Password must be at least 6 characters";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),
                  CustomButton(
                    label: TextConstants.logButtn,
                    onPressed: _login,
                    width: 350,
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     Text(TextConstants.logReg),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => RegistrationScreen()),
                          );
                        },
                        child: const Text(
                         TextConstants.logSign,
                          style: TextStyle(
                            fontSize: 17,
                            color: Color.fromARGB(255, 179, 109, 3),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 40),
                  CustomButton(label: "Google", onPressed: (){},width: 350,backgroundColor: const Color.fromRGBO(230, 219, 205, 1), ),
                  SizedBox(height: 30),
                  CustomButton(label: "Apple", onPressed: (){},width: 350,backgroundColor: const Color.fromRGBO(230, 219, 205, 1),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
