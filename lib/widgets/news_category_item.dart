import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_application_1/views/news_category.dart';

class CategoryListItem extends StatelessWidget {
  final imageUrl, newsCategoryName;
  const CategoryListItem(this.imageUrl, this.newsCategoryName);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NewsCategory(
                    category: newsCategoryName.toString().toLowerCase())));
      },
      child: Container(
          margin: const EdgeInsets.only(right: 15),
          child: Stack(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  width: 120,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                width: 120,
                height: 60,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.black26,
                ),
                child: Text(newsCategoryName,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700)),
              )
            ],
          )),
    );
  }
}
