import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class InitialVideo extends StatefulWidget {
  const InitialVideo({super.key});

  @override
  State<InitialVideo> createState() => _InitialVideoState();
}

class _InitialVideoState extends State<InitialVideo> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = YoutubePlayerController(
      initialVideoId: getVideoId(),
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  String getVideoId(){
    var urlToId = YoutubePlayer.convertUrlToId("https://www.youtube.com/watch?v=6uZy86ePgO0&ab_channel=JYPEntertainment");

    setState(() {
      urlToId;
    });

    return urlToId!;
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.blueAccent,
      )
    );
  }
}