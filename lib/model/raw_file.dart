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
import 'dart:typed_data';
import 'package:ffi/ffi.dart';
import 'package:flutter/material.dart';

import 'package:flutter_libraw/flutter_libraw.dart';
import 'package:log4dart_plus/log4dart_plus.dart';

class RawFile {
  static final Logger logger = LogManager.getLogger('RawFile');

  bool selected = false;
  final String path;
  late String fileName;
  late Pointer<libraw_data_t> ptr;

  final int? rating = null;
  final Color? color = null;
  final bool? tagged = null;

  late DateTime timestamp;
  late String cameraMake;
  late String cameraModel;
  late String lens;
  late String aperture;
  late String shutter;
  late String iso;
  late String focalLength;
  late String dimension;

  late Uint8List thumbNail;

  RawFile({required this.path}) {
    ptr = flutterLibRawBindings.libraw_init(0);
    if(path.contains(Platform.pathSeparator)) {
      fileName = path.substring(path.lastIndexOf(Platform.pathSeparator)+1);
    } else {
      fileName = path;
    }
  }

  Future<int> open() async {
    logger.debug('Going to open raw file: $path');
    int result = flutterLibRawBindings.libraw_open_file(
        ptr, path.toNativeUtf8().cast());
    if (result != 0) {
      logger.debug('Failed to open raw file: $path');
    } else {
      loadDataFromFile();
      logger.debug('Going to unpack thumbnail');
      result = flutterLibRawBindings.libraw_unpack_thumb(ptr);
      thumbNail = pointerToUint8List(
          ptr.ref.thumbnail.thumb, ptr.ref.thumbnail.tlength);
      logger.debug('Unpack thumbnail result: $result');
    }
    return result;
  }

  void loadDataFromFile() {
    timestamp = DateTime.fromMillisecondsSinceEpoch(ptr.ref.other.timestamp*1000);
    cameraMake = arrayToString(ptr.ref.idata.make);
    cameraModel = arrayToString(ptr.ref.idata.model);
    lens = arrayToString(ptr.ref.lens.Lens);
    aperture = 'f${ptr.ref.other.aperture.toStringAsPrecision(2)}';
    shutter = '1/${(1/ptr.ref.other.shutter).toStringAsFixed(0)}s';
    iso = '${ptr.ref.other.iso_speed.ceil()}';
    focalLength = '${ptr.ref.other.focal_len.ceil()}mm';
    dimension = '${ptr.ref.sizes.width} x ${ptr.ref.sizes.height}';
  }

  void close() {
    flutterLibRawBindings.libraw_close(ptr);
  }
}