import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:project_practice/models/user_model.dart';
import 'package:project_practice/screens/splashscreen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}
