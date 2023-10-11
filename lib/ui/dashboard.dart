import 'package:flutter/material.dart';
import 'package:malaysia_recipe/setting/settings.dart';
import 'favorite/favorite_play_list.dart';
import 'player/player.dart';
import 'popular_dish/popular_dish_list.dart';
import 'recipe/recipe_list.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Malaysian Dish'),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const Player(),
                    ),
                  );
                },
                child: const Icon(
                  Icons.playlist_play_sharp,
                  size: 26.0,
                ),
              )
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const Settings(),
                    ),
                  );
                },
                child: const Icon(
                  Icons.settings,
                  size: 26.0,
                ),
              )
            ),
          ],
          bottom: const TabBar(
            isScrollable: true,
            tabs: <Widget>[
              Tab(text: 'State Dish'),
              Tab(text: 'Recipe'),
              Tab(text: 'Favorite'),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            PopularDishList(),
            RecipeList(),
            FavoritePlayList(),
          ],
        ),
      ),
    );
  }
}
