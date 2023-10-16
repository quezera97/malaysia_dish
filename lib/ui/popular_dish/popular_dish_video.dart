import 'package:flutter/material.dart';
import 'package:malaysia_recipe/enum/popular_dish_by_state/url/nismilan_url.dart';
import 'package:malaysia_recipe/ui/popular_dish/popular_dish_ingredient.dart';
import 'package:malaysia_recipe/widget/floating_action_button.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../enum/popular_dish_by_state/url/melaka_url.dart';
import '../../enum/popular_dish_enum.dart';
import '../../widget/navigate_to_webview.dart';

class PopularDishVideo extends StatefulWidget {
  const PopularDishVideo(
      {super.key,
      required this.stateName,
      required this.nameOfDish,
      required this.youtubeUrl});

  final String stateName;
  final String nameOfDish;
  final String youtubeUrl;

  @override
  State<PopularDishVideo> createState() => _PopularDishVideoState();
}

class _PopularDishVideoState extends State<PopularDishVideo> {
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

    if (youtubeUrl == melakaUrl[PopularDishEnum.laokAramJada]) {
      startAt = 230;
    } else if (youtubeUrl == nismilanUrl[PopularDishEnum.rendangKepayo]) {
      startAt = 43;
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
              title: Text('${widget.nameOfDish} Dish Recipe'),
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
                  PopularDishIngredients(
                      stateName: widget.stateName, dishName: widget.nameOfDish),
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
