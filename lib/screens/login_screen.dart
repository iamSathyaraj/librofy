import 'package:flutter/material.dart';
import 'package:project_practice/screens/registration_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:project_practice/screens/bottom_nav_bar.dart';
import 'package:project_practice/widgets/textformfield.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
 final _formKey =GlobalKey<FormState>();
 final _usernameCtrl = TextEditingController();
 final _passwordCtrl = TextEditingController();
 Future<void> _login()async{
   if(_formKey.currentState!.validate()){
     final pref = await SharedPreferences.getInstance();
     pref.setBool('isLoggedIn',true);
      
     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BottomNavPage()));
   }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("login"),
        centerTitle: true,
      ),
      body:Center(
        child: SingleChildScrollView(
           child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _formKey,
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: _usernameCtrl,
                        labelText: 'username',
                        hintText: 'Enter username',
                        validator: (value){
                          if(value==null || value.isEmpty){
                            return 'Enter username';
                          } 
                          else {
                            return null;
                          }
                        }
                      ),
                      SizedBox(
                        height: 20
                      ),
                      CustomTextField(
                        controller: _passwordCtrl,
                        labelText: 'password',
                        hintText: 'password',
                        obscureText: true,
                        validator : (value) {
                          if(value==null || value.isEmpty){
                            return "password required";
                          }
                          else if(value.length<6) {
                            return "password must atleast 6 characters long";                         
                          }
                          else {
                            return null;
                          }
                        }
                      ),
                      SizedBox(
                        width: 80,
                        height: 30,
                      ),
                                              
                      ElevatedButton(
                        onPressed: _login,
                          style: ElevatedButton.styleFrom(
                             minimumSize: Size(
                               MediaQuery.of(context).size.width * 0.85, 
                               MediaQuery.of(context).size.height * 0.06, 
                             ),
                            backgroundColor: Color.fromARGB(255, 6, 6, 6), 
                            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                            ),
                          ),
                        child: Text(
                         'LOGIN',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15
                      ),
                                              
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account?"),
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>RegistrationScreen()));
                            },
                            child: Text(" Sign up",
                              style: TextStyle(
                                fontSize: 17,
                                color: const Color.fromARGB(255, 179, 109, 3),
                              ),
                            ),
                          )
                        ],
                      ),
                                 
                    ],
                                
                  ),
                ),
              ),
           ),
        ),
      ),            
    );
  }
}