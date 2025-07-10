import 'dart:io';

import 'package:flutter/material.dart';
import 'package:project_practice/models/book.dart';

class CustomBooklistcard extends StatelessWidget {
  final Book booked;
  const CustomBooklistcard({
    super.key,
    required this.booked
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 200,
        child: Card(
          elevation: 7,
          color: const Color.fromARGB(255, 244, 191, 186),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  decoration: BoxDecoration(
                    image: booked.imagePath != null ?
                    DecorationImage(image: FileImage(File(booked.imagePath!)),
                    fit: BoxFit.cover,
                    )
                    : null,
                  ),
                  child: booked.imagePath == null 
                  ? Icon(Icons.image, size: 100, color: Colors.black) 
                  :
                  null,
                  // color: Colors.amber,
                  // height: 250,
                  // width: 150,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(booked.bookName,style: TextStyle(fontSize: 20),
                      overflow: TextOverflow.ellipsis,
                      ),
                      Text(booked.authorName,style: TextStyle(fontSize: 20),),
                      Text(booked.description,style: TextStyle(fontSize: 20),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}