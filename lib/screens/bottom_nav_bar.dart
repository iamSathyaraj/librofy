import 'package:flutter/material.dart';
import 'package:project_practice/screens/add_detail_list.dart';
import 'package:project_practice/screens/dashboard_screen.dart';
import 'package:project_practice/screens/details_page.dart';
import 'package:project_practice/screens/homescreen.dart';
import 'package:project_practice/screens/profile.dart';

class BottomNavPage extends StatefulWidget {
  const BottomNavPage({super.key});

  @override
  State<BottomNavPage> createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  int _selectedIndex=0;
  List<Widget> widgetOptions=[
    HomeScreen(),
    DetailsPage(),
    AddDetailList(),
    DashboardScreen(),
    Profile()
  ];
  @override
  Widget build(BuildContext context) {
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
        items: [
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