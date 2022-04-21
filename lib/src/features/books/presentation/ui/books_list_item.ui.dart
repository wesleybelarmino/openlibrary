import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:openlibrary/src/features/books/domain/entity/book.model.dart';

class BooksListItem extends StatelessWidget {
  final Book book;

  const BooksListItem(this.book, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      height: 180,
      width: 300,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, top: 20, right: 10),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      book.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(book.subtitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.grey[500],
                      )),
                  const SizedBox(height: 22),
                  Text(book.text,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
