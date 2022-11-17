import 'package:flutter_svg/svg.dart';

class AppAssets {
  static const String _illustations = 'assets/images/vectors/illustrations/';
  static const String _icons = 'assets/images/vectors/icons/';

  static final Map<String, String> _paths = {
    'walkthrough': '$_illustations/walkthrough.svg',
    'chat_icon': '$_icons/chat_icon.svg'
  };

  static SvgPicture walkthrough({required double? height}) =>
      SvgPicture.asset(_paths['walkthrough']!);
}
