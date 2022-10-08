class Book {
  String title;
  String publishedDate;
  String description;
  String pageCount;
  String imageLink;
  String previewLink;

  Book(
      {required this.title,
      required this.publishedDate,
      required this.description,
      required this.pageCount,
      required this.imageLink,
      required this.previewLink});

  factory Book.fromJson(Map<String, dynamic> json) {
    var title = '-';
    try {
      title = json['volumeInfo']['title'];
    } catch (e) {}

    var publishedDate = '-';
    try {
      publishedDate = json['volumeInfo']['publishedDate'];
    } catch (e) {}

    var description = '-';
    try {
      description = json['volumeInfo']['description'];
    } catch (e) {}

    var pageCount = '-';
    try {
      pageCount = '${json['volumeInfo']['pageCount']}';
    } catch (e) {}

    var imageLink =
        'https://upload.wikimedia.org/wikipedia/commons/b/bd/Draw_book.png';
    try {
      imageLink = json['volumeInfo']['imageLinks']['thumbnail'];
    } catch (e) {}

    var previewLink = 'https://books.google.com.mx/';
    try {
      previewLink = json['volumeInfo']['previewLink'];
    } catch (e) {}

    return Book(
        title: title,
        publishedDate: publishedDate,
        description: description,
        pageCount: pageCount,
        imageLink: imageLink,
        previewLink: previewLink);
  }
}

Book myBook = Book(
    title:
        'Harry Potter y la piedra filosofal sdfasdf asdf asdf as asasda asdfafasf asdf as',
    publishedDate: 'publishedDate',
    description: 'description',
    pageCount: 'pageCount',
    imageLink:
        "http://books.google.com/books/content?id=p3QQjwEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api",
    previewLink:
        "http://books.google.com.mx/books?id=p3QQjwEACAAJ&dq=harry+potter+inauthor:rowling&hl=&cd=1&source=gbs_api");
