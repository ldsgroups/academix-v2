import 'package:academix/core/constants/asset_constants.dart';

String getSvg({
  required String svgName,
}) {
  switch (svgName) {
    case 'care':
      return AssetConstants.careSVG;
    case 'chimestry':
      return AssetConstants.chimestrySVG;
    case 'geography':
      return AssetConstants.geographySVG;
    case 'language':
      return AssetConstants.languageSVG;
    case 'math':
      return AssetConstants.mathSVG;
    case 'number':
      return AssetConstants.numberSVG;
    case 'sport':
      return AssetConstants.sportSVG;
    default:
      return AssetConstants.homeSolidSVG;
  }
}
