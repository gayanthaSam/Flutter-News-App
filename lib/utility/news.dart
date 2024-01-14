import 'dart:convert';

import 'package:flutter_application_1/models/news_article.dart';
import 'package:http/http.dart';

class News {
  List<NewsArticle> news = [];
  Future<void> getNewsArticles(String category) async {
    String apiUrl = '';
    if (category == "all") {
      apiUrl =
          "https://newsapi.org/v2/top-headlines?country=jp&apiKey=2de1e361195c4c8ca2cb35cfbfd7947f";
    } else {
      apiUrl =
          "https://newsapi.org/v2/top-headlines?category=$category&country=jp&apiKey=2de1e361195c4c8ca2cb35cfbfd7947f";
    }
    Response response = await get(Uri.parse(apiUrl));
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == "ok") {
      jsonData['articles'].forEach((article) {
        if (article['urlToImage'] != null && article['description'] != null) {
          NewsArticle newsArticle = NewsArticle(
              title: article['title'],
              author: article['author'],
              description: article['description'],
              url: article['url'],
              urlToImage: article['urlToImage'],
              content: article['content']);
          news.add(newsArticle);
        }
      });
    }
  }
}
