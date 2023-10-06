import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

import '../../enum/malaysia_states_enum.dart';
import '../../enum/popularDishByState/ingredients/johor_ingredients.dart';
import '../../enum/popularDishByState/ingredients/kedah_ingredients.dart';

class PopularDishIngredients extends StatelessWidget {
  const PopularDishIngredients(
      {super.key, required this.stateName, required this.dishName});

  final String stateName;
  final String dishName;

  @override
  Widget build(BuildContext context) {
    Widget? selectedHtmlWidget;

    if (stateName == StateEnum.johor) {
      selectedHtmlWidget = HtmlWidget(
        johorIngredients[dishName]!,
      );
    } else if (stateName == StateEnum.kedah) {
      selectedHtmlWidget = HtmlWidget(
        kedahIngredients[dishName]!,
      );
    }

    return Padding(
      padding: const EdgeInsets.all(10.5),
      child: Container(
        child: selectedHtmlWidget ?? Container(),
      ),
    );
  }
}
