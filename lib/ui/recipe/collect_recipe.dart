import 'package:malaysia_recipe/enum/popularDishByState/ingredients/johor_ingredients.dart';

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
