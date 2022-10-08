import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tarea_3_carlos_flores/book.dart';
import 'package:tarea_3_carlos_flores/book_list_element.dart';
import 'package:tarea_3_carlos_flores/book_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<Book> books_list = context.watch<BookProvider>().books_list;
    searchController.text;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ThemeData.dark().primaryColor,
          title: Text('Libreria free to play'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onEditingComplete: () {
                  searchBooks(context);
                },
                controller: searchController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Ingresa titulo',
                    suffixIcon: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        searchBooks(context);
                      },
                    )),
              ),
            ),
            Visibility(
              visible: context.watch<BookProvider>().show_shimmer,
              child: ShimmerBooks(),
            ),
            Visibility(
              visible: context.watch<BookProvider>().show_baseText,
              child: Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Ingrese palabra para buscar el libro',
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: !context.watch<BookProvider>().show_baseText &&
                  !context.watch<BookProvider>().show_shimmer,
              child: Expanded(
                child: Container(
                  // width: 400,
                  // height: 300,
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: books_list.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: BookListElement(book: books_list[index]),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  void searchBooks(BuildContext context) {
    FocusManager.instance.primaryFocus?.unfocus();

    if (searchController.text.isEmpty) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text('Por favor ingrese una palabra valida...'),
          ),
        );
    } else {
      context.read<BookProvider>().searchBooks(searchController.text);
    }
  }
}

class ShimmerBooks extends StatelessWidget {
  const ShimmerBooks({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 380.0,
      // height: 400.0,
      child: Shimmer.fromColors(
        baseColor: Color.fromARGB(255, 207, 201, 201),
        highlightColor: Colors.white,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ShimmerBookPlaceholder(),
                ShimmerBookPlaceholder(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ShimmerBookPlaceholder(),
                ShimmerBookPlaceholder(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ShimmerBookPlaceholder(),
                ShimmerBookPlaceholder(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ShimmerBookPlaceholder extends StatelessWidget {
  const ShimmerBookPlaceholder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            child: Container(
              color: Colors.grey,
              height: 140,
              width: 120,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              child: Container(
                color: Colors.grey,
                height: 20,
                width: 140,
              )),
        ),
      ],
    );
  }
}
