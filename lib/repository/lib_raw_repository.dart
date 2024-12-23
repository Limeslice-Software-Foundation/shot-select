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
import 'package:log4dart_plus/log4dart_plus.dart';

import '../injection.dart';
import 'add_dir_repository.dart';


const String _libName = 'libraw';

@lazySingleton
class LibRawRepository {

  static final Logger logger = LogManager.getLogger('LibRawRepository');

  Future<bool> loadLibRawLib() async {
    String libraryName = determineLibraryName();
    File libFile = await _extractLibFile(libraryName);
    logger.debug('Library file: $libFile');
    try {
      flutterLibRawBindings =
          FlutterLibRawBindings(DynamicLibrary.open(libFile.path));
      logger.info('Successfully loaded LibRaw library');
    } catch (err, strace) {
      logger.error('Failed to load lib raw', null, strace);
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
      await file.writeAsBytes(byteData.buffer.asUint8List());
    }
    return file;
  }

  Directory _ensureApplicationDirectory() {
    AppDirRepository repository = getIt<AppDirRepository>();
    Directory appDir = repository.applicationDirectory();
    appDir.createSync();
    return appDir;
  }
}