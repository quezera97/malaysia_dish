import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

import '../../enum/malaysia_states_enum.dart';
import '../../enum/popular_sweets_by_state/ingredients/johor_ingredients.dart';
import '../../enum/popular_sweets_by_state/ingredients/kedah_ingredients.dart';
import '../../enum/popular_sweets_by_state/ingredients/kelantan_ingredients.dart';
import '../../enum/popular_sweets_by_state/ingredients/melaka_ingredients.dart';
import '../../enum/popular_sweets_by_state/ingredients/nismilan_ingredients.dart';
import '../../enum/popular_sweets_by_state/ingredients/pahang_ingredients.dart';
import '../../enum/popular_sweets_by_state/ingredients/perak_ingredients.dart';
import '../../enum/popular_sweets_by_state/ingredients/perlis_ingredients.dart';
import '../../enum/popular_sweets_by_state/ingredients/pinang_ingredients.dart';
import '../../enum/popular_sweets_by_state/ingredients/sabah_ingredients.dart';
import '../../enum/popular_sweets_by_state/ingredients/sarawak_ingredients.dart';
import '../../enum/popular_sweets_by_state/ingredients/terengganu_ingredients.dart';

class PopularSweetsIngredients extends StatelessWidget {
  const PopularSweetsIngredients(
      {super.key, required this.stateName, required this.sweetsName});

  final String stateName;
  final String sweetsName;

  @override
  Widget build(BuildContext context) {
    Widget? selectedHtmlWidget;

    if (stateName == StateEnum.johor) {
      selectedHtmlWidget = HtmlWidget(
        johorSweetsIngredients[sweetsName]!,
      );
    } else if (stateName == StateEnum.kedah) {
      selectedHtmlWidget = HtmlWidget(
        kedahSweetsIngredients[sweetsName]!,
      );
    } else if (stateName == StateEnum.kelantan) {
      selectedHtmlWidget = HtmlWidget(
        kelantanSweetsIngredients[sweetsName]!,
      );
    } else if (stateName == StateEnum.melaka) {
      selectedHtmlWidget = HtmlWidget(
        melakaSweetsIngredients[sweetsName]!,
      );
    } else if (stateName == StateEnum.nismilan) {
      selectedHtmlWidget = HtmlWidget(
        nismilanSweetsIngredients[sweetsName]!,
      );
    } else if (stateName == StateEnum.pahang) {
      selectedHtmlWidget = HtmlWidget(
        pahangSweetsIngredients[sweetsName]!,
      );
    } else if (stateName == StateEnum.perak) {
      selectedHtmlWidget = HtmlWidget(
        perakSweetsIngredients[sweetsName]!,
      );
    } else if (stateName == StateEnum.perlis) {
      selectedHtmlWidget = HtmlWidget(
        perlisSweetsIngredients[sweetsName]!,
      );
    } else if (stateName == StateEnum.pinang) {
      selectedHtmlWidget = HtmlWidget(
        pinangSweetsIngredients[sweetsName]!,
      );
    } else if (stateName == StateEnum.sabah) {
      selectedHtmlWidget = HtmlWidget(
        sabahSweetsIngredients[sweetsName]!,
      );
    } else if (stateName == StateEnum.sarawak) {
      selectedHtmlWidget = HtmlWidget(
        sarawakSweetsIngredients[sweetsName]!,
      );
    } else if (stateName == StateEnum.terengganu) {
      selectedHtmlWidget = HtmlWidget(
        terengganuSweetsIngredients[sweetsName]!,
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
