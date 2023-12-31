import 'package:flutter/material.dart';
import 'package:malaysia_dish/setting/settings.dart';
import 'package:malaysia_dish/ui/search/search_list.dart';
import 'favorite/favorite_play_list.dart';
import 'player/player.dart';
import 'popular_dish/popular_dish_list.dart';
import 'popular_sweets/popular_sweets_list.dart';
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
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Malaysia Dish'),
          leading: const Image(
            image: AssetImage('lib/assets/launcher_icon.png'),
          ),
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
                    Icons.play_arrow_outlined,
                    size: 26.0,
                  ),
                )),
            Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const SearchList(),
                      ),
                    );
                  },
                  child: const Icon(
                    Icons.search,
                    size: 26.0,
                  ),
                )),
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
                )),
          ],
          bottom: const TabBar(
            isScrollable: true,
            tabs: <Widget>[
              Tab(text: 'Dish'),
              Tab(text: 'Desserts'),
              Tab(text: 'Random Recipe'),
              Tab(text: 'Favorite'),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            PopularDishList(),
            PopularSweetList(),
            RecipeList(),
            FavoritePlayList(),
          ],
        ),
      ),
    );
  }
}
