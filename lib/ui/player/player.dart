import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:anim_search_bar/anim_search_bar.dart';

class Player extends StatefulWidget {
  const Player({super.key});

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  TextEditingController textController = TextEditingController();
  String youtubeUrl = 'https://youtu.be/0V0eRLGlNPQ?si=oTvGYVMnNg9fzMMr';
  late YoutubePlayerController _controller;
  late YoutubeMetaData _videoMetaData;
  bool _isPlayerReady = false;
  double _volume = 100;

  @override
  void initState() {
    super.initState();
    // Initialize the controller with the default video
    _controller = YoutubePlayerController(
      initialVideoId: getVideoId(youtubeUrl),
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      )
    )  ..addListener(listener);
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

    if (urlToId != null) {
      setState(() {
        urlToId;
      });
      return urlToId;
    } else {
      return 'https://youtu.be/cQTo9O85Zro?si=XoFdzTeNR5mUuxKX';
    }
  }

  void playVideoByUrl(String url) {
    String videoId = getVideoId(url);
    _controller.load(videoId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.5),
          child: Column(
            children: [
              AnimSearchBar(
                width: 400,
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
              Text(
                _videoMetaData.title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.blueAccent,
                onReady: () {
                  _isPlayerReady = true;
                },
              ),
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
                          ? Icons.pause
                          : Icons.play_arrow,
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
    );
  }
}
