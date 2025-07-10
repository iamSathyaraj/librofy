import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:project_practice/constants/text_constants.dart';
import 'package:project_practice/controllers/book_controller.dart';
import 'package:project_practice/models/book.dart';
// import 'package:project_practice/screens/homescreen.dart';
import 'package:project_practice/widgets/custom_buttons.dart';
import 'package:project_practice/widgets/textformfield.dart';
import 'package:project_practice/screens/bottom_nav_bar.dart';

class AddBooks extends StatefulWidget {
  const AddBooks({super.key});

  @override
  State<AddBooks> createState() => _AddBooksState();
}

class _AddBooksState extends State<AddBooks> {
  final _formKey = GlobalKey<FormState>();
  final _bookNameController = TextEditingController();
  final _authorController = TextEditingController();
  final _categoryController = TextEditingController();
  final _ratingController = TextEditingController();
  final _pageController = TextEditingController();
  final _descController = TextEditingController();

  final BookController _bookController = BookController();

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

  Future<void> add() async {
    if (_formKey.currentState!.validate() && currentUser != null) {
      final newBook = Book(
        bookName: _bookNameController.text.trim(),
        authorName: _authorController.text.trim(),
        description: _descController.text.trim(),
        category: _categoryController.text.trim(),
        pageNumber: int.parse(_pageController.text.trim()),
        rating: double.parse(_ratingController.text.trim()),
        addeBy: currentUser!,
      );

      await _bookController.addBook(newBook);

      _bookNameController.clear();
      _authorController.clear();
      _categoryController.clear();
      _ratingController.clear();
      _pageController.clear();
      _descController.clear();

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const BottomNavPage(initialIndex: 0))
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Unable to add book. User not logged in.")),
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
                          validator: (value) => value == null || value.isEmpty ? 'Book Name required' : null,
                        ),
                        const SizedBox(height: 16),
                        CustomTextField(
                          controller: _authorController,
                          hintText: TextConstants.authorNameHint,
                          maxLines: 5,
                          validator: (value) => value == null || value.isEmpty ? 'Author name required' : null,
                        ),
                        const SizedBox(height: 16),
                        CustomTextField(
                          controller: _categoryController,
                          hintText: TextConstants.categoryHint,
                          validator: (value) => value == null || value.isEmpty ? 'Category required' : null,
                        ),
                        const SizedBox(height: 16),
                        CustomTextField(
                          controller: _ratingController,
                          hintText: TextConstants.ratingHint,
                          validator: (value) => value == null || value.isEmpty ? 'Rating required' : null,
                        ),
                        const SizedBox(height: 16),
                        CustomTextField(
                          controller: _pageController,
                          hintText: TextConstants.pageHint,
                          validator: (value) => value == null || value.isEmpty ? 'Page count required' : null,
                        ),
                        const SizedBox(height: 16),
                        CustomTextField(
                          controller: _descController,
                          hintText: TextConstants.descriptionHint,
                          validator: (value) => value == null || value.isEmpty ? 'Description required' : null,
                        ),
                        const SizedBox(height: 20),
                        CustomButton(
                          label: TextConstants.addBttn,
                          onPressed: add,
                          width: 350,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

