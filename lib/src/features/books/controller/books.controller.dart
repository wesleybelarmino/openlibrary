import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:openlibrary/src/controller/value.store.dart';
import 'package:openlibrary/src/controller/base.store.dart';
import 'package:openlibrary/src/features/books/domain/entity/books_list.model.dart';
import 'package:openlibrary/src/features/books/domain/usecases/get_books_list.usecase.dart';

part 'books.controller.g.dart';

@injectable
class BooksController = _BooksController with _$BooksController;

abstract class _BooksController extends BaseStore with Store {
  final GetBooksListUsecase getBooksListUsecase;
  final books = ValueStore<BooksList?>(null);

  _BooksController(this.getBooksListUsecase) {
    getBooksList();
  }

  void getBooksList() => books.execute(() => getBooksListUsecase());

  @override
  Iterable<ValueStore> get getStates => [books];
}
