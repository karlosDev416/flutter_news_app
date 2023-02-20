import 'package:flutter/material.dart';
import 'package:flutter_news_app/src/models/category_model.dart';
import 'package:flutter_news_app/src/services/news_service.dart';
import 'package:flutter_news_app/src/theme/theme.dart';
import 'package:flutter_news_app/src/widgets/news_list.dart';
import 'package:provider/provider.dart';

class Tab2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          _CategoryList(),
          Expanded(
              child: NewsList(
            news: newsService.getArticlesSelectedCategory,
          ))
        ],
      )),
    );
  }
}

class _CategoryList extends StatelessWidget {
  const _CategoryList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<NewsService>(context).categories;
    return Container(
      width: double.infinity,
      height: 80,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, int index) {
          final categoryName = categories[index].name;
          return Padding(
            padding: EdgeInsets.all(8),
            child: Column(children: [
              _CategoryButton(category: categories[index]),
              SizedBox(
                height: 5,
              ),
              Text(
                  '${categoryName[0].toUpperCase()}${categoryName.substring(1)}')
            ]),
          );
        },
      ),
    );
  }
}

class _CategoryButton extends StatelessWidget {
  final Category category;

  const _CategoryButton({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context, listen: false);

    return GestureDetector(
      onTap: () {
        newsService.selectedCategory = category.name;
      },
      child: Container(
        width: 40,
        height: 40,
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: Icon(
          category.icon,
          color: (newsService.selectedCategory == category.name)
              ? myTheme.accentColor
              : Colors.black54,
        ),
      ),
    );
  }
}
