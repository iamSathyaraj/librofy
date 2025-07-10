import 'package:flutter/material.dart';
import 'package:project_practice/controllers/book_controller.dart';
import 'package:project_practice/models/book.dart';
import 'package:project_practice/screens/edit_book_screen.dart';
// import 'package:project_practice/widgets/custom_single_book.dart';
import 'package:project_practice/widgets/single_book.dart';

class SingleDetails extends StatefulWidget {
  final Book book;
  final int index;

  const SingleDetails({
    super.key,
    required this.book,
    required this.index,
  });

  @override
  State<SingleDetails> createState() => _SingleDetailsState();
}

class _SingleDetailsState extends State<SingleDetails> {
  final BookController _bookController = BookController();

  void _deleteBookDirectly() {
  _bookController.deleteBook(widget.index);
  Navigator.of(context).pop(); 
}

  void _editBook() {
  Navigator.push(context, MaterialPageRoute(builder: (context)=>EditBookScreen(index: widget.index),));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Book Details"),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: _editBook,
            tooltip: 'Edit',
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: _deleteBookDirectly,
            tooltip: 'Delete',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: CustomSingleBook(singleBook: widget.book),
        ),
      ),
    );
  }
}
