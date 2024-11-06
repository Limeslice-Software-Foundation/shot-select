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

const List<String> rawFileExtensions = [
  '.3fr','.ari', '.arw','.bay','.braw', '.crw', '.cr2', '.cr3','.cap','.data', '.dcs',' .dcr', '.dng','.drf','.eip', '.erf','.fff','.gpr','.iiq','.k25', '.kdc','.mdc', '.mef', '.mos', '.mrw','.nef', '.nrw','.obm', '.orf','.pef', '.ptx', '.pxn','.r3d', '.raf', '.raw', '.rwl', '.rw2', '.rwz','.sr2', '.srf', '.srw','.tif','.x3f'
];

@lazySingleton
class RawFileRepository {

  Future<List<RawFile>> loadFiles(Directory dir) async {
    List<RawFile> files = [];
    if(await dir.exists()) {
      print('Directory exists.');

      List<FileSystemEntity> fileList = dir.listSync();
      fileList.retainWhere((entity)=> entity is File && rawFileExtensions.contains(_fileExtension(entity.path).toLowerCase()));
      print(fileList);
      await Future.forEach(fileList, (FileSystemEntity entity) async {
        try {
          RawFile rawFile = RawFile(fileName: entity.absolute.path);
          print('RawFile: ${entity.path}');
          int result = await rawFile.open();
          if(result==0) {
            print('### TCM ### ${entity.path}');
            files.add(rawFile);
          } else {
            print('### TCM ### result==$result');
          }
        } catch (err, trace) {
          print(err);
          print(trace);
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