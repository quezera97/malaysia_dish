import 'dart:math';

import 'package:flutter/material.dart';
import 'package:malaysia_recipe/widget/floating_action_button.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:anim_search_bar/anim_search_bar.dart';

import 'play_random_video.dart';

class Player extends StatefulWidget {
  const Player({super.key});

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  TextEditingController textController = TextEditingController();
  late YoutubePlayerController _controller;
  late YoutubeMetaData _videoMetaData;
  bool _isPlayerReady = false;
  double _volume = 100;
  List allDishUrls = [];
  String youtubeUrl = '';

  @override
  void initState() {
    super.initState();
    allDishUrls = getUrls();

    youtubeUrl = allDishUrls.isNotEmpty
        ? allDishUrls[Random().nextInt(allDishUrls.length)]
        : '';

    _controller = YoutubePlayerController(
        initialVideoId: getVideoId(youtubeUrl),
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
          loop: true,
        ))
      ..addListener(listener);
    _videoMetaData = const YoutubeMetaData();
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _videoMetaData = _controller.metadata;
      });
    }
  }

  String getVideoId(url) {
    String? urlToId = YoutubePlayer.convertUrlToId(url);
    return urlToId ?? '';
  }

  void playVideoByUrl(String url) {
    String videoId = getVideoId(url);
    _controller.load(videoId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Youtube Player ( No Ads! )'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            children: [
              AnimSearchBar(
                width: 400,
                helpText: 'Insert any Youtube URL...',
                textController: textController,
                onSuffixTap: () {
                  setState(() {
                    textController.clear();
                  });
                },
                rtl: true,
                onSubmitted: (String value) {
                  setState(() {
                    youtubeUrl = value;
                    playVideoByUrl(youtubeUrl);
                  });
                },
              ),
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.5),
                  child: Column(
                    children: [
                      Text(
                        _videoMetaData.title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      YoutubePlayer(
                        controller: _controller,
                        showVideoProgressIndicator: true,
                        progressIndicatorColor: Colors.blueAccent,
                        onReady: () {
                          _isPlayerReady = true;
                        },
                      ),
                      const SizedBox(height: 10),
                      Text(
                        _videoMetaData.author,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: <Widget>[
                          const Text(
                            "Volume",
                            style: TextStyle(fontWeight: FontWeight.w300),
                          ),
                          Expanded(
                            child: Slider(
                              inactiveColor: Colors.transparent,
                              value: _volume,
                              min: 0.0,
                              max: 100.0,
                              divisions: 10,
                              label: '${(_volume).round()}',
                              onChanged: _isPlayerReady
                                  ? (value) {
                                      setState(() {
                                        _volume = value;
                                      });
                                      _controller.setVolume(_volume.round());
                                    }
                                  : null,
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            icon: Icon(
                              _controller.value.isPlaying
                                  ? Icons.pause_circle_outline
                                  : Icons.play_circle_outline,
                            ),
                            onPressed: _isPlayerReady
                                ? () {
                                    _controller.value.isPlaying
                                        ? _controller.pause()
                                        : _controller.play();
                                    setState(() {});
                                  }
                                : null,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatButtonWidget(url: youtubeUrl),
    );
  }
}
