import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/news_view.dart';

class NewsItem extends StatelessWidget {
  final String imageUrl, title, description, postUrl;
  NewsItem(
      {required this.imageUrl,
      required this.title,
      required this.description,
      required this.postUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NewsView(postUrl: postUrl)));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: Column(children: <Widget>[
          ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(imageUrl)),
          const SizedBox(
            height: 7,
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 18, color: Colors.black87),
          ),
          const SizedBox(
            height: 7,
          ),
          Text(
            description,
            style: const TextStyle(
              color: Colors.black54,
            ),
          ),
        ]),
      ),
    );
  }
}
