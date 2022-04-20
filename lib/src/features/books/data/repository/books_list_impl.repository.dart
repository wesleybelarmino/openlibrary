import 'package:injectable/injectable.dart';
import 'package:openlibrary/src/core/failure/exceptions.dart';
import 'package:openlibrary/src/core/network/network_info.dart';
import 'package:openlibrary/src/features/books/data/datasource/books_list.datasource.dart';
import 'package:openlibrary/src/features/books/domain/entity/books_list.model.dart';
import 'package:openlibrary/src/core/failure/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:openlibrary/src/features/books/domain/reposity/books_list.repository.dart';

@LazySingleton(as: BooksListRepository)
class BooksListRepositoryImpl extends BooksListRepository {
  final BooksListDataSource booksListDataSource;
  final NetworkInfo networkInfo;

  BooksListRepositoryImpl(this.booksListDataSource, this.networkInfo);

  @override
  Future<Either<Failure, BookList>> getValidBooksList() async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await booksListDataSource.getBooks());
      } on ServerException {
        return const Left(ServerFailure());
      }
    } else {
      return const Left(ConnectionFailure());
    }
  }
}
