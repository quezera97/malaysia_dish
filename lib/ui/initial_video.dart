import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:anim_search_bar/anim_search_bar.dart';

class InitialVideo extends StatefulWidget {
  const InitialVideo({super.key});

  @override
  State<InitialVideo> createState() => _InitialVideoState();
}

class _InitialVideoState extends State<InitialVideo> {
  late YoutubePlayerController _controller1;
  late YoutubePlayerController _controller2;
  TextEditingController textController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _controller1 = YoutubePlayerController(
      initialVideoId: getVideoId1(),
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
    _controller2 = YoutubePlayerController(
      initialVideoId: getVideoId2(),
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  String getVideoId1(){
    var urlToId = YoutubePlayer.convertUrlToId("https://www.youtube.com/watch?v=6uZy86ePgO0&ab_channel=JYPEntertainment");

    setState(() {
      urlToId;
    });

    return urlToId!;
  }
  String getVideoId2(){
    var urlToId = YoutubePlayer.convertUrlToId("https://www.youtube.com/watch?v=uHHIM_fWTf8&list=RDuHHIM_fWTf8&start_radio=1&ab_channel=MusicChannelHM");

    setState(() {
      urlToId;
    });

    return urlToId!;
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: Column(
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
              print("onSubmitted value: " + value);
            },
          ),
          YoutubePlayer(
            controller: _controller1,
            showVideoProgressIndicator: true,
            progressIndicatorColor: Colors.blueAccent,
          ),
          YoutubePlayer(
            controller: _controller2,
            showVideoProgressIndicator: true,
            progressIndicatorColor: Colors.blueAccent,
          ),
        ],
      )
    );
  }
}