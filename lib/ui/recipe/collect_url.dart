import '../../enum/popular_dish_by_state/url/johor_url.dart';
import '../../enum/popular_dish_by_state/url/kedah_url.dart';
import '../../enum/popular_dish_by_state/url/kelantan_url.dart';
import '../../enum/popular_dish_by_state/url/melaka_url.dart';
import '../../enum/popular_dish_by_state/url/nismilan_url.dart';
import '../../enum/popular_dish_by_state/url/pahang_url.dart';
import '../../enum/popular_dish_by_state/url/perak_url.dart';
import '../../enum/popular_dish_by_state/url/perlis__url.dart';
import '../../enum/popular_dish_by_state/url/pinang_url.dart';
import '../../enum/popular_dish_by_state/url/sabah_url.dart';
import '../../enum/popular_dish_by_state/url/sarawak_url.dart';
import '../../enum/popular_dish_by_state/url/terengganu_url.dart';
import '../../enum/popular_sweets_by_state/url/johor_url.dart';
import '../../enum/popular_sweets_by_state/url/kedah_url.dart';
import '../../enum/popular_sweets_by_state/url/kelantan_url.dart';
import '../../enum/popular_sweets_by_state/url/melaka_url.dart';
import '../../enum/popular_sweets_by_state/url/nismilan_url.dart';
import '../../enum/popular_sweets_by_state/url/pahang_url.dart';
import '../../enum/popular_sweets_by_state/url/perak_url.dart';
import '../../enum/popular_sweets_by_state/url/perlis_url.dart';
import '../../enum/popular_sweets_by_state/url/pinang_url.dart';
import '../../enum/popular_sweets_by_state/url/sabah_url.dart';
import '../../enum/popular_sweets_by_state/url/sarawak_url.dart';
import '../../enum/popular_sweets_by_state/url/terengganu_url.dart';

List<String> collectAllUrls(Map<String, String> map) {
  final urls = <String>[];
  map.forEach((key, value) {
    urls.add('<h2>$key:</h2> $value');
  });
  return urls;
}

List getUrls() {
  var allDishUrls = [];

  allDishUrls.addAll(collectAllUrls(johorUrl));
  allDishUrls.addAll(collectAllUrls(johorSweetsUrl));
  allDishUrls.addAll(collectAllUrls(kedahUrl));
  allDishUrls.addAll(collectAllUrls(kedahSweetsUrl));
  allDishUrls.addAll(collectAllUrls(kelantanUrl));
  allDishUrls.addAll(collectAllUrls(kelantanSweetsUrl));
  allDishUrls.addAll(collectAllUrls(melakaUrl));
  allDishUrls.addAll(collectAllUrls(melakaSweetsUrl));
  allDishUrls.addAll(collectAllUrls(nismilanUrl));
  allDishUrls.addAll(collectAllUrls(nismilanSweetsUrl));
  allDishUrls.addAll(collectAllUrls(pahangUrl));
  allDishUrls.addAll(collectAllUrls(pahangSweetsUrl));
  allDishUrls.addAll(collectAllUrls(perakUrl));
  allDishUrls.addAll(collectAllUrls(perakSweetsUrl));
  allDishUrls.addAll(collectAllUrls(perlisUrl));
  allDishUrls.addAll(collectAllUrls(perlisSweetsUrl));
  allDishUrls.addAll(collectAllUrls(pinangUrl));
  allDishUrls.addAll(collectAllUrls(pinangSweetsUrl));
  allDishUrls.addAll(collectAllUrls(sabahUrl));
  allDishUrls.addAll(collectAllUrls(sabahSweetsUrl));
  allDishUrls.addAll(collectAllUrls(sarawakUrl));
  allDishUrls.addAll(collectAllUrls(sarawakSweetsUrl));
  allDishUrls.addAll(collectAllUrls(terengganuUrl));
  allDishUrls.addAll(collectAllUrls(terengganuSweetsUrl));

  return allDishUrls;
}
