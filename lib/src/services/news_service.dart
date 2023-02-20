import 'package:flutter/material.dart';
import 'package:flutter_news_app/src/models/news_models.dart';
import 'package:http/http.dart' as http;

final _URL_NEWS = 'https://newsapi.org/v2';
final _APIKEY = '5ece8b3788d74319a001a646d60d12cd';

class NewsService with ChangeNotifier {
  List<Article> headlines = [];

  NewsService() {
    getTopHeadlines();
  }

  getTopHeadlines() async {
    final url = '$_URL_NEWS/top-headlines?apiKey=$_APIKEY&country=us';
    final resp = await http.get(Uri.parse(url));
    // print(resp.body);
    final newsResponse = newsResponseFromJson(resp.body);
    // print(newsResponse);
    headlines.addAll(newsResponse.articles);
    notifyListeners();
  }
}
