import 'package:flutter/material.dart';
import 'favorite/favorite_play_list.dart';
import 'player/player.dart';
import 'popular_dish/popular_dish_list.dart';

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
          title: const Text('Malaysia Popular Dish'),
          bottom: const TabBar(
            isScrollable: true,
            tabs: <Widget>[
              Tab(icon: Icon(Icons.star), text: 'Popular Dish'),
              Tab(icon: Icon(Icons.play_arrow), text: 'Player'),
              Tab(icon: Icon(Icons.favorite), text: 'Favorite'),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            PopularDishList(),
            Player(),
            FavoritePlayList(),
          ],
        ),
      ),
    );
  }
}
