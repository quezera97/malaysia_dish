import 'package:flutter/material.dart';
import 'package:malaysia_recipe/ui/favorite/favorite_player.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../api/youtube_api.dart';

class FavoritePlayList extends StatefulWidget {
  const FavoritePlayList({Key? key}) : super(key: key);

  @override
  State<FavoritePlayList> createState() => _FavoritePlayListState();
}

class _FavoritePlayListState extends State<FavoritePlayList> {
  List<String> dishUrl = [];
  List<YoutubePlayerController> _controllers = [];
  List<String> thumbnails = [];
  List<String> youtubeTitle = [];

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
            loop: true,
            hideThumbnail: true,
          ),
        );
      }).toList();

      thumbnails = dishUrl.map((videoUrl) {
        return getVideoThumbnailUrl(videoUrl);
      }).toList();
    });
  }

  Future<String> callYoutubeApi(String videoUrl) async {
    try {
      final youtubeApi = YoutubeApi();
      final title = await youtubeApi.getYoutubeTitle(videoUrl);

      return title;
    } catch (e) {
      print("Error fetching YouTube title: $e");
      return "Error";
    }
  }

  String getVideoId(url) {
    String? urlToId = YoutubePlayer.convertUrlToId(url);
    return urlToId ?? '';
  }

  String getVideoThumbnailUrl(url) {
    String? videoId = getVideoId(url);
    return 'https://img.youtube.com/vi/$videoId/0.jpg';
  }

  @override
  void dispose() {
    super.dispose();
    for (var controller in _controllers) {
      controller.dispose();
    }
  }

  Future<void> removeVideoFromFavorites(int index) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    dishUrl.removeAt(index);
    await prefs.setStringList('dishUrl', dishUrl);

    _controllers[index].dispose();
    _controllers.removeAt(index);
    thumbnails.removeAt(index);

    setState(() {
      dishUrl = List<String>.from(dishUrl);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: ListView.separated(
          itemCount: _controllers.length,
          separatorBuilder: (context, _) => const SizedBox(height: 5.0),
          itemBuilder: (context, index) {
            return Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: FutureBuilder<String>(
                future: callYoutubeApi(dishUrl[index]),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Column(
                      children: const [
                        SizedBox(height: 5),
                        CircularProgressIndicator(),
                        SizedBox(height: 5),
                        Text(''),
                        SizedBox(height: 5),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Text("Error: ${snapshot.error}");
                  } else {
                    final youtubeTitle = snapshot.data ?? "No title available";

                    return ListTile(
                      leading: Image.network(thumbnails[index]),
                      title: Text(youtubeTitle),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const FavoritePlayer(),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            );
          },
        ),
      ),
    );
  }
}




                // child: Column(
                //   children: [
                    // YoutubePlayer(
                    //   key: ObjectKey(_controllers[index]),
                    //   controller: _controllers[index],
                    //   showVideoProgressIndicator: true,
                    // ),
                    // const SizedBox(height: 10),
                    // Image.network(thumbnails[index]),
                    // const SizedBox(height: 10),
                    // ElevatedButton(
                    //   onPressed: () {
                    //     removeVideoFromFavorites(index);
                    //   },
                    //   style: ElevatedButton.styleFrom(
                    //     foregroundColor: Colors.white,
                    //     backgroundColor: Colors.red,
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(5.0),
                    //     ),
                    //   ),
                    //   child: const Text('Remove from Fav'),
                    // )
                //   ],
                // ),
