import 'package:flutter/material.dart';
import 'package:flutter_news_app/src/models/news_models.dart';
import 'package:flutter_news_app/src/services/news_service.dart';
import 'package:flutter_news_app/src/widgets/news_list.dart';
import 'package:provider/provider.dart';

class Tab1Page extends StatefulWidget {
  @override
  State<Tab1Page> createState() => _Tab1PageState();
}

class _Tab1PageState extends State<Tab1Page>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    final headlines = Provider.of<NewsService>(context).headlines;
    //NewsList(news: headlines)
    return Scaffold(
        body: (headlines.length == 0)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : NewsList(
                news: headlines,
              ));
  }

  @override
  bool get wantKeepAlive => true;
}
