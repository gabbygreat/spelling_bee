import '../utils/utils.dart';

//all of this will be modified when i get the color pallette

class AppThemeConfig {
  AppThemeConfig._privateRepository();

  static final AppThemeConfig instance = AppThemeConfig._privateRepository();

  final ThemeData _themeData = ThemeData(
    fontFamily: 'Grotesk',
    primaryColor: const Color(
      0xffffbf00,
    ),
  );

  ThemeData get themeData => _themeData;

  final Color _primaryColor = const Color(0xffffbf00);
  final Color _whiteColor = const Color(0xffffffff);
  final Color _blackColor = const Color(0xff000000);
  final Color _purpleColor = const Color(0xff8000ff);
  final Color _purpleColor1 = const Color(0xff6600cc);

  Color get primaryColor => _primaryColor;
  Color get whiteColor => _whiteColor;
  Color get blackColor => _blackColor;
  Color get purpleColor => _purpleColor;
  Color get purpleColor1 => _purpleColor1;
}
