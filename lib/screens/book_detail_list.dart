import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:project_practice/models/book.dart';
import 'package:project_practice/screens/single_details.dart';
import 'package:project_practice/widgets/custom_booklistcard.dart';
import 'package:project_practice/widgets/custom_search_bar.dart';

class AddDetailList extends StatefulWidget {
  const AddDetailList({super.key});

  @override
  State<AddDetailList> createState() => _AddDetailListState();
}

class _AddDetailListState extends State<AddDetailList> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("All Books")),
      body: ValueListenableBuilder<Box<Book>>(
        valueListenable: Hive.box<Book>('books').listenable(),
        builder: (context, box, _) {
         
          final allBooks = box.values.toList();

          final query = _searchController.text.toLowerCase();
          final filteredList = query.isEmpty
              ? allBooks
              : allBooks.where((book) {
                  return book.bookName.toLowerCase().contains(query) ||
                         book.authorName.toLowerCase().contains(query);
                }).toList();

          return Column(
            children: [
              CustomSearchBar(
                controller: _searchController,
                onChanged: (_) {
                
                  setState(() {});
                },
              ),

              Expanded(
                child: ListView.builder(
                  itemCount: filteredList.length,
                  itemBuilder: (context, index) {
                    final book = filteredList[index];
                    return GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => SingleDetails(
                            book: book,
                            index: index,
                          ),
                        ),
                      ),
                      child: CustomBooklistcard(booked: book),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

