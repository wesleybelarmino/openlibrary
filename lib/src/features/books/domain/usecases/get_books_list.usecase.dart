import 'package:dartz/dartz.dart';
import 'package:openlibrary/src/core/failure/failure.dart';
import 'package:openlibrary/src/features/books/domain/entity/books_list.model.dart';
import 'package:openlibrary/src/features/books/domain/reposity/books_list.repository.dart';

class GetBooksListUsecase {
  final BooksListRepository booksRepository;

  GetBooksListUsecase(this.booksRepository);

  Future<Either<Failure, BookList>> call() async {
    return await booksRepository.getValidBooksList();
  }
}
