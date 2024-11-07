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

class RawFile {
  bool selected = false;
  final String path;
  late Pointer<libraw_data_t> ptr;

  final int? rating = null;
  final Color? color = null;
  final bool? tagged = null;

  RawFile({required this.path}) {
    ptr = flutterLibRawBindings.libraw_init(0);
  }

  Future<int> open() async {
    print('Going to open raw file: $path');
    int result = flutterLibRawBindings.libraw_open_file(
        ptr, path.toNativeUtf8().cast());
    if (result != 0) {
      print('Failed to open raw file: $path');
    } else {
      print('Going to unpack thumbnail');
      result = flutterLibRawBindings.libraw_unpack_thumb(ptr);
      print(result);
    }
    return result;
  }

  String get fileName {
    if(path.contains(Platform.pathSeparator)) {
      return path.substring(path.lastIndexOf(Platform.pathSeparator)+1);
    } else {
      return path;
    }
  }

  Uint8List getThumbnail() {
    return pointerToUint8List(
        ptr.ref.thumbnail.thumb, ptr.ref.thumbnail.tlength);
  }

  void close() {
    flutterLibRawBindings.libraw_close(ptr);
  }
}