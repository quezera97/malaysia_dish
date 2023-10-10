import 'package:flutter/material.dart';
import 'package:malaysia_recipe/enum/popularDishByState/url/nismilan_url.dart';
import 'package:malaysia_recipe/ui/popular_dish/popular_dish_ingredient.dart';
import 'package:malaysia_recipe/widget/floating_action_button.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../enum/popularDishByState/url/melaka_url.dart';
import '../../enum/popular_dish_enum.dart';

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
              controller: YoutubePlayerController(
                initialVideoId: getVideoId(widget.youtubeUrl),
                flags: YoutubePlayerFlags(
                  autoPlay: false,
                  controlsVisibleAtStart: true,
                  mute: false,
                  startAt: getStartAt(widget.youtubeUrl),
                  loop: true,
                ),
              ),
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.blueAccent,
            ),
            PopularDishIngredients(
                stateName: widget.stateName, dishName: widget.nameOfDish),
          ],
        ),
      )),
      floatingActionButton: FloatButtonWidget(url: widget.youtubeUrl),
    );
  }
}
