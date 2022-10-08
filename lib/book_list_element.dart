import 'package:flutter/material.dart';
import 'package:tarea_3_carlos_flores/book.dart';
import 'package:tarea_3_carlos_flores/book_page.dart';

class BookListElement extends StatelessWidget {
  final Book book;
  const BookListElement({
    Key? key,
    required this.book,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                print('Este es el libro: ${book.title}');
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => BookPage(
                      book: book,
                    ),
                  ),
                );
              },
              child: Image.network(
                '${book.imageLink}',
                fit: BoxFit.fill,
              ),
            ),
          ),
          Text(
            '${book.title}',
            maxLines: 2,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
