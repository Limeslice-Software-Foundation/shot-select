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
import 'package:log4dart_plus/log4dart_plus.dart';
import '../model/raw_file.dart';

const List<String> rawFileExtensions = [
  '.3fr','.ari', '.arw','.bay','.braw', '.crw', '.cr2', '.cr3','.cap','.data', '.dcs',' .dcr', '.dng','.drf','.eip', '.erf','.fff','.gpr','.iiq','.k25', '.kdc','.mdc', '.mef', '.mos', '.mrw','.nef', '.nrw','.obm', '.orf','.pef', '.ptx', '.pxn','.r3d', '.raf', '.raw', '.rwl', '.rw2', '.rwz','.sr2', '.srf', '.srw','.tif','.x3f'
];

@lazySingleton
class RawFileRepository {

  static final Logger logger = LogManager.getLogger('RawFileRepository');

  Future<List<RawFile>> loadFiles(Directory dir) async {
    List<RawFile> files = [];
    if(await dir.exists()) {
      logger.debug('Directory exists.');

      List<FileSystemEntity> fileList = dir.listSync();
      fileList.retainWhere((entity)=> entity is File && rawFileExtensions.contains(_fileExtension(entity.path).toLowerCase()));
      logger.debug(fileList.toString());
      await Future.forEach(fileList, (FileSystemEntity entity) async {
        try {
          RawFile rawFile = RawFile(path: entity.absolute.path);
          logger.debug('RawFile: ${entity.path}');
          int result = await rawFile.open();
          if(result==0) {
            files.add(rawFile);
          } else {
            logger.debug('rawFile.open() returned non zero error code: $result');
          }
        } catch (err, trace) {
          logger.error(err.toString(), null, trace);
        }
      });
    }
    return files;
  }

  Future<void> closeAll(List<RawFile> files) async {
    for (var file in files) {file.close();}
  }

  String _fileExtension(String path) {
    int index = path.lastIndexOf('.');
    if(index>=0) {
      return path.substring(index);
    }
    return '';
  }

}