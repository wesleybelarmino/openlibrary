import 'package:openlibrary/src/features/books/domain/entity/books_list.model.dart';

abstract class BooksListDataSource {
  Future<BooksList> getBooks();
}
