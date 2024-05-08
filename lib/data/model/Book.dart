// book_model.dart

import 'package:ktebbi/data/model/Genre.dart';

class BookModel {
  final String id;
  final String name;
  final String author;
  final GenreModel genre;
  final int pages;
  final List<String> pageContent;
  final DateTime releaseDate;
  final String language;
  final String imageUrl;

  BookModel({
    required this.id,
    required this.name,
    required this.author,
    required this.genre,
    required this.pages,
    required this.pageContent,
    required this.releaseDate,
    required this.language,
    required this.imageUrl,
  });

  Object? get title => null;
 static BookModel empty() {
    return BookModel(id: '', name: '', author: '', genre: GenreModel.empty(), pages: 0, pageContent: [], releaseDate: DateTime.now(), language: '', imageUrl: '' );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'author': author,
      'genre': genre.toJson(),
      'pages': pages,
      'pageContent': pageContent,
      'releaseDate': releaseDate.toIso8601String(),
      'language': language,
      'imageUrl': imageUrl,
    };
  }

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      id: json['_id'],
      name: json['name'],
      author: json['author'],
      genre: GenreModel.fromJson(json['genre']),
      pages: json['pages'],
      pageContent: List<String>.from(json['pageContent']),
      releaseDate: DateTime.parse(json['releaseDate']),
      language: json['language'],
      imageUrl: json['imageUrl'],
    );
  }
}
