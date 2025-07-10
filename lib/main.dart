import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:project_practice/models/book.dart';
import 'package:project_practice/models/user_model.dart';
import 'package:project_practice/screens/splashscreen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(BookAdapter());

  await Hive.openBox<User> ('users');
  await Hive.openBox<Book>('books'); 
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
