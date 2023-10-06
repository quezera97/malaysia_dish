import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:malaysia_recipe/enum/popularDishByState/url/johor_url.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../enum/popularDishByState/ingredients/johor_ingredients.dart';

class PopularDishVideo extends StatefulWidget {
  const PopularDishVideo({
    super.key, 
    required this.nameOfDish, 
    required this.youtubeUrl
  });

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.nameOfDish} Dish Recipe'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            YoutubePlayer(
              controller: YoutubePlayerController(
                initialVideoId: getVideoId(widget.youtubeUrl),
                flags: const YoutubePlayerFlags(
                  autoPlay: false,
                  mute: false,
                ),
              ),
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.blueAccent,
            ),
            Html(
              data: johorIngredients[widget.nameOfDish],
            ),
          ],
        )
      ),
    );
  }
}