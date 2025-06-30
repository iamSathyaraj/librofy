import 'package:flutter/material.dart';
import 'package:project_practice/screens/login_screen.dart';
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
  final _emailCtrl =TextEditingController();
  final _passwordCtrl = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Registration page"),),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child:Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    CustomTextField(
                      controller: _usernameCtrl,
                      labelText: 'username',
                      hintText: 'username',
                      validator: (value) {
                        if(value == null || value.isEmpty){
                          return "username required";
                        } 
                        else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 20
                    ),
                    CustomTextField(
                      controller: _phoneCtrl,
                      labelText: 'phone',
                      hintText: 'phone',
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if(value == null || value.isEmpty){
                          return "username required";
                        } 
                        else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 20
                    ),
                    CustomTextField(
                      controller: _emailCtrl,
                      labelText: 'email',
                      hintText: 'email',
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if(value == null || value.isEmpty){
                          return "email is  required";
                        } 
                        else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 20
                    ),
                    CustomTextField(
                      controller: _passwordCtrl,
                      labelText: 'password',
                      hintText: 'password',
                      validator: (value) {
                        if(value == null || value.isEmpty){
                          return "username required";
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
                      labelText: 'Confirm Password',
                      hintText: 'Password',
                      validator: (value) {
                        if(value == null || value.isEmpty){
                          return "username required";
                          } 
                          else {
                            return null;
                          }
                      }
                    ),
                    
                    SizedBox(
                      width: double.infinity,
                      height: 80,
                    ),
                    ElevatedButton(
                      onPressed: () { 

                      },
                      style: ElevatedButton.styleFrom(
                         minimumSize: Size(
                           MediaQuery.of(context).size.width * 0.85, 
                           MediaQuery.of(context).size.height * 0.06, 
                         ),
                        backgroundColor: Color.fromARGB(255, 0, 5, 4), 
                        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text('REGISTER',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an Account"),
                          InkWell(
                           onTap: (){
                             Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen())
                             );
                           },
                            child: Text(" Login",
                              style: TextStyle(
                                color: const Color.fromARGB(255, 190, 130, 40),
                                fontSize: 17,
                              ),
                            )
                          )
                       ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
          
        
      ),
    );
  }
}