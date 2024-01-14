import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/news_article.dart';
import 'package:flutter_application_1/utility/news.dart';
import 'package:flutter_application_1/widgets/news_item.dart';

class NewsCategory extends StatefulWidget {
  final String category;
  const NewsCategory({required this.category});

  @override
  State<NewsCategory> createState() => _NewsCategoryState();
}

class _NewsCategoryState extends State<NewsCategory> {
  List<NewsArticle> newsArticles = [];
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    getNews();
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNewsArticles(widget.category);
    newsArticles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Japan",
                style: TextStyle(color: Colors.red),
              ),
              Text("News"),
            ]),
        actions: <Widget>[
          Opacity(
            opacity: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.share),
            ),
          )
        ],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: _loading
          ? Center(
              child: Container(
                child: const CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(top: 16),
                    child: ListView.builder(
                        itemCount: newsArticles.length,
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return NewsItem(
                            imageUrl:
                                newsArticles[index].urlToImage ?? "default url",
                            title: newsArticles[index].title ?? "default title",
                            description: newsArticles[index].description ??
                                "default desription",
                            postUrl: newsArticles[index].url ?? "default url",
                          );
                        }),
                  )
                ]),
              ),
            ),
    );
  }
}
