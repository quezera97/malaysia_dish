import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../widget/navigate_to_webview.dart';

class FavoritePlayer extends StatefulWidget {
  const FavoritePlayer(
      {super.key,
      required this.controllers,
      required this.index,
      required this.title,
      required this.url});

  final List<YoutubePlayerController> controllers;
  final int index;
  final String title;
  final String url;

  @override
  State<FavoritePlayer> createState() => _FavoritePlayerState();
}

class _FavoritePlayerState extends State<FavoritePlayer> {
  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: widget.controllers[widget.index],
        ),
        builder: (context, player) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Malaysian Dish'),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.5),
                    child: Column(
                      children: [
                        Text(
                          widget.title,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                        YoutubePlayer(
                          key: ObjectKey(widget.controllers[widget.index]),
                          controller: widget.controllers[widget.index],
                          showVideoProgressIndicator: true,
                        ),
                        const SizedBox(height: 10),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                          child: Divider(
                            color: Colors.grey,
                          ),
                        ),
                        Column(
                          children: [
                            InkWell(
                              child: const Text('Play in YouTube'),
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => NavigateToWebView(
                                      youtubeUrl: widget.url,
                                    ),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: 15),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
