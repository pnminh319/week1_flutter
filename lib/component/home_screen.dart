import 'package:bt/component/detalscreen.dart';
import 'package:bt/const/book_description.dart';
import 'package:bt/const/categories_text.dart';
import 'package:bt/model/book.dart';
import 'package:flutter/material.dart';

List categories = [
  "Reading",
  "Thinking",
  "Making",
  "Short Stories",
  "Scient Fiction"
];

class HomeScreen extends StatelessWidget {
  final List<Book> books;
  const HomeScreen({Key? key, required this.books}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints:
              BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
          child: Container(
            padding: const EdgeInsets.only(left: 5),
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 280,
                  width: double.maxFinite,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (_, index) {
                        return Container(
                          margin: const EdgeInsets.only(left: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 180,
                                height: 250,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                    image: const DecorationImage(
                                        image: AssetImage(
                                            "assets/images/mountain.jpg"))),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 20),
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Categories',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 30,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (_, i) {
                        return Container(
                            margin: const EdgeInsets.only(left: 20),
                            width: 120,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.blue,
                            ),
                            child: Center(
                              child: CategoriesText(
                                text: categories[i],
                                size: 14,
                              ),
                            ));
                      }),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 20),
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Recently Added',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    padding: const EdgeInsets.only(left: 20),
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: books.length,
                        itemBuilder: (_, i) {
                          return GestureDetector(
                            onTap: () {
                              BookDetail detail = BookDetail(
                                  text: books[i].text,
                                  authors: books[i].authors,
                                  description: books[i].description,
                                  image: books[i].image);

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetalHomePage(
                                            detail: detail,
                                          )));
                            },
                            child: BookDescription(
                              text: books[i].text,
                              authors: books[i].authors,
                              description: books[i].description,
                              image: books[i].image,
                            ),
                          );
                        }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
