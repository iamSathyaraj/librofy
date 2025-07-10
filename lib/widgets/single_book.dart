import 'dart:io';
import 'package:flutter/material.dart';
import 'package:project_practice/models/book.dart';

class CustomSingleBook extends StatelessWidget {
  final Book singleBook;

  const CustomSingleBook({
    super.key,
    required this.singleBook,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 500,
              width: 380,
              child: Card(
                color: Colors.orange.shade100,
                elevation: 8,
                shadowColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 220,
                        width: 280,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                          image: singleBook.imagePath != null
                              ? DecorationImage(
                                  image: FileImage(File(singleBook.imagePath!)),
                                  fit: BoxFit.cover,
                                )
                              : null,
                        ),
                        child: singleBook.imagePath == null
                            ? const Center(
                                child: Icon(Icons.image, size: 50, color: Colors.black),
                              )
                            : null,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        singleBook.bookName,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        singleBook.authorName,
                        style: const TextStyle(
                          fontSize: 18
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Chip(
                            label: Text(singleBook.category),
                          ),
                          Text(singleBook.pageNumber.toString()),
                          Text(" ${singleBook.rating.toString()}"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Colors.amber.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              height: 200,
              width: double.infinity,
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Text(
                  singleBook.description,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:project_practice/models/book.dart';


// class CustomSingleBook extends StatelessWidget {
//   final Book singleBook;
  
//   const CustomSingleBook({
//     super.key,
//     required this.singleBook
   
//     });

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             SizedBox(
//               height: 500,
//               width: 380,
//               child: Card(
//                 color: Colors.orange,
//                 elevation: 50,
//                 shadowColor: const Color(0xFF000000),
//                 child: Padding(
//                   padding: const EdgeInsets.all(15.0),
//                   child: Column(
//                     children: [
//                       Flexible(
//                         child: Container(
//                           height: 300,
//                           width: 250,
//                           color: Colors.brown,
//                           ),
//                       ),
//                       Text(
//                         singleBook.bookName,
//                         overflow: TextOverflow.ellipsis,
//                         style: TextStyle(fontSize: 25),),
//                       Text(
//                         singleBook.authorName,
//                         overflow: TextOverflow.ellipsis,
//                         style: TextStyle(fontSize: 25),),
//                       Text(
//                         overflow: TextOverflow.ellipsis,
//                         singleBook.category,
//                         style: TextStyle(fontSize: 25),),
//                       Text(
//                         singleBook.authorName,
//                         overflow: TextOverflow.ellipsis,
//                         style: TextStyle(fontSize: 25),),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           Container(
//                             color: Colors.white,
//                             child: Padding(
//                               padding: const EdgeInsets.all(5.0),
//                               child: Text(
//                                 singleBook.category,
//                                 style: TextStyle(fontSize: 25),),
//                             )),
//                           Text( 
//                             singleBook.pageNumber.toString(),),
//                           ],
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 50,
//             ),
//             Container(
//               decoration: BoxDecoration(
//                 color: Colors.amber,
//                 borderRadius: BorderRadius.circular(12)
//               ),
//               height: 300,
//               width: 330,
//               child: Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: Text(
//                   singleBook.description),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }