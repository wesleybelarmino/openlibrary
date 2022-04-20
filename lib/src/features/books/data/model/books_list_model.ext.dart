import 'package:openlibrary/src/features/books/domain/entity/book.model.dart';
import 'package:openlibrary/src/features/books/domain/entity/books_list.model.dart';
import 'package:openlibrary/src/features/books/data/model/book_model.ext.dart';

extension BooksListModel on BookList {
  static BookList fromJson(List<dynamic> json) {
    List<Book?> books =
        json.isEmpty ? [] : json.map((i) => BookModel.fromJson(i)).toList();
    return BookList(books);
  }
}
