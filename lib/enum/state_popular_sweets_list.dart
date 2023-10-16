import 'malaysia_states_enum.dart';
import 'popular_sweets_enum.dart';

class StatePopularSweetsList {
  final String stateName;
  final List<String> sweets;

  StatePopularSweetsList(this.stateName, this.sweets);

  factory StatePopularSweetsList.johor() =>
      StatePopularSweetsList(StateEnum.johor, [
        PopularSweetsEnum.kuihAbokAbok,
        PopularSweetsEnum.wadaiKipeng,
        PopularSweetsEnum.kacauKeledek,
      ]);

  factory StatePopularSweetsList.nismilan() =>
      StatePopularSweetsList(StateEnum.nismilan, [
        PopularSweetsEnum.cendolSaguRumbia,
        PopularSweetsEnum.kuihApamJohol,
        PopularSweetsEnum.kuihSopangKukus,
        PopularSweetsEnum.dodolPenganan,
        PopularSweetsEnum.wajik
      ]);

  factory StatePopularSweetsList.melaka() =>
      StatePopularSweetsList(StateEnum.melaka, [
        PopularSweetsEnum.kuihKeria,
        PopularSweetsEnum.dodol,
        PopularSweetsEnum.kuihChangNyonya,
      ]);

  factory StatePopularSweetsList.kelantan() =>
      StatePopularSweetsList(StateEnum.kelantan, [
        PopularSweetsEnum.akok,
        PopularSweetsEnum.butirNangka,
        PopularSweetsEnum.cekMekMolek,
        PopularSweetsEnum.lompatTikam,
        PopularSweetsEnum.kuihKato,
      ]);

  factory StatePopularSweetsList.kedah() =>
      StatePopularSweetsList(StateEnum.kedah, [
        PopularSweetsEnum.kuihBungaPudak,
        PopularSweetsEnum.karasKedah,
        PopularSweetsEnum.kuihLoyang,
        PopularSweetsEnum.kuihPeneram,
        PopularSweetsEnum.pulutKacau,
      ]);

  factory StatePopularSweetsList.pahang() =>
      StatePopularSweetsList(StateEnum.pahang, [
        PopularSweetsEnum.kuihBadakKubang,
        PopularSweetsEnum.dodolKukus,
      ]);

  factory StatePopularSweetsList.perak() =>
      StatePopularSweetsList(StateEnum.perak, [
        PopularSweetsEnum.kuihKandas,
      ]);

  factory StatePopularSweetsList.perlis() =>
      StatePopularSweetsList(StateEnum.perlis, [
        PopularSweetsEnum.kuihDangai,
      ]);

  factory StatePopularSweetsList.pinang() =>
      StatePopularSweetsList(StateEnum.pinang, [
        PopularSweetsEnum.cendol,
        PopularSweetsEnum.halwaMaskat,
      ]);

  factory StatePopularSweetsList.sabah() =>
      StatePopularSweetsList(StateEnum.sabah, [
        PopularSweetsEnum.kuihKelupis,
        PopularSweetsEnum.sinamu,
        PopularSweetsEnum.tonsomBambangan,
      ]);

  factory StatePopularSweetsList.sarawak() =>
      StatePopularSweetsList(StateEnum.sarawak, [
        PopularSweetsEnum.tumpikLemantak,
        PopularSweetsEnum.kekLapisSarawak,
        PopularSweetsEnum.kekLumut,
        PopularSweetsEnum.kuihBongkol,
        PopularSweetsEnum.kuihCelorot,
      ]);

  factory StatePopularSweetsList.terengganu() =>
      StatePopularSweetsList(StateEnum.terengganu, [
        PopularSweetsEnum.lepatUbiKayu,
        PopularSweetsEnum.tepungBungkus,
        PopularSweetsEnum.kuihKayuKamak,
      ]);
}
