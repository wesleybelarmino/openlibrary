import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:openlibrary/src/core/failure/exceptions.dart';
import 'package:openlibrary/src/features/books/data/datasource/books_list.datasource.dart';
import 'package:openlibrary/src/features/books/data/model/books_list_model.ext.dart';
import 'package:openlibrary/src/features/books/domain/entity/books_list.model.dart';
import 'package:http/http.dart' as http;

@LazySingleton(as: BooksListDataSource)
class BooksListDataSourceImpl extends BooksListDataSource {
  final http.Client client;

  BooksListDataSourceImpl(this.client);

  @override
  Future<BookList> getBooks() async {
    final response = await client.get(
      Uri.parse("https://62507208977373573f3d77f0.mockapi.io/api/lib/library"),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      return BooksListModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
