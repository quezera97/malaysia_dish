import 'package:flutter/material.dart';
import 'package:malaysia_dish/ui/popular_dish/popular_dish_video.dart';

import '../../enum/malaysia_states_enum.dart';
import '../../enum/state_popular_dish_list.dart';

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

class StateDishInfo {
  final String stateName;
  final List statePopularDish;
  final Map<String, String> statePopularDishUrl;

  StateDishInfo({
    required this.stateName,
    required this.statePopularDish,
    required this.statePopularDishUrl,
  });
}

List<StateDishInfo> stateDishInfoList = [
  StateDishInfo(
    stateName: StateEnum.johor,
    statePopularDish: StatePopularDishList.johor().dishes,
    statePopularDishUrl: johorUrl,
  ),
  StateDishInfo(
    stateName: StateEnum.nismilan,
    statePopularDish: StatePopularDishList.nismilan().dishes,
    statePopularDishUrl: nismilanUrl,
  ),
  StateDishInfo(
    stateName: StateEnum.melaka,
    statePopularDish: StatePopularDishList.melaka().dishes,
    statePopularDishUrl: melakaUrl,
  ),
  StateDishInfo(
    stateName: StateEnum.kelantan,
    statePopularDish: StatePopularDishList.kelantan().dishes,
    statePopularDishUrl: kelantanUrl,
  ),
  StateDishInfo(
    stateName: StateEnum.kedah,
    statePopularDish: StatePopularDishList.kedah().dishes,
    statePopularDishUrl: kedahUrl,
  ),
  StateDishInfo(
    stateName: StateEnum.pahang,
    statePopularDish: StatePopularDishList.pahang().dishes,
    statePopularDishUrl: pahangUrl,
  ),
  StateDishInfo(
    stateName: StateEnum.perak,
    statePopularDish: StatePopularDishList.perak().dishes,
    statePopularDishUrl: perakUrl,
  ),
  StateDishInfo(
    stateName: StateEnum.perlis,
    statePopularDish: StatePopularDishList.perlis().dishes,
    statePopularDishUrl: perlisUrl,
  ),
  StateDishInfo(
    stateName: StateEnum.pinang,
    statePopularDish: StatePopularDishList.pinang().dishes,
    statePopularDishUrl: pinangUrl,
  ),
  StateDishInfo(
    stateName: StateEnum.sabah,
    statePopularDish: StatePopularDishList.sabah().dishes,
    statePopularDishUrl: sabahUrl,
  ),
  StateDishInfo(
    stateName: StateEnum.sarawak,
    statePopularDish: StatePopularDishList.sarawak().dishes,
    statePopularDishUrl: sarawakUrl,
  ),
  StateDishInfo(
    stateName: StateEnum.terengganu,
    statePopularDish: StatePopularDishList.terengganu().dishes,
    statePopularDishUrl: terengganuUrl,
  ),
];

class PopularDishList extends StatefulWidget {
  const PopularDishList({super.key});

  @override
  State<PopularDishList> createState() => _PopularDishListState();
}

class _PopularDishListState extends State<PopularDishList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ListView.builder(
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
                      subtitle: Column(
                        children: stateInfo.statePopularDish
                            .map((dish) => ListTile(
                                  trailing: const Icon(Icons.arrow_right),
                                  title: Text(dish),
                                  onTap: () {
                                    String? dishURL =
                                        stateInfo.statePopularDishUrl[dish];

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
