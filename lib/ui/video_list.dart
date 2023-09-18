import 'package:flutter/material.dart';

class VideoList extends StatelessWidget {
  const VideoList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const <Widget>[
        _ListCard(title: 'Mee Kari'),
        // Card(
        //     child: Column(children: <Widget>[
        //   Column(
        //     children: <Widget>[
        //       const ListTile(
        //         leading: Icon(Icons.cake),
        //         title: Text('Video video'),
        //       ),
        //       Stack(
        //           alignment: FractionalOffset.bottomRight +
        //               const FractionalOffset(-0.1, -0.1),
        //           children: <Widget>[
        //           ]),
        //     ],
        //   ),
        // ])),
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
          ButtonBar(
            children: <Widget>[
              TextButton(
                child: const Text('BUY'),
                onPressed: () {
                  /* ... */
                },
              ),
              // TextButton(
              //   child: const Text('SELL TICKETS'),
              //   onPressed: () {
              //     /* ... */
              //   },
              // ),
            ],
          ),
        ],
      ),
    );
  }
}