import 'package:flutter/material.dart';
import 'package:malaysia_recipe/ui/favorite/favorite_player.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../api/youtube_api.dart';
import '../../widget/animation_builder.dart';

class FavoritePlayList extends StatefulWidget {
  const FavoritePlayList({Key? key}) : super(key: key);

  @override
  State<FavoritePlayList> createState() => _FavoritePlayListState();
}

class _FavoritePlayListState extends State<FavoritePlayList>
    with TickerProviderStateMixin {
  List<String> dishUrl = [];
  List<YoutubePlayerController> _controllers = [];
  var responseYoutubeApi = [];
  int indexPrefs = 0;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    getDishUrl();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    animationController.dispose();

    super.dispose();
    for (var controller in _controllers) {
      controller.dispose();
    }
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
    });
  }

  Future<Map<String, dynamic>> callYoutubeApi(String videoUrl) async {
    final apiService = YoutubeApi();

    try {
      final videoDetailsMap = await apiService.getYoutubeDetails(videoUrl);

      if (videoDetailsMap.isNotEmpty) {
        return videoDetailsMap;
      } else {
        return {};
      }
    } catch (e) {
      return {};
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
    final snackBarDelete = SnackBar(
      content: const Text('Delete from favorite'),
      action: SnackBarAction(
        label: 'Yes!',
        onPressed: () {
          removeVideoFromFavorites(indexPrefs);
        },
      ),
    );

    const snackBarRefresh = SnackBar(
      content: Text('Page Refreshed'),
      duration: Duration(seconds: 1),
      showCloseIcon: true,
    );

    if (_controllers.isEmpty) {
      return Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 100,
            width: 100,
            child: Image.asset('lib/assets/no-love.png'),
          ),
          const SizedBox(height: 10),
          const Text('No favorites available!'),
        ],
      ));
    } else {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(5.0),
          child: RefreshIndicator(
              child: ListView.separated(
                itemCount: _controllers.length,
                physics: const AlwaysScrollableScrollPhysics(),
                separatorBuilder: (context, _) => const SizedBox(height: 5.0),
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: FutureBuilder(
                      future: callYoutubeApi(dishUrl[index]),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return AnimationBuilderWidget(
                            animationController: animationController,
                            child: const Image(
                              image: AssetImage('lib/assets/launcher_icon.png'),
                              height: 100,
                              width: 100,
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return Text("Error: ${snapshot.error}");
                        } else {
                          var videoDetails = snapshot.data;
                          return SizedBox(
                            height: 90,
                            child: ListTile(
                              contentPadding: const EdgeInsets.all(10),
                              leading: InkWell(
                                child: Image.network(
                                  videoDetails!['thumbnailUrl'],
                                  fit: BoxFit.cover,
                                ),
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => FavoritePlayer(
                                        controllers: _controllers,
                                        index: index,
                                        title: videoDetails['title'],
                                        url: dishUrl[index],
                                      ),
                                    ),
                                  );
                                },
                              ),
                              title: Text(
                                videoDetails['title'],
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              subtitle: Text(
                                videoDetails['authorName'],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              trailing: IconButton(
                                icon: const Icon(Icons.more_vert),
                                onPressed: () {
                                  indexPrefs = index;

                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBarDelete);
                                },
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  );
                },
              ),
              onRefresh: () {
                return Future.delayed(
                  const Duration(seconds: 1),
                  () async {
                    await getDishUrl();
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(snackBarRefresh);
                  },
                );
              }),
        ),
      );
    }
  }
}
