import 'package:flutter/material.dart';
import 'package:project_practice/widgets/favourite.dart';
import 'package:project_practice/widgets/library.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String>libraryCategory = ["hellofbxdfbzxzb","hellofbxdfbzxzb","hellofbxdfbzxzb","hellofbxdfbzxzb","hellofbxdfbzxzb","hellofbxdfbzxzb","hellofbxdfbzxzb","hellofbxdfbzxzb","hellofbxdfbzxzb","hellofbxdfbzxzb"];
  final List<String>bookCategories = ["hellofbxdfbzxzb","jhbhellofbxdfbzxz","hellofbxdfbzxzb","hellofbxdfbzxzb","hellofbxdfbzxzb","hellofbxdfbzxzb","hellofbxdfbzxzb","hellofbxdfbzxzb","hellofbxdfbzxz"];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Scaffold(
          appBar: AppBar(),
          
          body: Column(
            children: [
              SizedBox(
                height: 100,
                child: FavouriteList(categories: bookCategories),
              ),
              SizedBox(
                width: double.infinity,
                height: 20,
              ),
              Container(
                height: 100,
                width: double.infinity,
                color: const Color.fromARGB(255, 155, 115, 75),
                child: Center(child: Text("More Content")),
              ),
              
             Expanded(
                child: SizedBox(
                  width: double.infinity,
                  child: HomeLibrary(libraries: libraryCategory),
                ),
             )
            ]
          ),
        ),
      ),
    );
  }
}