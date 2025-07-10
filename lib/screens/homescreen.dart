
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:project_practice/models/book.dart';
import 'package:project_practice/screens/single_details.dart';
import 'package:project_practice/widgets/books.dart';
import 'package:project_practice/widgets/custom_category_button.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? currenUsername;
  List<String> categories = ['All'];
  String selectedCategory = 'All';

  int getCrossAxisCount(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (width > 800) return 4;
    if (width > 600) return 3;
    return 2;
  }

  @override
  void initState() {
    super.initState();
    _loadCurrentUser();
  }

  Future<void> _loadCurrentUser() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      currenUsername = prefs.getString('loggedInUser');
    });
  }

  @override
  Widget build(BuildContext context) {
    if (currenUsername == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return ValueListenableBuilder(
      valueListenable: Hive.box<Book>('books').listenable(),
      builder: (context, Box<Book> box, _) {
        final allBooks = box.values
            .where((book) => book.addeBy == currenUsername)
            .toList();

        categories = ['All', ...{...allBooks.map((book) => book.category)}];

        final filteredBooks = selectedCategory == 'All'
            ? allBooks
            : allBooks
                .where((book) => book.category == selectedCategory)
                .toList();

        return Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              alignment: Alignment.centerLeft,
              child: const Text(
                "Library",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: categories.map((category) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: CustomCategoryButton(
                      label: category,
                      isSelected: selectedCategory == category,
                      onTap: () {
                        setState(() {
                          selectedCategory = category;
                        });
                      },
                    ),
                  );
                }
              ).toList(),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: getCrossAxisCount(context),
                  childAspectRatio: 3 / 4.5,
                ),
                itemCount: filteredBooks.length,
                itemBuilder: (context, index) {
                  final book = filteredBooks[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SingleDetails(
                                  book: book, index: index)));
                    },
                    child: CustomCard(books: book),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}


