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
import '../model/raw_file.dart';

@lazySingleton
class RawFileRepository {

  Future<List<RawFile>> loadFiles(Directory dir) async {
    if(await dir.exists()) {
      List<RawFile> files = [];
      await dir.list().forEach((entity) {
        if(entity is File) {

        };
      });
      return files;
    }
    return [];
  }

  Future<void> closeAll(List<RawFile> files) async {
    for (var file in files) {file.close();}
  }

}