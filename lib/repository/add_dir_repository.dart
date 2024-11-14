

import 'dart:io';

import 'package:injectable/injectable.dart';



@lazySingleton
class AppDirRepository {

  static const String appDirName = '.shotselect';

  Directory applicationDirectory() {
    Directory home = homeDirectory();
    Directory appDir = Directory('${home.path}${Platform.pathSeparator}$appDirName');
    return appDir;
  }

  Directory homeDirectory() {
    String? home = "";
    Map<String, String> envVars = Platform.environment;
    if (Platform.isMacOS) {
      home = envVars['HOME'];
    } else if (Platform.isLinux) {
      home = envVars['HOME'];
    } else if (Platform.isWindows) {
      home = envVars['UserProfile'];
    }
    if(home==null) {

    }
    return Directory(home!);
  }

}