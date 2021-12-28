import 'package:bt/const/book_detail.dart';
import 'package:bt/model/book.dart';
import 'package:flutter/material.dart';

class DetalHomePage extends StatefulWidget {
  @required
  final BookDetail detail;

  const DetalHomePage({Key? key, required this.detail}) : super(key: key);
  @override
  // ignore: no_logic_in_create_state
  _DetalHomePageState createState() => _DetalHomePageState(detail);
}

class _DetalHomePageState extends State<DetalHomePage> {
  final BookDetail detail;

  _DetalHomePageState(this.detail);
  bool _isPressed = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    _isPressed = !_isPressed;
                  });
                },
                icon: (_isPressed == false)
                    ? const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      )
                    : const Icon(
                        Icons.favorite_border,
                      )),
            const SizedBox(width: 10),
            const Icon(Icons.share),
            const SizedBox(width: 10),
          ],
        ),
        body: Container(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            children: [
              BookDescriptionDetail(
                  text: detail.text,
                  authors: detail.authors,
                  description: detail.description,
                  image: detail.image)
            ],
          ),
        ));
  }
}
