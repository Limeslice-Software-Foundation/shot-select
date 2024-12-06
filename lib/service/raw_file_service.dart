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

import 'package:injectable/injectable.dart';

import '../injection.dart';
import '../model/raw_file.dart';
import '../repository/add_dir_repository.dart';
import '../repository/raw_file_repository.dart';

@lazySingleton
class RawFileService {

  Future<List<File>> findRawFiles(Directory dir) async {
    RawFileRepository fileRepository = getIt<RawFileRepository>();
    return await fileRepository.findRawFiles(dir);
  }

  Future<RawFile?> loadFile(File file) async {
    RawFileRepository fileRepository = getIt<RawFileRepository>();
    return await fileRepository.loadFile(file);
  }

  Future<void> closeAll(List<RawFile> files) async {
    RawFileRepository fileRepository = getIt<RawFileRepository>();
    await fileRepository.closeAll(files);
  }

  File generateThumbnailFilename(File file, String selectedDirectory, Directory applicationDirectory) {
    return File('${applicationDirectory.absolute.path}${file.absolute.path.substring(selectedDirectory.length)}');
  }
}