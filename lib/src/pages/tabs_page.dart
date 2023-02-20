import 'package:flutter/material.dart';

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _Pages(),
      bottomNavigationBar: _Navigation(),
    );
  }
}

class _Navigation extends StatelessWidget {
  const _Navigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(currentIndex: 0, items: const [
      BottomNavigationBarItem(
          icon: Icon(Icons.person_outline), label: 'Para ti'),
      BottomNavigationBarItem(icon: Icon(Icons.public), label: 'Encabezados')
    ]);
  }
}

class _Pages extends StatelessWidget {
  const _Pages({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Container(
          color: Colors.red,
        ),
        Container(
          color: Colors.green,
        ),
      ],
    );
  }
}
