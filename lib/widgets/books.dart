  import 'package:flutter/material.dart';
  import 'package:project_practice/models/book.dart';
  import 'dart:io';
  class CustomCard extends StatelessWidget {
  final Book books; 

    const CustomCard({
      super.key,
      required this.books,
      
    });


    @override
    Widget build(BuildContext context) {
      
        return  SizedBox(
          height: 200,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 50,
              color: const Color.fromARGB(255, 195, 145, 121),
              shadowColor: Colors.black,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 6,
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[300],
                            image: books.imagePath != null
                            ? DecorationImage(
                              image: FileImage(File(books.imagePath!)), // for local image
                              fit: BoxFit.cover,
                                )
                                : null,
                              ),
                            child: books.imagePath == null
                            ? const Center(child: Icon(Icons.image, size: 40, color: Colors.black54))
                            : null,
                      ),

                    ),
                    SizedBox(height: 15),
                    Expanded(
                      flex: 2,
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            books.bookName,
                            overflow: TextOverflow.ellipsis,
                          ),
                      
                      Text(
                        books.authorName,
                        overflow: TextOverflow.ellipsis,
                      ),
                      ],
                      ),
                    ),
                ]
                ),
              ),
                              
            ),
          ),
        );
      
    }
    }

  // import 'package:flutter/material.dart';

  // class CustomCoverPage extends StatelessWidget {
  //   final String author;
  //   final int price;
  //   final String bookName;
  //   final String imagePath;
    

  //   const CustomCoverPage({
  //     required this.author,
  //     required this.bookName,
  //     required this.price,
  //     required this.imagePath
  //     });

  //   @override
  //   Widget build(BuildContext context) {
  //     return Stack(
  //       children:[ 
  //         Container(
  //       ),
  //       ]
  //     );
  //   }
  // }