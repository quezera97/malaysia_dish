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
        johorIngredients[sweetsName]!,
      );
    } else if (stateName == StateEnum.kedah) {
      selectedHtmlWidget = HtmlWidget(
        kedahIngredients[sweetsName]!,
      );
    } else if (stateName == StateEnum.kelantan) {
      selectedHtmlWidget = HtmlWidget(
        kelantanIngredients[sweetsName]!,
      );
    } else if (stateName == StateEnum.melaka) {
      selectedHtmlWidget = HtmlWidget(
        melakaIngredients[sweetsName]!,
      );
    } else if (stateName == StateEnum.nismilan) {
      selectedHtmlWidget = HtmlWidget(
        nismilanIngredients[sweetsName]!,
      );
    } else if (stateName == StateEnum.pahang) {
      selectedHtmlWidget = HtmlWidget(
        pahangIngredients[sweetsName]!,
      );
    } else if (stateName == StateEnum.perak) {
      selectedHtmlWidget = HtmlWidget(
        perakIngredients[sweetsName]!,
      );
    } else if (stateName == StateEnum.perlis) {
      selectedHtmlWidget = HtmlWidget(
        perlisIngredients[sweetsName]!,
      );
    } else if (stateName == StateEnum.pinang) {
      selectedHtmlWidget = HtmlWidget(
        pinangIngredients[sweetsName]!,
      );
    } else if (stateName == StateEnum.sabah) {
      selectedHtmlWidget = HtmlWidget(
        sabahIngredients[sweetsName]!,
      );
    } else if (stateName == StateEnum.sarawak) {
      selectedHtmlWidget = HtmlWidget(
        sarawakIngredients[sweetsName]!,
      );
    } else if (stateName == StateEnum.terengganu) {
      selectedHtmlWidget = HtmlWidget(
        terengganuIngredients[sweetsName]!,
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
