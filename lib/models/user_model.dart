
import 'package:hive_flutter/adapters.dart';
part 'user_model.g.dart';

@HiveType(typeId: 0)

class User{
 @HiveField(0)
 final String username;

 @HiveField(1)
 final String password;

 @HiveField(2)
 final String email;

 @HiveField(3)
 final int phone;
 User({required this.username,
   required this.password,
   required this.email,
   required this.phone
   }
  );

}