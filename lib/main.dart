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
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:log4dart_plus/log4dart_plus.dart';

import 'injection.dart';
import 'service/lib_raw_service.dart';
import 'shot_select_app.dart';

void main() async {
  LogConfigurator.doBasicConfiguration();
  Logger logger = LogManager.getLogger('main');
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    configureDependencies();

    LibRawService service = getIt<LibRawService>();
    bool libLoaded = await service.loadLibRaw();
    if(libLoaded) {
      logger.debug('Lib raw library loaded successfully.');
    }

    runApp(
      const ProviderScope(
        child: ShotSelectApp(),
      ),
    );

  }, (exception, stackTrace) async {
   //logger.error(exception.toString(), exception, stackTrace);
  });
}