
import 'package:hive/hive.dart';

part 'book.g.dart';

@HiveType(typeId: 1) // Make sure the typeId is unique
class Book {
  @HiveField(0)
  final String bookName;

  @HiveField(1)
  final String authorName;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final String category;

  @HiveField(4)
  final int pageNumber;

  @HiveField(5)
  final double rating;

  @HiveField(6)
  final String? imagePath;

  @HiveField(7)
  final String addeBy;

  Book({
    required this.bookName,
    required this.authorName,
    required this.description,
    required this.category,
    required this.pageNumber,
    required this.rating,
    this.imagePath,
    required this.addeBy
  });
}
