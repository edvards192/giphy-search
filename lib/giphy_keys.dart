import 'dart:io' show Platform;


class GiphyKeys {
  static const String _android = String.fromEnvironment('ANDROID_GIPHY_KEY');
  static const String _ios = String.fromEnvironment('IOS_GIPHY_KEY');

  static String get current {
    if(Platform.isAndroid){
      if(_android.isEmpty) throw Exception('Missing ANDROID_GIPHY_KEY');
      return _android;
    }
    if(Platform.isIOS){
      if(_ios.isEmpty) throw Exception('Missing IOS_GIPHY_KEY');
      return _ios;
    }
    throw Exception('Error, Unsupported platform.');
  }
}