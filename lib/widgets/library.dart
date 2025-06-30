import 'package:flutter/material.dart';

class HomeLibrary extends StatelessWidget {
  final List<String>libraries;

  const HomeLibrary({required this.libraries, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ListView.builder(
        itemCount: libraries.length,
        itemBuilder: (context, index) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                child: Text(libraries[index]),
                height: 100,
                color: Colors.blue,
               
              ),
              Container(
                child: Text(libraries[index]),
              height: 100,
              color: Colors.amber,
              )
          
            ],
          );
        
      }
      ,
      
        ),
    );
  }
}