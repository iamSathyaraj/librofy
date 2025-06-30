import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project_practice/screens/homescreen.dart';
import 'package:project_practice/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
 

  @override
  void initState() { 
    super.initState();
    _getInitialScreen();
  }
  Future<void>_getInitialScreen() async{
    final pref =await SharedPreferences.getInstance();
    bool isLogedIn = pref.getBool('isLogeIn') ?? false;
    await Future.delayed(Duration(seconds: 3));
    if(isLogedIn){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
    }
    else{
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Image.asset('assets/images/Logo.png'),
      ),
    );
  }
}