import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:openlibrary/src/features/books/controller/books.controller.dart';
import 'package:openlibrary/src/features/books/presentation/books_detail.page.dart';
import 'package:openlibrary/src/features/books/presentation/ui/books_list_item.ui.dart';
import 'package:openlibrary/src/features/books/presentation/ui/shimmer_list.ui.dart';
import 'package:openlibrary/src/presentation/base/base.page.dart';

class BooksPage extends StatefulWidget {
  const BooksPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => BooksPageState();
}

class BooksPageState extends BaseState<BooksPage, BooksController> {
  @override
  BooksController get controller => super.controller!;

  @override
  Widget layout(BuildContext ctx) {
    return Observer(builder: (_) {
      return controller.books.isSuccessWithValue
          ? ListView.builder(
              itemCount: controller.books.value!.books.length,
              itemBuilder: (_, __) => InkWell(
                child: BooksListItem(controller.books.value!.books[__]),
                onTap: () => Navigator.push(
                  _,
                  MaterialPageRoute(
                    builder: (context) =>
                        BooksDetailPage(controller.books.value!.books[__]),
                  ),
                ),
              ),
            )
          : const ShimmerList();
    });
  }
}
