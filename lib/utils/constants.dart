

//*********** Theme ********** */
import 'package:financeapp/utils/extensions/ext_color.dart';

// ******************* Theme Meterial ******************
final primaryColor = HexColor.fromHex('#01579b');
final primaryLightColor = HexColor.fromHex('#4f83cc');
final primaryDarkColor = HexColor.fromHex('#002f6c');
// -------------------------------------------------------

// **************** Images *****************************
const _imagesPath = 'assets';

enum ImagesId {
  logoTipo,
}

const Map<ImagesId, String> imagesName = {
  ImagesId.logoTipo : "$_imagesPath/finance_logo.jpeg",
};

//-------------------------------------------------------

