import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

import '../../enum/malaysia_states_enum.dart';
import '../../enum/popularDishByState/ingredients/johor_ingredients.dart';
import '../../enum/popularDishByState/ingredients/kedah_ingredients.dart';
import '../../enum/popularDishByState/ingredients/kelantan_ingredients.dart';
import '../../enum/popularDishByState/ingredients/melaka_ingredients.dart';
import '../../enum/popularDishByState/ingredients/nismilan_ingredients.dart';
import '../../enum/popularDishByState/ingredients/pahang_ingredients.dart';
import '../../enum/popularDishByState/ingredients/perak_ingredients.dart';
import '../../enum/popularDishByState/ingredients/perlis_ingredients.dart';
import '../../enum/popularDishByState/ingredients/pinang_ingredients.dart';
import '../../enum/popularDishByState/ingredients/sabah_ingredients.dart';
import '../../enum/popularDishByState/ingredients/sarawak_ingredients.dart';
import '../../enum/popularDishByState/ingredients/terengganu_ingredients.dart';

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
    } else if (stateName == StateEnum.kelantan) {
      selectedHtmlWidget = HtmlWidget(
        kelantanIngredients[dishName]!,
      );
    } else if (stateName == StateEnum.melaka) {
      selectedHtmlWidget = HtmlWidget(
        melakaIngredients[dishName]!,
      );
    } else if (stateName == StateEnum.nismilan) {
      selectedHtmlWidget = HtmlWidget(
        nismilanIngredients[dishName]!,
      );
    } else if (stateName == StateEnum.pahang) {
      selectedHtmlWidget = HtmlWidget(
        pahangIngredients[dishName]!,
      );
    } else if (stateName == StateEnum.perak) {
      selectedHtmlWidget = HtmlWidget(
        perakIngredients[dishName]!,
      );
    } else if (stateName == StateEnum.perlis) {
      selectedHtmlWidget = HtmlWidget(
        perlisIngredients[dishName]!,
      );
    } else if (stateName == StateEnum.pinang) {
      selectedHtmlWidget = HtmlWidget(
        pinangIngredients[dishName]!,
      );
    } else if (stateName == StateEnum.sabah) {
      selectedHtmlWidget = HtmlWidget(
        sabahIngredients[dishName]!,
      );
    } else if (stateName == StateEnum.sarawak) {
      selectedHtmlWidget = HtmlWidget(
        sarawakIngredients[dishName]!,
      );
    } else if (stateName == StateEnum.terengganu) {
      selectedHtmlWidget = HtmlWidget(
        terengganuIngredients[dishName]!,
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
