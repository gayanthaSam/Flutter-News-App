import "package:flutter/material.dart";
import "package:flutter_application_1/models/news_article.dart";
import 'package:flutter_application_1/models/news_category.dart';
import "package:flutter_application_1/utility/data.dart";
import "package:flutter_application_1/utility/news.dart";
import "package:flutter_application_1/widgets/news_category_item.dart";
import "package:flutter_application_1/widgets/news_item.dart";

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<NewsCategoryModel> newsCategories = [];
  List<NewsArticle> newsArticles = [];
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _loading = true;
    newsCategories = getNewsCategories();
    getNews();
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNewsArticles("all");
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
                    height: 70,
                    child: ListView.builder(
                        itemCount: newsCategories.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return CategoryListItem(
                            newsCategories[index].imageUrl,
                            newsCategories[index].newsCategoryName,
                          );
                        }),
                  ),
                  //news list
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
