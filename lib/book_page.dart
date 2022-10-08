import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tarea_3_carlos_flores/book.dart';
import 'package:tarea_3_carlos_flores/url_button.dart';

import 'book_provider.dart';

class BookPage extends StatelessWidget {
  final Book book;
  const BookPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeData.dark().primaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Detalles del libro'),
            SizedBox(
              width: 50,
            ),
            UrlButton(
              url: book.previewLink,
              buttonIcon: Icon(Icons.public_rounded),
              destiny_name: 'Web',
            ),
            IconButton(
              onPressed: () {
                _onShare(context);
              },
              icon: Icon(Icons.share),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(24),
                  height: 350,
                  child: Image.network(
                    '${book.imageLink}',
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
            Text(
              '${book.title}',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${book.publishedDate}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Paginas: ${book.pageCount}',
                        ),
                        GestureDetector(
                          onTap: () {
                            context.read<BookProvider>().changeShowAllLines();
                          },
                          child: Text(
                            '${book.description}',
                            overflow: TextOverflow.ellipsis,
                            maxLines:
                                context.watch<BookProvider>().show_allLines
                                    ? 1000
                                    : 6,
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _onShare(BuildContext context) async {
    await Share.share(
        'Te comparto el libro: "${book.title}", tiene un total de ${book.pageCount} páginas! ');
  }
}
