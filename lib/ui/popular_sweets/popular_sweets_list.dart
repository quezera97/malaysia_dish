import 'package:flutter/material.dart';

import '../../enum/malaysia_states_enum.dart';

import '../../enum/popular_sweets_by_state/url/kedah_url.dart';
import '../../enum/popular_sweets_by_state/url/pahang_url.dart';
import '../../enum/popular_sweets_by_state/url/perak_url.dart';
import '../../enum/popular_sweets_by_state/url/perlis_url.dart';
import '../../enum/popular_sweets_by_state/url/pinang_url.dart';
import '../../enum/popular_sweets_by_state/url/sabah_url.dart';
import '../../enum/popular_sweets_by_state/url/sarawak_url.dart';
import '../../enum/popular_sweets_by_state/url/terengganu_url.dart';
import '../../enum/popular_sweets_by_state/url/kelantan_url.dart';
import '../../enum/popular_sweets_by_state/url/nismilan_url.dart';
import '../../enum/popular_sweets_by_state/url/johor_url.dart';
import '../../enum/popular_sweets_by_state/url/melaka_url.dart';
import '../../enum/state_popular_sweets_list.dart';
import 'popular_sweets_video.dart';

class StateSweetsInfo {
  final String stateName;
  final List statePopularSweets;
  final Map<String, String> statePopularSweetsUrl;

  StateSweetsInfo({
    required this.stateName,
    required this.statePopularSweets,
    required this.statePopularSweetsUrl,
  });
}

List<StateSweetsInfo> stateSweetInfoList = [
  StateSweetsInfo(
    stateName: StateEnum.johor,
    statePopularSweets: StatePopularSweetsList.johor().sweets,
    statePopularSweetsUrl: johorSweetsUrl,
  ),
  StateSweetsInfo(
    stateName: StateEnum.nismilan,
    statePopularSweets: StatePopularSweetsList.nismilan().sweets,
    statePopularSweetsUrl: nismilanSweetsUrl,
  ),
  StateSweetsInfo(
    stateName: StateEnum.melaka,
    statePopularSweets: StatePopularSweetsList.melaka().sweets,
    statePopularSweetsUrl: melakaSweetsUrl,
  ),
  StateSweetsInfo(
    stateName: StateEnum.kelantan,
    statePopularSweets: StatePopularSweetsList.kelantan().sweets,
    statePopularSweetsUrl: kelantanSweetsUrl,
  ),
  StateSweetsInfo(
    stateName: StateEnum.kedah,
    statePopularSweets: StatePopularSweetsList.kedah().sweets,
    statePopularSweetsUrl: kedahSweetsUrl,
  ),
  StateSweetsInfo(
    stateName: StateEnum.pahang,
    statePopularSweets: StatePopularSweetsList.pahang().sweets,
    statePopularSweetsUrl: pahangSweetsUrl,
  ),
  StateSweetsInfo(
    stateName: StateEnum.perak,
    statePopularSweets: StatePopularSweetsList.perak().sweets,
    statePopularSweetsUrl: perakSweetsUrl,
  ),
  StateSweetsInfo(
    stateName: StateEnum.perlis,
    statePopularSweets: StatePopularSweetsList.perlis().sweets,
    statePopularSweetsUrl: perlisSweetsUrl,
  ),
  StateSweetsInfo(
    stateName: StateEnum.pinang,
    statePopularSweets: StatePopularSweetsList.pinang().sweets,
    statePopularSweetsUrl: pinangSweetsUrl,
  ),
  StateSweetsInfo(
    stateName: StateEnum.sabah,
    statePopularSweets: StatePopularSweetsList.sabah().sweets,
    statePopularSweetsUrl: sabahSweetsUrl,
  ),
  StateSweetsInfo(
    stateName: StateEnum.sarawak,
    statePopularSweets: StatePopularSweetsList.sarawak().sweets,
    statePopularSweetsUrl: sarawakSweetsUrl,
  ),
  StateSweetsInfo(
    stateName: StateEnum.terengganu,
    statePopularSweets: StatePopularSweetsList.terengganu().sweets,
    statePopularSweetsUrl: terengganuSweetsUrl,
  ),
];

class PopularSweetList extends StatefulWidget {
  const PopularSweetList({super.key});

  @override
  State<PopularSweetList> createState() => _PopularSweetListState();
}

class _PopularSweetListState extends State<PopularSweetList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ListView.builder(
        itemCount: stateSweetInfoList.length,
        itemBuilder: (context, index) {
          var stateInfo = stateSweetInfoList[index];

          return Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ExpansionTile(
                  title: Text(stateInfo.stateName),
                  children: [
                    ListTile(
                      subtitle: Column(
                        children: stateInfo.statePopularSweets
                            .map((sweets) => ListTile(
                                  trailing: const Icon(Icons.arrow_right),
                                  title: Text(sweets),
                                  onTap: () {
                                    String? sweetsURL =
                                        stateInfo.statePopularSweetsUrl[sweets];

                                    if (sweetsURL != null) {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              PopularSweetsVideo(
                                            stateName: stateInfo.stateName,
                                            nameOfSweets: sweets,
                                            youtubeUrl: sweetsURL, // Pass the URL
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                ))
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
