import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:openlibrary/src/di/injection.dart';
import 'package:openlibrary/src/features/books/presentation/books.page.dart';

void main() {
  configureDependencies(Environment.dev);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Library',
      theme: ThemeData(),
      home: const BooksPage(),
    );
  }
}
