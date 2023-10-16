import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../widget/floating_action_button.dart';
import '../player/play_random_video.dart';
import '../../widget/navigate_to_webview.dart';
import 'collect_recipe.dart';

class RecipeList extends StatefulWidget {
  const RecipeList({super.key});

  @override
  State<RecipeList> createState() => _RecipeListState();
}

class _RecipeListState extends State<RecipeList> {
  late YoutubePlayerController _controller;
  List allDishIngredients = [];
  List allDishUrls = [];
  List<Map<String, String>> combinedIngredientsAndUrls = [];
  int randomIndex = 0;
  var selectedCombined = {};

  @override
  void initState() {
    super.initState();
    allDishIngredients = getIngredients();
    allDishUrls = getUrls();

    combinedIngredientsAndUrls = combineIngredientsAndUrls();

    randomIndex = Random().nextInt(combinedIngredientsAndUrls.length);

    selectedCombined = combinedIngredientsAndUrls[randomIndex];

    _controller = YoutubePlayerController(
      initialVideoId: getVideoId(selectedCombined['url'].toString()),
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        loop: true,
        controlsVisibleAtStart: true,
      ),
    );
  }

  List<Map<String, String>> combineIngredientsAndUrls() {
    var combinedList = <Map<String, String>>[];

    for (int i = 0; i < allDishIngredients.length; i++) {
      var ingredientMap = <String, String>{
        'ingredients': allDishIngredients[i],
        'url': allDishUrls[i]
      };
      combinedList.add(ingredientMap);
    }

    return combinedList;
  }

  String getVideoId(url) {
    String? urlToId = YoutubePlayer.convertUrlToId(url);
    return urlToId ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.5),
              child: Column(
                children: [
                  YoutubePlayer(
                    controller: _controller,
                    showVideoProgressIndicator: true,
                    progressIndicatorColor: Colors.blueAccent,
                  ),
                  const SizedBox(height: 10),
                  HtmlWidget(selectedCombined['ingredients'].toString()),
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
                                youtubeUrl: selectedCombined['url'].toString(),
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
      floatingActionButton:
          FloatButtonWidget(url: selectedCombined['url'].toString()),
    );
  }
}
