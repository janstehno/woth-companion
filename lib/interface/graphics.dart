import 'package:wothcompanion/generated/assets.gen.dart';
import 'package:wothcompanion/miscellaneous/enums.dart';
import 'package:wothcompanion/model/map/building_location.dart';

class Graphics {
  static final Map<String, String> _animalMarkersFill = {
    "ANIMAL:ALCES_AMERICANUS_HEADING": Assets.graphics.markers.fill.westernMoose,
    "ANIMAL:LION_HEADING": Assets.graphics.markers.fill.lion,
    "ANIMAL:OREAMNOS_AMERICANUS_HEADING": Assets.graphics.markers.fill.mountainGoat,
    "ANIMAL:FERAL_PIG_HEADING": Assets.graphics.markers.fill.feralPig,
    "ANIMAL:CERVUS_CANADENSIS_HEADING": Assets.graphics.markers.fill.rockyMountainElk,
    "ANIMAL:EGYPTIAN_GOOSE_HEADING": Assets.graphics.markers.fill.egyptianGoose,
    "ANIMAL:MELES_MELES_HEADING": Assets.graphics.markers.fill.eurasianBadger,
    "ANIMAL:ODOCOILEUS_HEMIONUS_SITKENSIS_HEADING": Assets.graphics.markers.fill.sitkaDeer,
    "ANIMAL:MELANITTA_PERSPICILLATA_HEADING": Assets.graphics.markers.fill.surfScoter,
    "ANIMAL:LEPUS_AMERICANUS_HEADING": Assets.graphics.markers.fill.snowshoeHare,
    "ANIMAL:URSUS_ARCTOS_MIDDENDORFFI_HEADING": Assets.graphics.markers.fill.kodiakBear,
    "ANIMAL:CANIS_LUPUS_HEADING": Assets.graphics.markers.fill.grayWolf,
    "ANIMAL:EUROPEAN_RABBIT_HEADING": Assets.graphics.markers.fill.europeanRabbit,
    "ANIMAL:OVIS_CANADENSIS_HEADING": Assets.graphics.markers.fill.bighornSheep,
    "ANIMAL:GREATER_KUDU_HEADING": Assets.graphics.markers.fill.greaterKudu,
    "ANIMAL:RED_STAG_HEADING": Assets.graphics.markers.fill.redStag,
    "ANIMAL:SPOTTED_HYENA_HEADING": Assets.graphics.markers.fill.spottedHyena,
    "ANIMAL:HIMALAYAN_TAHR_HEADING": Assets.graphics.markers.fill.himalayanTahr,
    "ANIMAL:HELMETED_GUINEAFOWL_HEADING": Assets.graphics.markers.fill.helmetedGuineafowl,
    "ANIMAL:LEPUS_EUROPAEUS_HEADING": Assets.graphics.markers.fill.europeanHare,
    "ANIMAL:ANSER_ANSER_HEADING": Assets.graphics.markers.fill.greylagGoose,
    "ANIMAL:TAXIDEA_TAXUS_HEADING": Assets.graphics.markers.fill.americanBadger,
    "ANIMAL:GEMSBOK_HEADING": Assets.graphics.markers.fill.gemsbok,
    "ANIMAL:SPRINGBOK_HEADING": Assets.graphics.markers.fill.springbok,
    "ANIMAL:CAPE_BUFFALO_HEADING": Assets.graphics.markers.fill.capeBuffalo,
    "ANIMAL:CERVUS_ELAPHUS_HEADING": Assets.graphics.markers.fill.redDeer,
    "ANIMAL:ANSER_ROSSII_HEADING": Assets.graphics.markers.fill.rossGoose,
    "ANIMAL:URSUS_AMERICANUS_HEADING": Assets.graphics.markers.fill.americanBlackBear,
    "ANIMAL:BLACK_WILDEBEEST_HEADING": Assets.graphics.markers.fill.blackWildebeest,
    "ANIMAL:HONEY_BADGER_HEADING": Assets.graphics.markers.fill.honeyBadger,
    "ANIMAL:CANIS_AUREUS_HEADING": Assets.graphics.markers.fill.goldenJackal,
    "ANIMAL:AYTHYA_AFFINIS_HEADING": Assets.graphics.markers.fill.lesserScaup,
    "ANIMAL:SUS_SCROFA_HEADING": Assets.graphics.markers.fill.wildBoar,
    "ANIMAL:DAMA_DAMA_HEADING": Assets.graphics.markers.fill.fallowDeer,
    "ANIMAL:VULPES_VULPES_HEADING": Assets.graphics.markers.fill.redFox,
    "ANIMAL:SIKA_DEER_HEADING": Assets.graphics.markers.fill.sikaDeer,
    "ANIMAL:BISON_BISON_ATHABASCAE_HEADING": Assets.graphics.markers.fill.woodBison,
    "ANIMAL:RANGIFER_TARANDUS_GROENLANDICUS_HEADING": Assets.graphics.markers.fill.barrenGroundCaribou,
    "ANIMAL:FERAL_GOAT_HEADING": Assets.graphics.markers.fill.feralGoat,
    "ANIMAL:ALCES_AMERICANUS_GIGAS_HEADING": Assets.graphics.markers.fill.alaskaMoose,
    "ANIMAL:PHASIANUS_COLCHICUS_HEADING": Assets.graphics.markers.fill.pheasant,
    "ANIMAL:CERVUS_CANADENSIS_ROOSEVELTI_HEADING": Assets.graphics.markers.fill.rooseveltElk,
    "ANIMAL:SAMBAR_DEER_HEADING": Assets.graphics.markers.fill.sambarDeer,
    "ANIMAL:OVIS_MUSIMON_HEADING": Assets.graphics.markers.fill.mouflon,
    "ANIMAL:COMMON_WARTHOG_HEADING": Assets.graphics.markers.fill.commonWarthog,
    "ANIMAL:BLUE_WILDEBEEST_HEADING": Assets.graphics.markers.fill.blueWildebeest,
    "ANIMAL:ANAS_PLATYRHYNCHOS_HEADING": Assets.graphics.markers.fill.wildDuck,
    "ANIMAL:URSUS_ARCTOS_HEADING": Assets.graphics.markers.fill.brownBear,
    "ANIMAL:ODOCOILEUS_VIRGINIANUS_HEADING": Assets.graphics.markers.fill.whiteTailedDeer,
    "ANIMAL:CAPREOLUS_CAPREOLUS_HEADING": Assets.graphics.markers.fill.roeDeer,
    "ANIMAL:ODOCOILEUS_HEMIONUS_HEADING": Assets.graphics.markers.fill.muleDeer,
    "ANIMAL:RUPICAPRA_RUPICAPRA_HEADING": Assets.graphics.markers.fill.chamois,
  };

