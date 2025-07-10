import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:project_practice/models/book.dart';
import 'package:project_practice/widgets/BarChartSmpl.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String? currentUser;

  @override
  void initState() {
    super.initState();
    _loadCurrentUser();
  }

  Future<void> _loadCurrentUser() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      currentUser = prefs.getString('loggedInUser');
    });
  }

  @override
  Widget build(BuildContext context) {
    final bookBox = Hive.box<Book>('books');

    if (currentUser == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final books = bookBox.values.where((b) => b.addeBy == currentUser).toList();
    final Map<String, int> categoryCounts = {};
    for (var book in books) {
      categoryCounts[book.category] = (categoryCounts[book.category] ?? 0) + 1;
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: categoryCounts.isEmpty
            ? const Center(child: Text("No books to display."))
            : BarChartSample(bookCategoryCounts: categoryCounts),
      ),
    );
  }
}
