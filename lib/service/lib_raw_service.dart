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

import 'package:injectable/injectable.dart';
import 'package:log4dart_plus/log4dart_plus.dart';

import '../injection.dart';
import '../repository/lib_raw_repository.dart';

@lazySingleton
class LibRawService {

  static final Logger logger = LogManager.getLogger('LibRawService');

  Future<bool> loadLibRaw() async {
    LibRawRepository repository = getIt<LibRawRepository>();
    return await repository.loadLibRawLib();
  }
}