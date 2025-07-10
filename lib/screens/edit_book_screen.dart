import 'package:flutter/material.dart';
import 'package:project_practice/constants/text_constants.dart';
import 'package:project_practice/controllers/book_controller.dart';
import 'package:project_practice/models/book.dart';
import 'package:project_practice/screens/homescreen.dart';
import 'package:project_practice/widgets/custom_buttons.dart';
import 'package:project_practice/widgets/textformfield.dart';

class EditBookScreen extends StatefulWidget {
  final int index; 

  const EditBookScreen({super.key, required this.index});

  @override
  State<EditBookScreen> createState() => _EditBookScreenState();
}

class _EditBookScreenState extends State<EditBookScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _bookNameController = TextEditingController();
  final TextEditingController _authorController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _ratingController = TextEditingController();
  final TextEditingController _pageController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  final BookController _bookController = BookController();

  @override
  void initState() {
    super.initState();
    final Book book = _bookController.getBook(widget.index);

    _bookNameController.text = book.bookName;
    _authorController.text = book.authorName;
    _categoryController.text = book.category;
    _ratingController.text = book.rating.toString();
    _pageController.text = book.pageNumber.toString();
    _descController.text = book.description;
  }

  Future<void> update() async {
    if (_formKey.currentState!.validate()) {
       final oldBook = _bookController.getBook(widget.index);
      final updatedBook = Book(
        bookName: _bookNameController.text.trim(),
        authorName: _authorController.text.trim(),
        description: _descController.text.trim(),
        category: _categoryController.text.trim(),
        pageNumber: int.parse(_pageController.text.trim()),
        rating: double.parse(_ratingController.text.trim()),
        addeBy: oldBook.addeBy
      );

      _bookController.updateBook(widget.index, updatedBook);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Book updated successfully')),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                Container(
                  color: Colors.amber,
                  height: 300,
                  width: 200,
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: _bookNameController,
                          hintText: TextConstants.bookNameHint,
                          validator: (value) =>
                              value == null || value.isEmpty ? 'Book Name required' : null,
                        ),
                        const SizedBox(height: 16),
                        CustomTextField(
                          controller: _authorController,
                          hintText: TextConstants.authorNameHint,
                          maxLines: 5,
                          validator: (value) =>
                              value == null || value.isEmpty ? 'Author name required' : null,
                        ),
                        const SizedBox(height: 16),
                        CustomTextField(
                          controller: _categoryController,
                          hintText: TextConstants.categoryHint,
                          validator: (value) =>
                              value == null || value.isEmpty ? 'Category required' : null,
                        ),
                        const SizedBox(height: 16),
                        CustomTextField(
                          controller: _ratingController,
                          hintText: TextConstants.ratingHint,
                          validator: (value) =>
                              value == null || value.isEmpty ? 'Rating required' : null,
                        ),
                        const SizedBox(height: 16),
                        CustomTextField(
                          controller: _pageController,
                          hintText: TextConstants.pageHint,
                          validator: (value) =>
                              value == null || value.isEmpty ? 'Page count required' : null,
                        ),
                        const SizedBox(height: 16),
                        CustomTextField(
                          controller: _descController,
                          hintText: TextConstants.descriptionHint,
                          validator: (value) =>
                              value == null || value.isEmpty ? 'Description required' : null,
                        ),
                        const SizedBox(height: 20),
                        CustomButton(
                          label: "Update",
                          onPressed: update,
                          width: 350,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
