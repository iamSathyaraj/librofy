import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:project_practice/constants/text_constants.dart';
import 'package:project_practice/models/user_model.dart';
import 'package:project_practice/screens/edit_profile.dart';
import 'package:project_practice/screens/login_screen.dart';
import 'package:project_practice/widgets/custom_buttons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
   String username = '';
   String email = '';
   String phone =''; 
   String password ='';

 @override
  void initState() {
    super.initState();
    _loadUserFromHive();
  }
 Future<void> _loadUserFromHive() async {
  final prefs = await SharedPreferences.getInstance();
  final currentUsername = prefs.getString('loggedInUser');
  if (currentUsername == null) return;

  final userBox = Hive.box<User>('users');
  final matches = userBox.values.where((u) => u.username == currentUsername);
  final user    = matches.isNotEmpty ? matches.first : null;
  if (user == null) return;

  setState(() {
    username = user.username;
    email    = user.email;
    phone    = user.phone.toString();
    password = user.password;
  });
}

Future<void> _logOut() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('loggedInUser');

 Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(builder: (context) => LoginScreen()),
    (route) => false,
  );}




 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Profile")),
      body: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(255, 141, 118, 1),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(12))
                ),
                height: 180,
                width: double.infinity,
                
              ),
              const Positioned(
                bottom: -50,
                child: CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person,size: 50),
                ),
              ),
            ],
          ),
          const SizedBox(height: 70),
          CustomButton(label: TextConstants.profileEdit,width: 150,height: 40,
           onPressed: () async {
             await Navigator.push(
                  context,
    MaterialPageRoute(
      builder: (context) => EditProfile(
        username: username,
        email: email,
        password: password,
        phone: phone,
      ),
    ),
  );
  _loadUserFromHive(); 
},

          ),
          
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.grey                 
                     ),
                  child: ListTile(
                    leading: const Icon(Icons.person),
                    title: Text(TextConstants.profileUsername),
                    subtitle: Text(username),
                  ),
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.email),
                  title: const Text(TextConstants.profileEmail),
                  subtitle: Text(email),
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.phone),
                  title: const Text(TextConstants.profilePhn),
                  subtitle: Text(phone.toString()),
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.lock),
                  title: const Text(TextConstants.profilePasswd),
                  subtitle: Text(password),
                ),
                const Divider(),
                ListTile(
                  onTap: _logOut,
                  leading: const Icon(Icons.logout),
                  title: const Text(TextConstants.profLogt),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
