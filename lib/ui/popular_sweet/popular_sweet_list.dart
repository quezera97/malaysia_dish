import 'package:flutter/material.dart';
import 'package:malaysia_recipe/ui/popular_dish/popular_dish_video.dart';

import '../../enum/malaysia_states_enum.dart';

import '../../enum/popular_dish_by_state/url/kedah_url.dart';
import '../../enum/popular_dish_by_state/url/pahang_url.dart';
import '../../enum/popular_dish_by_state/url/perak_url.dart';
import '../../enum/popular_dish_by_state/url/perlis__url.dart';
import '../../enum/popular_dish_by_state/url/pinang_url.dart';
import '../../enum/popular_dish_by_state/url/sabah_url.dart';
import '../../enum/popular_dish_by_state/url/sarawak_url.dart';
import '../../enum/popular_dish_by_state/url/terengganu_url.dart';
import '../../enum/popular_dish_by_state/url/kelantan_url.dart';
import '../../enum/popular_dish_by_state/url/nismilan_url.dart';
import '../../enum/popular_dish_by_state/url/johor_url.dart';
import '../../enum/popular_dish_by_state/url/melaka_url.dart';
import '../../enum/state_popular_sweet_list.dart';

class StateDishInfo {
  final String stateName;
  final List statePopularSweet;
  final Map<String, String> statePopularSweetUrl;

  StateDishInfo({
    required this.stateName,
    required this.statePopularSweet,
    required this.statePopularSweetUrl,
  });
}

List<StateDishInfo> stateSweetInfoList = [
  StateDishInfo(
    stateName: StateEnum.johor,
    statePopularSweet: StatePopularSweetList.johor().dishes,
    statePopularSweetUrl: johorUrl,
  ),
  StateDishInfo(
    stateName: StateEnum.nismilan,
    statePopularSweet: StatePopularSweetList.nismilan().dishes,
    statePopularSweetUrl: nismilanUrl,
  ),
  StateDishInfo(
    stateName: StateEnum.melaka,
    statePopularSweet: StatePopularSweetList.melaka().dishes,
    statePopularSweetUrl: melakaUrl,
  ),
  StateDishInfo(
    stateName: StateEnum.kelantan,
    statePopularSweet: StatePopularSweetList.kelantan().dishes,
    statePopularSweetUrl: kelantanUrl,
  ),
  StateDishInfo(
    stateName: StateEnum.kedah,
    statePopularSweet: StatePopularSweetList.kedah().dishes,
    statePopularSweetUrl: kedahUrl,
  ),
  StateDishInfo(
    stateName: StateEnum.pahang,
    statePopularSweet: StatePopularSweetList.pahang().dishes,
    statePopularSweetUrl: pahangUrl,
  ),
  StateDishInfo(
    stateName: StateEnum.perak,
    statePopularSweet: StatePopularSweetList.perak().dishes,
    statePopularSweetUrl: perakUrl,
  ),
  StateDishInfo(
    stateName: StateEnum.perlis,
    statePopularSweet: StatePopularSweetList.perlis().dishes,
    statePopularSweetUrl: perlisUrl,
  ),
  StateDishInfo(
    stateName: StateEnum.pinang,
    statePopularSweet: StatePopularSweetList.pinang().dishes,
    statePopularSweetUrl: pinangUrl,
  ),
  StateDishInfo(
    stateName: StateEnum.sabah,
    statePopularSweet: StatePopularSweetList.sabah().dishes,
    statePopularSweetUrl: sabahUrl,
  ),
  StateDishInfo(
    stateName: StateEnum.sarawak,
    statePopularSweet: StatePopularSweetList.sarawak().dishes,
    statePopularSweetUrl: sarawakUrl,
  ),
  StateDishInfo(
    stateName: StateEnum.terengganu,
    statePopularSweet: StatePopularSweetList.terengganu().dishes,
    statePopularSweetUrl: terengganuUrl,
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
                        children: stateInfo.statePopularSweet
                            .map((dish) => ListTile(
                                  trailing: const Icon(Icons.arrow_right),
                                  title: Text(dish),
                                  onTap: () {
                                    String? dishURL =
                                        stateInfo.statePopularSweetUrl[dish];

                                    if (dishURL != null) {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              PopularDishVideo(
                                            stateName: stateInfo.stateName,
                                            nameOfDish: dish,
                                            youtubeUrl: dishURL, // Pass the URL
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
