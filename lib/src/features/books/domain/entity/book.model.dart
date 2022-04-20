import 'package:equatable/equatable.dart';

class Book extends Equatable {
  final String title;
  final String subtitle;
  final String text;
  final String id;

  const Book(
      {required this.title,
      required this.subtitle,
      required this.text,
      required this.id});

  @override
  List<Object?> get props => [title, subtitle, text, id];
}
