import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:tarea_3_carlos_flores/book.dart';
import 'package:tarea_3_carlos_flores/http_google_books.dart';

class BookProvider with ChangeNotifier {
  Map<String, dynamic>? book_json_obj;
  bool show_baseText = true;
  bool show_shimmer = false;

  bool show_allLines = false;

  void changeShowAllLines() {
    show_allLines = !show_allLines;
    notifyListeners();
  }

  List<Book> books_list = <Book>[];

  Future<Map<String, dynamic>?> searchBooks(String search_phrase) async {
    show_baseText = false;
    show_shimmer = true;
    show_allLines = false;
    notifyListeners();
    books_list.clear();
    Response response = await HttpGoogleBooks().postRequest(search_phrase);

    show_shimmer = false;

    if (response.statusCode == 200) {
      var books_json_obj = jsonDecode(response.body);

      // print(books_json_obj);

      for (var bookItem in books_json_obj['items']) {
        books_list.add(Book.fromJson(bookItem));
      }

      // print(jsonDecode(response.body));
      notifyListeners();
    } else {
      throw Exception('Status: ${response.statusCode}');
    }

    return book_json_obj;
  }
}
