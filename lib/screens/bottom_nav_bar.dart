import 'package:flutter/material.dart';
// import 'package:project_practice/models/book.dart';
import 'package:project_practice/screens/add_books.dart';
import 'package:project_practice/screens/book_detail_list.dart';
import 'package:project_practice/screens/dashboard_screen.dart';
import 'package:project_practice/screens/homescreen.dart';
import 'package:project_practice/screens/profile_screen.dart';

class BottomNavPage extends StatefulWidget {
  final int initialIndex;
  const BottomNavPage({super.key, this.initialIndex=0});

  @override
  State<BottomNavPage> createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  late int _selectedIndex;  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedIndex = widget.initialIndex;
  }
 
  @override
  Widget build(BuildContext context) {
     List<Widget> widgetOptions=[
    HomeScreen(),
    AddDetailList(),
    AddBooks(),
    DashboardScreen(),
   
    ProfileScreen(),

  ];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
          _selectedIndex=index; 
          }
          );
        },
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.description),label: 'Details'),
          BottomNavigationBarItem(icon: Icon(Icons.add),label: 'Add'),
          BottomNavigationBarItem(icon: Icon(Icons.dashboard),label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Profile')
        ],
       
      ),

      body: IndexedStack(
        index: _selectedIndex,
        children: widgetOptions,
      ),

      );
  }
}