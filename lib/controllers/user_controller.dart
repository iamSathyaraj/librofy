import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_practice/models/user_model.dart';

class UserController {
  Future<void> addUser(User user) async {
    final box = await Hive.openBox<User>('users');
    await box.add(user);
  }

  Future<List<User>> getAllUsers() async {
    final box = await Hive.openBox<User>('users');
    return box.values.toList();
  }

  Future<bool> checkLogin(String username, String password) async {
    final box = await Hive.openBox<User>('users');
    return box.values.any((user) =>
        user.username == username && user.password == password);
  }

  Future<User?> getLoggedInUser(String username) async {
    final box = await Hive.openBox<User>('users');
    final matches =
        box.values.where((user) => user.username == username);
    return matches.isNotEmpty ? matches.first : null;
  }

  Future<bool> isUsernameTaken(String username) async {
    final box = await Hive.openBox<User>('users');
    return box.values.any((user) => user.username == username);
  }
}