  static final Map<String, String> _animalMarkersBorder = {
    "ANIMAL:ALCES_AMERICANUS_HEADING": Assets.graphics.markers.border.westernMoose,
    "ANIMAL:LION_HEADING": Assets.graphics.markers.border.lion,
    "ANIMAL:OREAMNOS_AMERICANUS_HEADING": Assets.graphics.markers.border.mountainGoat,
    "ANIMAL:FERAL_PIG_HEADING": Assets.graphics.markers.border.feralPig,
    "ANIMAL:CERVUS_CANADENSIS_HEADING": Assets.graphics.markers.border.rockyMountainElk,
    "ANIMAL:EGYPTIAN_GOOSE_HEADING": Assets.graphics.markers.border.egyptianGoose,
    "ANIMAL:MELES_MELES_HEADING": Assets.graphics.markers.border.eurasianBadger,
    "ANIMAL:ODOCOILEUS_HEMIONUS_SITKENSIS_HEADING": Assets.graphics.markers.border.sitkaDeer,
    "ANIMAL:MELANITTA_PERSPICILLATA_HEADING": Assets.graphics.markers.border.surfScoter,
    "ANIMAL:LEPUS_AMERICANUS_HEADING": Assets.graphics.markers.border.snowshoeHare,
    "ANIMAL:URSUS_ARCTOS_MIDDENDORFFI_HEADING": Assets.graphics.markers.border.kodiakBear,
    "ANIMAL:CANIS_LUPUS_HEADING": Assets.graphics.markers.border.grayWolf,
    "ANIMAL:EUROPEAN_RABBIT_HEADING": Assets.graphics.markers.border.europeanRabbit,
    "ANIMAL:OVIS_CANADENSIS_HEADING": Assets.graphics.markers.border.bighornSheep,
    "ANIMAL:GREATER_KUDU_HEADING": Assets.graphics.markers.border.greaterKudu,
    "ANIMAL:RED_STAG_HEADING": Assets.graphics.markers.border.redStag,
    "ANIMAL:SPOTTED_HYENA_HEADING": Assets.graphics.markers.border.spottedHyena,
    "ANIMAL:HIMALAYAN_TAHR_HEADING": Assets.graphics.markers.border.himalayanTahr,
    "ANIMAL:HELMETED_GUINEAFOWL_HEADING": Assets.graphics.markers.border.helmetedGuineafowl,
    "ANIMAL:LEPUS_EUROPAEUS_HEADING": Assets.graphics.markers.border.europeanHare,
    "ANIMAL:ANSER_ANSER_HEADING": Assets.graphics.markers.border.greylagGoose,
    "ANIMAL:TAXIDEA_TAXUS_HEADING": Assets.graphics.markers.border.americanBadger,
    "ANIMAL:GEMSBOK_HEADING": Assets.graphics.markers.border.gemsbok,
    "ANIMAL:SPRINGBOK_HEADING": Assets.graphics.markers.border.springbok,
    "ANIMAL:CAPE_BUFFALO_HEADING": Assets.graphics.markers.border.capeBuffalo,
    "ANIMAL:CERVUS_ELAPHUS_HEADING": Assets.graphics.markers.border.redDeer,
    "ANIMAL:ANSER_ROSSII_HEADING": Assets.graphics.markers.border.rossGoose,
    "ANIMAL:URSUS_AMERICANUS_HEADING": Assets.graphics.markers.border.americanBlackBear,
    "ANIMAL:BLACK_WILDEBEEST_HEADING": Assets.graphics.markers.border.blackWildebeest,
    "ANIMAL:HONEY_BADGER_HEADING": Assets.graphics.markers.border.honeyBadger,
    "ANIMAL:CANIS_AUREUS_HEADING": Assets.graphics.markers.border.goldenJackal,
    "ANIMAL:AYTHYA_AFFINIS_HEADING": Assets.graphics.markers.border.lesserScaup,
    "ANIMAL:SUS_SCROFA_HEADING": Assets.graphics.markers.border.wildBoar,
    "ANIMAL:DAMA_DAMA_HEADING": Assets.graphics.markers.border.fallowDeer,
    "ANIMAL:VULPES_VULPES_HEADING": Assets.graphics.markers.border.redFox,
    "ANIMAL:SIKA_DEER_HEADING": Assets.graphics.markers.border.sikaDeer,
    "ANIMAL:BISON_BISON_ATHABASCAE_HEADING": Assets.graphics.markers.border.woodBison,
    "ANIMAL:RANGIFER_TARANDUS_GROENLANDICUS_HEADING": Assets.graphics.markers.border.barrenGroundCaribou,
    "ANIMAL:FERAL_GOAT_HEADING": Assets.graphics.markers.border.feralGoat,
    "ANIMAL:ALCES_AMERICANUS_GIGAS_HEADING": Assets.graphics.markers.border.alaskaMoose,
    "ANIMAL:PHASIANUS_COLCHICUS_HEADING": Assets.graphics.markers.border.pheasant,
    "ANIMAL:CERVUS_CANADENSIS_ROOSEVELTI_HEADING": Assets.graphics.markers.border.rooseveltElk,
    "ANIMAL:SAMBAR_DEER_HEADING": Assets.graphics.markers.border.sambarDeer,
    "ANIMAL:OVIS_MUSIMON_HEADING": Assets.graphics.markers.border.mouflon,
    "ANIMAL:COMMON_WARTHOG_HEADING": Assets.graphics.markers.border.commonWarthog,
    "ANIMAL:BLUE_WILDEBEEST_HEADING": Assets.graphics.markers.border.blueWildebeest,
    "ANIMAL:ANAS_PLATYRHYNCHOS_HEADING": Assets.graphics.markers.border.wildDuck,
    "ANIMAL:URSUS_ARCTOS_HEADING": Assets.graphics.markers.border.brownBear,
    "ANIMAL:ODOCOILEUS_VIRGINIANUS_HEADING": Assets.graphics.markers.border.whiteTailedDeer,
    "ANIMAL:CAPREOLUS_CAPREOLUS_HEADING": Assets.graphics.markers.border.roeDeer,
    "ANIMAL:ODOCOILEUS_HEMIONUS_HEADING": Assets.graphics.markers.border.muleDeer,
    "ANIMAL:RUPICAPRA_RUPICAPRA_HEADING": Assets.graphics.markers.border.chamois,
  };

