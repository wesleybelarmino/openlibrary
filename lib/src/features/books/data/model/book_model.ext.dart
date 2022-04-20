import 'package:openlibrary/src/core/extensions/map.ext.dart';
import 'package:openlibrary/src/features/books/domain/entity/book.model.dart';

extension BookModel on Book {
  static Book? fromJson(Map<dynamic, dynamic> json) {
    return json.isNotEmpty
        ? Book(
            title: json.getValue('title', ''),
            subtitle: json.getValue('subtitle', ''),
            text: json.getValue('text', ''),
            id: json.getValue('id', ''))
        : null;
  }
}
