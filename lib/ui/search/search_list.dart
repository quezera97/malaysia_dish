import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: textController,
              decoration: InputDecoration(
                hintText: 'Carian Masakan',
                suffixIcon: textController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          setState(() {
                            textController.clear();
                            searchedValue = '';
                          });
                        },
                      )
                    : null,
              ),
              onChanged: (value) {
                setState(() {
                  searchedValue = value;
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: combinedIngredientsAndUrls.length,
              itemBuilder: (context, index) {
                final ingredients = allDishIngredients[index];

                if (searchedValue.isNotEmpty &&
                    !combinedIngredientsAndUrls[index]['ingredients']!
                        .toLowerCase()
                        .contains(searchedValue.toLowerCase())) {
                  return Container();
                }

                return Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.5),
                    child: ListTile(
                      title: HtmlWidget(ingredients),
                    ),
                  ),
                );
              },
            ),
          ),
        ]),
      ),
    );
  }
}
