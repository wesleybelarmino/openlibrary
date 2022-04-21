import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:openlibrary/src/controller/base.store.dart';
import 'package:openlibrary/src/features/books/domain/entity/book.model.dart';
import 'package:openlibrary/src/presentation/base/base.page.dart';

class BooksDetailPage extends StatefulWidget {
  final Book book;
  const BooksDetailPage(this.book, {Key? key}) : super(key: key);

  @override
  BooksDetailPageState createState() => BooksDetailPageState();
}

class BooksDetailPageState extends BaseState<BooksDetailPage, BaseStore> {
  @override
  Widget layout(BuildContext ctx) {
    return Container();
  }

  @override
  PreferredSizeWidget appBar(BuildContext ctx) => AppBar(
        title: Text(
          widget.book.title,
          style: const TextStyle(color: Colors.white70),
        ),
      );
}
