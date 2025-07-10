import 'package:flutter/material.dart';

Widget customText(String text,double size,{FontWeight fontWeight = FontWeight.normal}){
  return Text(
    text,
    style: TextStyle(
      fontWeight: fontWeight ,
      fontSize: size
    )
  );
}