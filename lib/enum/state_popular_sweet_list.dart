import 'malaysia_states_enum.dart';
import 'popular_sweet_enum.dart';

class StatePopularSweetList {
  final String stateName;
  final List<String> dishes;

  StatePopularSweetList(this.stateName, this.dishes);

  factory StatePopularSweetList.johor() =>
      StatePopularSweetList(StateEnum.johor, [
        PopularSweetEnum.lepatLoi,
        PopularSweetEnum.borongko,
        PopularSweetEnum.harissa,
        PopularSweetEnum.kacauKeledek,
        PopularSweetEnum.airKathira
      ]);

  factory StatePopularSweetList.nismilan() =>
      StatePopularSweetList(StateEnum.nismilan, [
        PopularSweetEnum.rendangMinang,
        PopularSweetEnum.masakLemakCiliApi,
        PopularSweetEnum.rendangAyamMaman,
        PopularSweetEnum.dagingSalaiMasakLemak,
        PopularSweetEnum.rendangKepayo
      ]);

  factory StatePopularSweetList.melaka() =>
      StatePopularSweetList(StateEnum.melaka, [
        PopularSweetEnum.asamPedas,
        PopularSweetEnum.meeKariNyonya,
        PopularSweetEnum.rendangLokan,
        PopularSweetEnum.masakLemakDaunSetangki,
        PopularSweetEnum.laokAramJada,
      ]);

  factory StatePopularSweetList.kelantan() =>
      StatePopularSweetList(StateEnum.kelantan, [
        PopularSweetEnum.nasiKerabu,
        PopularSweetEnum.laksam,
        PopularSweetEnum.ayamPercik,
        PopularSweetEnum.nasiTumpang,
        PopularSweetEnum.meeCelop,
      ]);

  factory StatePopularSweetList.kedah() =>
      StatePopularSweetList(StateEnum.kedah, [
        PopularSweetEnum.laksaKedah,
        PopularSweetEnum.gulaiDagingBatangPisang,
        PopularSweetEnum.gulaiBatangKeladi,
        PopularSweetEnum.buburAsyuraUtara,
        PopularSweetEnum.peknga,
      ]);

  factory StatePopularSweetList.pahang() =>
      StatePopularSweetList(StateEnum.pahang, [
        PopularSweetEnum.gulaiPatinTempoyak,
        PopularSweetEnum.nasiKebuli,
        PopularSweetEnum.sambalHitam,
        PopularSweetEnum.gulaiAsamRong,
        PopularSweetEnum.gulaiOporDaging,
      ]);

  factory StatePopularSweetList.perak() =>
      StatePopularSweetList(StateEnum.perak, [
        PopularSweetEnum.rendangTok,
        PopularSweetEnum.ikanPindangDaunSeniar,
        PopularSweetEnum.nasiLemuni,
        PopularSweetEnum.telurDadarIkanLoma,
        PopularSweetEnum.kebebe,
      ]);

  factory StatePopularSweetList.perlis() =>
      StatePopularSweetList(StateEnum.perlis, [
        PopularSweetEnum.laksaPerlis,
        PopularSweetEnum.nasiUlam,
        PopularSweetEnum.pulutHarumManis,
        PopularSweetEnum.jerukMaman,
      ]);

  factory StatePopularSweetList.pinang() =>
      StatePopularSweetList(StateEnum.pinang, [
        PopularSweetEnum.laksaPenang,
        PopularSweetEnum.charKueyTeow,
        PopularSweetEnum.meeGorengMamakDaging,
        PopularSweetEnum.nasiKandar,
      ]);

  factory StatePopularSweetList.sabah() =>
      StatePopularSweetList(StateEnum.sabah, [
        PopularSweetEnum.hinava,
        PopularSweetEnum.meeTuaran,
        PopularSweetEnum.linopot,
        PopularSweetEnum.barobbo,
        PopularSweetEnum.burasak,
      ]);

  factory StatePopularSweetList.sarawak() =>
      StatePopularSweetList(StateEnum.sarawak, [
        PopularSweetEnum.meeKolok,
        PopularSweetEnum.laksaSarawak,
        PopularSweetEnum.manokPansoh,
        PopularSweetEnum.supTerungAsam,
        PopularSweetEnum.meeTomatoRangup,
      ]);

  factory StatePopularSweetList.terengganu() =>
      StatePopularSweetList(StateEnum.terengganu, [
        PopularSweetEnum.nasiDagang,
        PopularSweetEnum.keropokLekor,
        PopularSweetEnum.sata,
        PopularSweetEnum.pulutPanggang,
        PopularSweetEnum.laksaTerengganu,
      ]);
}
