// Licensed to the Limeslice Software Foundation (LSF) under one or more
// contributor license agreements.  See the NOTICE file distributed with
// this work for additional information regarding copyright ownership.
// The LSF licenses this file to You under the MIT License (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// https://limeslice.org/license.txt
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'dart:ffi';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_libraw/flutter_libraw.dart';
import 'package:injectable/injectable.dart';

const String _appDirName = '.shotselect';
const String _libName = 'libraw';

@lazySingleton
class LibRawRepository {

  Future<bool> loadLibRawLib() async {
    String libraryName = determineLibraryName();
    File libFile = await _extractLibFile(libraryName);
    try {
      flutterLibRawBindings =
          FlutterLibRawBindings(DynamicLibrary.open(libFile.path));
    } catch (err, strace) {
      print(err);
      print(strace);
    }
    return true;
  }

  String determineLibraryName() {
    if (Platform.isMacOS || Platform.isIOS) {
      return '$_libName.dylib';
    }
    if (Platform.isAndroid || Platform.isLinux) {
      return '$_libName.so';
    }
    if (Platform.isWindows) {
      return '$_libName.dll';
    }
    throw UnsupportedError('Unknown platform: ${Platform.operatingSystem}');
  }

  Future<File> _extractLibFile(String assetName) async {
    Directory toDir = _ensureApplicationDirectory();
    File file = File('${toDir.path}${Platform.pathSeparator}$assetName');
    bool exists = await file.exists();
    if(!exists) {
      ByteData byteData = await rootBundle.load('libraw/$assetName');
      file.writeAsBytes(byteData.buffer.asUint8List());
    }
    return file;
  }

  Directory _ensureApplicationDirectory() {
    Directory home = _getHomeDirectory();
    Directory appDir = Directory('${home.path}${Platform.pathSeparator}$_appDirName');
    appDir.createSync();
    return appDir;
  }

  Directory _getHomeDirectory() {
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