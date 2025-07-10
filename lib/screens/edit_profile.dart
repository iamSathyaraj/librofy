import 'package:flutter/material.dart';
import 'package:project_practice/constants/text_constants.dart';
import 'package:project_practice/widgets/common_widget.dart';
import 'package:project_practice/widgets/custom_buttons.dart';
import 'package:project_practice/widgets/textformfield.dart';
import 'package:project_practice/models/user_model.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfile extends StatefulWidget {
  final String username;
  final String email;
  final String password;
  final String phone;

  const EditProfile({
    super.key,
    required this.username,
    required this.email,
    required this.password,
    required this.phone,
  });

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late TextEditingController _usernameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController(text: widget.username);
    _emailController   = TextEditingController(text: widget.email);
    _passwordController= TextEditingController(text: widget.password);
    _phoneController   = TextEditingController(text: widget.phone);
  }

  Future<void> _updateProfile() async {
    final prefs = await SharedPreferences.getInstance();
    final currentUsername = prefs.getString('loggedInUser');
    if (currentUsername == null) return;

    final userBox = Hive.box<User>('users');

    int? foundKey;
    for (var k in userBox.keys) {
      final user = userBox.get(k);
      if (user != null && user.username == currentUsername) {
        foundKey = k as int;
        break;
      }
    }

    if (foundKey != null) {
      final updatedUser = User(
        username: _usernameController.text.trim(),
        email:    _emailController.text.trim(),
        password: _passwordController.text.trim(),
        phone:    int.parse(_phoneController.text.trim()),
      );
      
      await userBox.put(foundKey, updatedUser);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Profile updated successfully")),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [

              Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    color: Colors.blue,
                  ),
                  const Positioned(
                    bottom: -50,
                    child: CircleAvatar(
                      radius: 70,
                      backgroundColor: Colors.amber,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 60),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customText('Username', 20),
                    CustomTextField(
                      controller: _usernameController,
                      hintText: 'Enter username',
                    ),
                    const SizedBox(height: 20),

                    customText('Email', 20),
                    CustomTextField(
                      controller: _emailController,
                      hintText: 'Enter email',
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 20),

                    customText('Phone Number', 20),
                    CustomTextField(
                      controller: _phoneController,
                      hintText: 'Enter phone number',
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(height: 20),

                    customText('Password', 20),
                    CustomTextField(
                      controller: _passwordController,
                      hintText: 'Enter password',
                      obscureText: true,
                    ),
                    const SizedBox(height: 30),

                  CustomButton(label: TextConstants.profSave, onPressed: _updateProfile,width: 150,)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
