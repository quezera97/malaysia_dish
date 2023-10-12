import 'package:malaysia_recipe/enum/popular_dish_by_state/ingredients/johor_ingredients.dart';

import '../../enum/popular_dish_by_state/ingredients/kedah_ingredients.dart';
import '../../enum/popular_dish_by_state/ingredients/kelantan_ingredients.dart';
import '../../enum/popular_dish_by_state/ingredients/melaka_ingredients.dart';
import '../../enum/popular_dish_by_state/ingredients/nismilan_ingredients.dart';
import '../../enum/popular_dish_by_state/ingredients/pahang_ingredients.dart';
import '../../enum/popular_dish_by_state/ingredients/perak_ingredients.dart';
import '../../enum/popular_dish_by_state/ingredients/perlis_ingredients.dart';
import '../../enum/popular_dish_by_state/ingredients/pinang_ingredients.dart';
import '../../enum/popular_dish_by_state/ingredients/sabah_ingredients.dart';
import '../../enum/popular_dish_by_state/ingredients/sarawak_ingredients.dart';
import '../../enum/popular_dish_by_state/ingredients/terengganu_ingredients.dart';

List<String> collectAllIngredients(Map<String, String> map) {
  final ingredients = <String>[];
  map.forEach((key, value) {
    ingredients.add('<h2>$key:</h2> $value');
  });
  return ingredients;
}

List getIngredients() {
  var allDishIngredients = [];

  allDishIngredients.addAll(collectAllIngredients(johorIngredients));
  allDishIngredients.addAll(collectAllIngredients(kedahIngredients));
  allDishIngredients.addAll(collectAllIngredients(kelantanIngredients));
  allDishIngredients.addAll(collectAllIngredients(melakaIngredients));
  allDishIngredients.addAll(collectAllIngredients(nismilanIngredients));
  allDishIngredients.addAll(collectAllIngredients(pahangIngredients));
  allDishIngredients.addAll(collectAllIngredients(perakIngredients));
  allDishIngredients.addAll(collectAllIngredients(perlisIngredients));
  allDishIngredients.addAll(collectAllIngredients(pinangIngredients));
  allDishIngredients.addAll(collectAllIngredients(sabahIngredients));
  allDishIngredients.addAll(collectAllIngredients(sarawakIngredients));
  allDishIngredients.addAll(collectAllIngredients(terengganuIngredients));

  return allDishIngredients;
}
