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
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 20, right: 10),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'lib/images/books.png',
                  height: 200,
                  width: 200,
                ),
              ),
              const SizedBox(height: 30),
              Center(
                child: Text(
                  widget.book.title,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              const SizedBox(height: 16),
              Text(widget.book.subtitle,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.grey[500],
                  )),
              const SizedBox(height: 22),
              Text(widget.book.text,
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                  )),
            ],
          ),
        ],
      ),
    );
  }

  @override
  PreferredSizeWidget appBar(BuildContext ctx) => AppBar(
        title: Text(
          widget.book.title,
          style: const TextStyle(color: Colors.white70),
        ),
      );
}
