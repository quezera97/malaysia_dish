import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';

import '../recipe/collect_recipe.dart';
import '../recipe/collect_url.dart';

class SearchList extends StatefulWidget {
  const SearchList({super.key});

  @override
  State<SearchList> createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> {
  TextEditingController textController = TextEditingController();
  String searchedValue = '';
  List allDishIngredients = [];
  List allDishUrls = [];
  List<Map<String, String>> combinedIngredientsAndUrls = [];

  @override
  void initState() {
    super.initState();
    allDishIngredients = getIngredients();
    allDishUrls = getUrls();

    combinedIngredientsAndUrls = combineIngredientsAndUrls();

    print(combinedIngredientsAndUrls);
  }

  List<Map<String, String>> combineIngredientsAndUrls() {
    var combinedList = <Map<String, String>>[];

    for (int i = 0; i < allDishIngredients.length; i++) {
      var ingredientMap = <String, String>{
        'ingredients': allDishIngredients[i],
        'url': allDishUrls[i]
      };
      combinedList.add(ingredientMap);
    }

    return combinedList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(''),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: 'Search',
                  ),
                  onChanged: (value) {
                    setState(() {
                      searchedValue = value;
                    });
                  },
                ),
              ),
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.5),
                  child: Column(
                    children: [
                    ]
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                //   itemCount: items.length,
                //   itemBuilder: (context, index) {
                //     if (searchedValue.isNotEmpty &&
                //         !items[index]
                //             .toLowerCase()
                //             .contains(searchedValue.toLowerCase())) {
                //       return Container();
                //     }

                //     var splittedList = items[index].split("+");

                //     if (searchedValue.isNotEmpty) {
                      
                //     }

                //     return null;
                //   },
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }
}