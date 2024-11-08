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
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:log4dart_plus/log4dart_plus.dart';

import '../../injection.dart';
import '../../model/raw_file.dart';
import '../../service/raw_file_service.dart';
import '../raw_file_state.dart';

class RawFileStateNotifier extends StateNotifier<RawFileState> {
  static final Logger logger = LogManager.getLogger('RawFileStateNotifier');

  RawFileStateNotifier() : super(const RawFileState(directory: '', files: []));

  Future<void> loadFiles(String directory) async {
    state = state.copyWith(files: [], isError: false, isLoading: true);

    try {
      RawFileService service = getIt<RawFileService>();
      List<RawFile> files = await service.loadFiles(directory);
      state = state.copyWith(files: files, directory: directory);
    } catch (err) {
      logger.error(err.toString());
      state = state.copyWith(isError: true);
    }
    finally {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> closeAllFiles() async {
    RawFileService service = getIt<RawFileService>();
    await service.closeAll(state.files);
  }
}