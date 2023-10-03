import 'package:flutter/material.dart';
import 'package:malaysia_recipe/ui/recipe/popular_dish_video.dart';

import '../enum/malaysia_states_enum.dart';
import '../enum/state_popular_dish_list.dart';

import '../enum/popularDishByState/nismilan_url.dart';
import '../enum/popularDishByState/johor_url.dart';
import '../enum/popularDishByState/melaka_url.dart';

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
];

class PopularDishList extends StatefulWidget {
  const PopularDishList({super.key});

  @override
  State<PopularDishList> createState() => _PopularDishListState();
}

class _PopularDishListState extends State<PopularDishList> {  

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
                    subtitle: Column(
                      children: stateInfo.statePopularDish
                        .map((dish) => ListTile(
                          trailing: const Icon(Icons.arrow_right),
                          title: Text(dish),
                          onTap: () {
                            String? dishURL = stateInfo.statePopularDishUrl[dish];

                            if (dishURL != null) {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => PopularDishVideo(
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
    );
  }
}