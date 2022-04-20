import 'package:dartz/dartz.dart';
import 'package:openlibrary/src/core/failure/failure.dart';
import 'package:openlibrary/src/features/books/domain/entity/books_list.model.dart';

abstract class BooksListRepository {
  Future<Either<Failure, BooksList>> getValidBooksList();
}
