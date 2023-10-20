import 'package:flutter/material.dart';
import 'package:malaysia_dish/enum/popular_sweets_enum.dart';
import 'package:malaysia_dish/widget/floating_action_button.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../enum/popular_sweets_by_state/url/nismilan_url.dart';
import '../../enum/popular_sweets_by_state/url/perak_url.dart';
import '../../widget/navigate_to_webview.dart';
import 'popular_sweets_ingredient.dart';

class PopularSweetsVideo extends StatefulWidget {
  const PopularSweetsVideo(
      {super.key,
      required this.stateName,
      required this.nameOfSweets,
      required this.youtubeUrl});

  final String stateName;
  final String nameOfSweets;
  final String youtubeUrl;

  @override
  State<PopularSweetsVideo> createState() => _PopularSweetsVideoState();
}

class _PopularSweetsVideoState extends State<PopularSweetsVideo> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
        initialVideoId: getVideoId(widget.youtubeUrl),
        flags: YoutubePlayerFlags(
          autoPlay: false,
          controlsVisibleAtStart: true,
          mute: false,
          startAt: getStartAt(widget.youtubeUrl),
          loop: true,
        ));
  }

  String getVideoId(String videoUrl) {
    var urlToId = YoutubePlayer.convertUrlToId(videoUrl);

    if (urlToId != null) {
      return urlToId;
    } else {
      return '';
    }
  }

  int getStartAt(youtubeUrl) {
    int startAt = 0;

    if (youtubeUrl == nismilanSweetsUrl[PopularSweetsEnum.kuihApamJohol]) {
      startAt = 66;
    } else if (youtubeUrl ==
        nismilanSweetsUrl[PopularSweetsEnum.kuihSopangKukus]) {
      startAt = 30;
    } else if (youtubeUrl == perakSweetsUrl[PopularSweetsEnum.kuihKandas]) {
      startAt = 90;
    }

    return startAt;
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: _controller,
        ),
        builder: (context, player) {
          return Scaffold(
            appBar: AppBar(
              title: Text('${widget.nameOfSweets} Desserts Recipe'),
            ),
            body: SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.all(10.5),
              child: Column(
                children: [
                  YoutubePlayer(
                    controller: _controller,
                    showVideoProgressIndicator: true,
                    progressIndicatorColor: Colors.blueAccent,
                  ),
                  PopularSweetsIngredients(
                      stateName: widget.stateName,
                      sweetsName: widget.nameOfSweets),
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
                                youtubeUrl: widget.youtubeUrl,
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
            )),
            floatingActionButton: FloatButtonWidget(url: widget.youtubeUrl),
          );
        });
  }
}
