import 'package:flutter/material.dart';
import 'initial_video.dart';
import 'popular_dish_list.dart';

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
          title: const Text('Malaysia Popular Dish by States'),
          bottom: const TabBar(
            isScrollable: true,
            tabs: <Widget>[
              Tab(icon: Icon(Icons.star), text: 'Popular Dish'),
              Tab(icon: Icon(Icons.book), text: 'Resepi Masakan'),
              Tab(icon: Icon(Icons.heart_broken), text: 'Favorit'),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            PopularDishList(),
            InitialVideo(),
            InitialVideo(),
          ],
        ),
      ),
    );
  }
}
