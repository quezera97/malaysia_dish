import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../enum/malaysia_states.dart';
import '../enum/state_signature_dish.dart';
import '../enum/state_signature_dish_url.dart';

class StateDishInfo {
  final String stateName;
  final String signatureDish;
  final String dishURL;

  StateDishInfo({
    required this.stateName,
    required this.signatureDish,
    required this.dishURL,
  });
}

List<StateDishInfo> stateDishInfoList = [
  StateDishInfo(
    stateName: StateEnum.klselangor,
    signatureDish: StateSignatureDishEnum.klselangor,
    dishURL: 'URL for Nasi Ambeng',
  ),
  StateDishInfo(
    stateName: StateEnum.johor,
    signatureDish: StateSignatureDishEnum.johor,
    dishURL: StateSignatureDishUrlEnum.johor,
  ),
  StateDishInfo(
    stateName: StateEnum.nismilan,
    signatureDish: StateSignatureDishEnum.nismilan,
    dishURL: StateSignatureDishUrlEnum.nismilan,
  ),
  StateDishInfo(
    stateName: StateEnum.melaka,
    signatureDish: StateSignatureDishEnum.melaka,
    dishURL: StateSignatureDishUrlEnum.melaka,
  ),
  StateDishInfo(
    stateName: StateEnum.kelantan,
    signatureDish: StateSignatureDishEnum.kelantan,
    dishURL: 'URL for Nasi Kerabu',
  ),
  StateDishInfo(
    stateName: StateEnum.kedah,
    signatureDish: StateSignatureDishEnum.kedah,
    dishURL: StateSignatureDishUrlEnum.kedah,
  ),
  StateDishInfo(
    stateName: StateEnum.pahang,
    signatureDish: StateSignatureDishEnum.pahang,
    dishURL: 'URL for Ikan Patin Masak Tempoyak',
  ),
  StateDishInfo(
    stateName: StateEnum.perak,
    signatureDish: StateSignatureDishEnum.perak,
    dishURL: 'URL for Perak',
  ),
  StateDishInfo(
    stateName: StateEnum.perlis,
    signatureDish: StateSignatureDishEnum.perlis,
    dishURL: 'URL for Ringgi',
  ),
  StateDishInfo(
    stateName: StateEnum.pinang,
    signatureDish: StateSignatureDishEnum.pinang,
    dishURL: 'URL for Laksa Penang',
  ),
  StateDishInfo(
    stateName: StateEnum.sabah,
    signatureDish: StateSignatureDishEnum.sabah,
    dishURL: 'URL for Latok',
  ),
  StateDishInfo(
    stateName: StateEnum.sarawak,
    signatureDish: StateSignatureDishEnum.sarawak,
    dishURL: 'URL for Mee Kolok',
  ),
  StateDishInfo(
    stateName: StateEnum.terengganu,
    signatureDish: StateSignatureDishEnum.terengganu,
    dishURL: StateSignatureDishUrlEnum.terengganu,
  ),
];

class VideoList extends StatefulWidget {
  const VideoList({super.key});

  @override
  State<VideoList> createState() => _VideoListState();
}

class _VideoListState extends State<VideoList> {
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
    return ListView.builder(
      itemCount: stateDishInfoList.length,
      itemBuilder: (context, index) {
        var stateInfo = stateDishInfoList[index];

        return Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ExpansionTile(
                title: Text(stateInfo.stateName),
                children: [
                  ListTile(
                    title: Text('Signature Dish: ${stateInfo.signatureDish}'),
                    subtitle: YoutubePlayer(
                      controller: YoutubePlayerController(
                        initialVideoId: getVideoId(stateInfo.dishURL),
                        flags: const YoutubePlayerFlags(
                          autoPlay: false,
                          mute: false,
                        ),
                      ),
                      showVideoProgressIndicator: true,
                      progressIndicatorColor: Colors.blueAccent,
                    ),
                    // subtitle: Text('URL: ${stateInfo.dishURL}'),
                    onTap: () {
                      // Handle tapping the ListTile, you can use stateInfo.dishURL
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
