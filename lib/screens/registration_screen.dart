import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_practice/models/user_model.dart';
import 'package:project_practice/screens/login_screen.dart';
import 'package:project_practice/widgets/common_widget.dart';
import 'package:project_practice/widgets/custom_buttons.dart';
import 'package:project_practice/widgets/textformfield.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final _rePasswordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: customText("Register", 24, fontWeight: FontWeight.bold),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column( 
              children: [
                CustomTextField(
                  controller: _usernameCtrl,
                  hintText: 'Username',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Username is required";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: _phoneCtrl,
                  hintText: 'Phone',
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Phone is required";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: _emailCtrl,
                  hintText: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email is required";
                    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                        return 'Enter a valid email address';
                      }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: _passwordCtrl,
                  hintText: 'Password',
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password is required";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: _rePasswordCtrl,
                  hintText: 'Re-enter Password',
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please re-enter password";
                    } else if (value != _passwordCtrl.text) {
                      return "Passwords do not match";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                CustomButton(
                  label: 'Register',
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final userBox = Hive.box<User>('users');

                      final newUser = User(
                        username: _usernameCtrl.text.trim(),
                        email: _emailCtrl.text.trim(),
                        password: _passwordCtrl.text.trim(),
                        phone: int.parse(_phoneCtrl.text.trim()),
                      );

                      final isExisting = userBox.values.any((user) =>
                          user.username == newUser.username ||
                          user.email == newUser.email);

                      if (isExisting) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('User already exists')),
                        );
                        return;
                      }

                      await userBox.add(newUser);

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Registration successful')),
                      );

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const LoginScreen()),
                      );
                    }
                  },
                  width: 350,
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context,
                          MaterialPageRoute(builder: (_) => const LoginScreen()));
                      },
                      child: const Text("Login"),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
