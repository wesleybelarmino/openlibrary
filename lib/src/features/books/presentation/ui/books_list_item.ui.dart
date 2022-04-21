import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:openlibrary/src/features/books/domain/entity/book.model.dart';

class BooksListItem extends StatelessWidget {
  final Book book;

  const BooksListItem(this.book, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 2,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 100,
          child: Text(book.title),
        ),
      ),
    );
  }
}
