import 'package:flutter/widgets.dart';
import 'package:openlibrary/src/controller/base.store.dart';
import 'package:openlibrary/src/features/books/presentation/widget/shimmer_list.ui.dart';
import 'package:openlibrary/src/presentation/base/base.page.dart';

class BooksPage extends StatefulWidget {
  const BooksPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => BooksPageState();
}

class BooksPageState extends BaseState<BooksPage, BaseStore> {
  @override
  Widget layout(BuildContext ctx) {
    return const ShimmerList();
  }
}
