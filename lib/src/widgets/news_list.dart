import 'package:flutter/material.dart';
import 'package:flutter_news_app/src/models/news_models.dart';
import 'package:flutter_news_app/src/theme/theme.dart';

class NewsList extends StatelessWidget {
  final List<Article> news;
  const NewsList({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: news.length,
      itemBuilder: (context, int index) {
        return _News(news: news[index], index: index);
      },
    );
  }
}

class _News extends StatelessWidget {
  final Article news;
  final int index;

  const _News({super.key, required this.news, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TopBarCard(
          news: news,
          index: index,
        ),
        _TitleCard(
          news: news,
        ),
        _ImageCard(news: news),
        _BodyCard(news: news),
        _ButtonsCard(),
        SizedBox(
          height: 10,
        ),
        Divider(),
      ],
    );
  }
}

class _ButtonsCard extends StatelessWidget {
  const _ButtonsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        RawMaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          fillColor: myTheme.accentColor,
          child: Icon(Icons.star_border),
          onPressed: () {},
        ),
        SizedBox(
          width: 10,
        ),
        RawMaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          fillColor: Colors.blue,
          child: Icon(Icons.more),
          onPressed: () {},
        )
      ]),
    );
  }
}

class _BodyCard extends StatelessWidget {
  final Article news;
  const _BodyCard({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Text((news.description != null) ? news.description! : ''),
    );
  }
}

class _ImageCard extends StatelessWidget {
  final Article news;
  const _ImageCard({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
        child: Container(
          child: (news.urlToImage != null)
              ? FadeInImage(
                  image: NetworkImage(news.urlToImage!),
                  placeholder: const AssetImage('assets/giphy.gif'),
                )
              : Image(image: AssetImage('assets/no-image.png')),
        ),
      ),
    );
  }
}

class _TitleCard extends StatelessWidget {
  final Article news;
  const _TitleCard({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        news.title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      ),
    );
  }
}

class _TopBarCard extends StatelessWidget {
  final Article news;
  final int index;
  const _TopBarCard({
    super.key,
    required this.news,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(bottom: 10),
      child: Row(children: [
        Text(
          '${index + 1}: ',
          style: TextStyle(color: myTheme.accentColor),
        ),
        Text(
          '${news.source.name}',
        )
      ]),
    );
  }
}
