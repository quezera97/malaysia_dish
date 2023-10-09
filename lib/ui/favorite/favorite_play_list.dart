import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class FavoritePlayList extends StatefulWidget {
  const FavoritePlayList({Key? key}) : super(key: key);

  @override
  State<FavoritePlayList> createState() => _FavoritePlayListState();
}

class _FavoritePlayListState extends State<FavoritePlayList> {
  List<String> dishUrl = [];
  List<YoutubePlayerController> _controllers = [];

  @override
  void initState() {
    super.initState();
    getDishUrl();
  }

  Future<void> getDishUrl() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      dishUrl = prefs.getStringList('dishUrl') ?? [];
      _controllers = dishUrl.map((videoUrl) {
        return YoutubePlayerController(
          initialVideoId: getVideoId(videoUrl),
          flags: const YoutubePlayerFlags(
            autoPlay: false,
          ),
        );
      }).toList();
    });
  }

  @override
  void dispose() {
    super.dispose();
    for (var controller in _controllers) {
      controller.dispose();
    }
  }

  String getVideoId(url) {
    String? urlToId = YoutubePlayer.convertUrlToId(url);
    return urlToId ?? '';
  }

  Future<void> removeVideoFromFavorites(int index) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    dishUrl.removeAt(index);
    await prefs.setStringList('dishUrl', dishUrl);

    _controllers[index].dispose();
    _controllers.removeAt(index);

    setState(() {
      dishUrl = List<String>.from(dishUrl);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemBuilder: (context, index) {
          return Card(
            elevation: 5, // Add elevation for a raised look
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0), // Add rounded corners
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  YoutubePlayer(
                    key: ObjectKey(_controllers[index]),
                    controller: _controllers[index],
                    showVideoProgressIndicator:
                        true, // Show a loading indicator
                  ),
                  SizedBox(height: 10), // Add spacing
                  ElevatedButton(
                    onPressed: () {
                      removeVideoFromFavorites(index);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red, // Button background color
                      onPrimary: Colors.white, // Text color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            5.0), // Button's rounded corners
                      ),
                    ),
                    child: const Text('Remove from Fav'),
                  )
                ],
              ),
            ),
          );
        },
        itemCount: _controllers.length,
        separatorBuilder: (context, _) => const SizedBox(height: 10.0),
      ),
    );
  }
}
