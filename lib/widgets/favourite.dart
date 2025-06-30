import 'package:flutter/material.dart';

class FavouriteList extends StatelessWidget {

   final List <String>categories;
 const FavouriteList({required this.categories, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 100,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index){
                return Container(

                 decoration: BoxDecoration(
                  border: Border.all(width: 1),
                 ),
                 child: Text(categories[index]),
                ); 
            }
            ),
    );
  }
} 