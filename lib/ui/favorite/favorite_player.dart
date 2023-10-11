import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class FavoritePlayer extends StatefulWidget {
  const FavoritePlayer({super.key, required this.controllers, required this.index, required this.title});

  final List<YoutubePlayerController> controllers;
  final int index;
  final String title;

  @override
  State<FavoritePlayer> createState() => _FavoritePlayerState();
}

class _FavoritePlayerState extends State<FavoritePlayer> {

  @override
  Widget build(BuildContext context) {    
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
                  ],
                ),
              ),
            ),
          ),
        ),
    );
  }
}