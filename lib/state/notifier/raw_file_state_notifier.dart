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

import '../../injection.dart';
import '../../model/raw_file.dart';
import '../../service/raw_file_service.dart';
import '../raw_file_state.dart';

class RawFileStateNotifier extends StateNotifier<RawFileState> {
  static final Logger logger = LogManager.getLogger('RawFileStateNotifier');

  RawFileStateNotifier() : super(const RawFileState(directory: '', files: [], rawFiles: []));

  Future<void> loadFiles(String directory) async {
    state = state.copyWith(files: [], rawFiles: [], isError: false, isLoading: true, current: 0);

    try {
      RawFileService service = getIt<RawFileService>();
      List<File> rawFileList = await service.findRawFiles(Directory(directory));
      state = state.copyWith(files: rawFileList);
      if(rawFileList.isNotEmpty) {
        RawFile? rawFile = await service.loadFile(rawFileList[0]);
        state = state.copyWith(currentFile: rawFile);
      }
    } catch (err, trace) {
      logger.error(err.toString(), null, trace);
      state = state.copyWith(isError: true);
    }
    finally {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> incrementFile() async {
    state = state.copyWith(isLoading: true, isError: false);

    try {
      int nextIndex = state.current+1;
      logger.debug('nextIndex=[$nextIndex]');
      RawFileService service = getIt<RawFileService>();
      logger.debug('Closing current raw file.');
      state.currentFile!.close();
      state = state.copyWith(currentFile: null, current: nextIndex);
      if(state.current < state.files.length) {
        logger.debug('Loading next file');
        RawFile? rawFile = await service.loadFile(state.files[nextIndex]);
        state = state.copyWith(currentFile: rawFile);
      }
    } catch (err, trace) {
      print(trace);
      logger.error(err.toString(), null, trace);
      state = state.copyWith(isError: true);
    }
    finally {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> tagCurrentImage(bool tagged) async {
    RawFile rawFile = state.currentFile!;
    rawFile.tagged = tagged;
    state = state.copyWith(currentFile: rawFile, rawFiles: [...state.rawFiles, rawFile]);
    await incrementFile();
  }

  void showTaggedImages(bool tagged) {
    state = state.copyWith(showSelected: tagged);
  }

}