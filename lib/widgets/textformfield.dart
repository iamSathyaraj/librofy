import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController ?controller;
  final bool obscureText;
  final String labelText;
  final String hintText;
  final TextInputType keyboardType;
  final String? Function(String?)?validator;
  
 const CustomTextField({
    super.key,
     required this.controller,
     this.obscureText=false,
     required this.labelText,
     required this.hintText,
     this.keyboardType=TextInputType.text,
      this.validator
     });

 

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 60,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        validator: validator,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color.fromRGBO(230, 219, 205, 1),
          labelText: labelText,
          hintText: hintText,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12)
          )
        ),
      ),
    );
  }
}