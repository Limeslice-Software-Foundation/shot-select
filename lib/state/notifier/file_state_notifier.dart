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
import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:log4dart_plus/log4dart_plus.dart';
import 'package:shot_select/model/raw_file.dart';

import '../file_state.dart';

class FileStateNotifier extends StateNotifier<FileState> {
  static final Logger logger = LogManager.getLogger('RawFileStateNotifier');

  FileStateNotifier() : super(const FileState(directory: '', rawFiles: []));

  void selectDirectory(String directory) {
    state = state.copyWith(directory: directory);
  }

  void setFiles(List<RawFile> rawFiles) {
    state = state.copyWith(rawFiles: rawFiles);
  }

  Future<void> copyFiles() async {

  }

  Future<void> moveFiles() async {

  }
}