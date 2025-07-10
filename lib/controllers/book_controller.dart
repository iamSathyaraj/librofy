import 'package:hive/hive.dart';
import '../models/book.dart';

class BookController {
  final Box<Book> _bookBox = Hive.box<Book>('books');

  List<Book> getAllBooks() => _bookBox.values.toList();

 Future<void> addBook(Book book) async {
  await _bookBox.add(book);
}


  void deleteBook(int index) {
    _bookBox.deleteAt(index);
  }

  void updateBook(int index, Book updatedBook) {
    _bookBox.putAt(index, updatedBook);
  }

  Book getBook(int index) {
    return _bookBox.getAt(index)!;
  }

  int get bookCount => _bookBox.length;
}

