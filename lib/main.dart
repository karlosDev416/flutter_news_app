import 'package:flutter/material.dart';
import 'package:flutter_news_app/src/pages/tabs_page.dart';
import 'package:flutter_news_app/src/theme/theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        theme: myTheme,
        home: TabsPage());
  }
}
