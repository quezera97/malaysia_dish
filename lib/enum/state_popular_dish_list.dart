import 'malaysia_states_enum.dart';
import 'popular_dish_enum.dart';

class StatePopularDishList {
  final String stateName;
  final List<String> dishes;

  StatePopularDishList(this.stateName, this.dishes);

  factory StatePopularDishList.klselangor() =>
    StatePopularDishList(StateEnum.klselangor, ['Nasi Ambeng', 'Satay', 'Rendang', 'Roti Canai', 'Laksa']);

  factory StatePopularDishList.johor() =>
    StatePopularDishList(StateEnum.johor, [
      PopularDishEnum.meeBandung, 
      PopularDishEnum.laksaJohor, 
      PopularDishEnum.lontong, 
      PopularDishEnum.botokBotok,  
      PopularDishEnum.meeRebus
    ]);

  factory StatePopularDishList.nismilan() =>
    StatePopularDishList(StateEnum.nismilan, [
      PopularDishEnum.rendangMinang, 
      PopularDishEnum.masakLemakCiliApi,
      PopularDishEnum.rendangAyamMaman,
      PopularDishEnum.dagingSalaiMasakLemak,
      PopularDishEnum.rendangKepayo
    ]);

  factory StatePopularDishList.melaka() =>
    StatePopularDishList(StateEnum.melaka, [
      PopularDishEnum.asamPedas, 
      PopularDishEnum.meeKariNyonya,
      PopularDishEnum.rendangLokan,
      PopularDishEnum.masakLemakDaunSetangki,
      PopularDishEnum.laokAramJada,
    ]);

  factory StatePopularDishList.kelantan() =>
    StatePopularDishList(StateEnum.kelantan, [
      PopularDishEnum.nasiKerabu,
      PopularDishEnum.laksam,
      PopularDishEnum.ayamPercik,
      PopularDishEnum.nasiTumpang, 
      PopularDishEnum.meeCelop, 
    ]);

  factory StatePopularDishList.kedah() =>
      StatePopularDishList(StateEnum.kedah, ['Nasi Lemak', 'Pulut Durian', 'Mee Udang', 'Ayam Goreng', 'Laksa Kedah']);

  factory StatePopularDishList.pahang() =>
      StatePopularDishList(StateEnum.pahang, ['Nasi Dagang', 'Lemang', 'Sata', 'Ikan Patin', 'Ayam Pansuh']);

  factory StatePopularDishList.perak() =>
      StatePopularDishList(StateEnum.perak, ['Ipoh Hor Fun', 'Taugeh Chicken Rice', 'Char Kway Teow', 'Ayam Taugeh', 'Tau Foo Fah']);

  factory StatePopularDishList.perlis() =>
      StatePopularDishList(StateEnum.perlis, ['Ikan Bakar', 'Laksa Perlis', 'Roti Doll', 'Pulut Panggang', 'Kuih Lompang']);

  factory StatePopularDishList.pinang() =>
      StatePopularDishList(StateEnum.pinang, ['Char Kway Teow', 'Asam Laksa', 'Hokkien Mee', 'Nasi Kandar', 'Cendol']);

  factory StatePopularDishList.sabah() =>
      StatePopularDishList(StateEnum.sabah, ['Soto', 'Hinava', 'Tuaran Mee', 'Nasi Goreng Kampung', 'Linopot']);

  factory StatePopularDishList.sarawak() =>
      StatePopularDishList(StateEnum.sarawak, ['Laksa Sarawak', 'Kolo Mee', 'Sarawak Kek Lapis', 'Manok Pansoh', 'Umai']);

  factory StatePopularDishList.terengganu() =>
      StatePopularDishList(StateEnum.terengganu, ['Nasi Dagang', 'Keropok Lekor', 'Satar', 'Pulut Lepa', 'Laksam']);
}
