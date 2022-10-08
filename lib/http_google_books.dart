import 'dart:convert';

import 'package:http/http.dart';

import 'package:http/http.dart' as http;

class HttpGoogleBooks {
  static final HttpGoogleBooks _httpGoogleBooks = HttpGoogleBooks._internal();

  factory HttpGoogleBooks() {
    return _httpGoogleBooks;
  }

  HttpGoogleBooks._internal();

  Future<Response> postRequest(search_phrase) async {
    return await http.get(
      Uri.parse(
          'https://www.googleapis.com/books/v1/volumes?q=' + search_phrase),
    );
  }
}
