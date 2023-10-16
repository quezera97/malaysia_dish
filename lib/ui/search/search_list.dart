import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:html/parser.dart' as html;
import 'package:url_launcher/url_launcher.dart';

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

  String getDishNameFromIngredients(String ingredients) {
    final document = html.parse(ingredients);
    final h2Elements = document.getElementsByTagName('h2');

    if (h2Elements.isNotEmpty) {
      var dishName = h2Elements[0].text;
      dishName = dishName.replaceAll(':', '');

      return dishName;
    }

    return '';
  }

  Future<void> _launchUrl(url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
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
                hintText: 'Search for Dish, Sweets & Ingredients',
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
                final url = allDishUrls[index];
                final dishName = getDishNameFromIngredients(ingredients);

                if (searchedValue.isNotEmpty &&
                    !dishName.toLowerCase().contains(searchedValue.toLowerCase())) {
                  return Container();
                }

                return Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: ExpansionTile(
                    title: Text(dishName),
                    children: [
                      Column(
                        children: [
                          InkWell(
                            child: const Text('Play in Youtube'),
                            onTap: () {
                              _launchUrl(url);
                            },
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.5),
                        child: HtmlWidget(ingredients),
                      ),
                    ],
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