  static String getAnimal(String id, MarkerType animalMarker) {
    switch (animalMarker) {
      case MarkerType.fill:
        return _animalMarkersFill[id]!;
      case MarkerType.border:
        return _animalMarkersBorder[id]!;
    }
  }

  static String getTile(MapRegion region, int x, int y, int z) {
    int gridSize, correction;

    switch (z) {
      case 1:
        gridSize = 4;
        correction = 1;
        break;
      case 2:
        gridSize = 8;
        correction = 2;
        break;
      case 3:
        gridSize = 16;
        correction = 4;
        break;
      default:
        throw Exception("Zoom level: $z is not supported");
    }

    int i = (y + correction) * gridSize + (x + correction);
    return "assets/graphics/maps/${region.name.toLowerCase()}/$z/$i.png";
  }

  static String getBuildingLocation(BuildingLocation buildingLocation) {
    switch (buildingLocation.type) {
      case BuildingType.lodge:
        return Assets.graphics.icons.lodge;
      case BuildingType.cabin:
        return Assets.graphics.icons.cabin;
      case BuildingType.campsite:
        return Assets.graphics.icons.campsite;
      case BuildingType.huntingStand:
        return Assets.graphics.icons.huntingStand;
    }
  }

  static String getAnimalLocation(String id, MarkerType animalMarker) {
    switch (animalMarker) {
      case MarkerType.fill:
        return _animalMarkersFill[id]!;
      case MarkerType.border:
        return _animalMarkersBorder[id]!;
    }
  }

  static String getZone(ZoneType zoneType) {
    switch (zoneType) {
      case ZoneType.eating:
        return Assets.graphics.icons.eating;
      case ZoneType.resting:
        return Assets.graphics.icons.resting;
      case ZoneType.drinking:
        return Assets.graphics.icons.drinking;
    }
  }

  static String getProcessIcon(ProcessType process) {
    switch (process) {
      case ProcessType.success:
        return Assets.graphics.icons.check;
      case ProcessType.error:
        return Assets.graphics.icons.cancel;
      case ProcessType.info:
        return Assets.graphics.icons.search;
    }
  }
}
