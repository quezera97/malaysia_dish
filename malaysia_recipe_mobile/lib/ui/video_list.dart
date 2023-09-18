import 'package:flutter/material.dart';

class VideoList extends StatelessWidget {
  const VideoList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const <Widget>[
        _ListCard(title: 'Mee Kari'),
        _ListCard(title: 'Nasi Ayam'),
        _ListCard(title: 'Kerabu Maggi'),
      ],
    );
  }
}

class _ListCard extends StatelessWidget {
  const _ListCard({
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            title: Text(title),
          ),
        ],
      ),
    );
  }
}
