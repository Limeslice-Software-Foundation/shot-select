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
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../state/providers.dart';
import '../../state/raw_file_state.dart';
import '../../state/ui_state.dart';

class Statusbar extends ConsumerWidget {
  const Statusbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    RawFileState state = ref.watch(rawFileStateProvider);
    UIState uiState = ref.watch(uiStateProvider);
    String message = '';
    double value = 0;
    if (state.isLoading) {
      message = 'Finding RAW files...';
      if (state.numberRawFilesFound > 0) {
        message = 'Found ${state.numberRawFilesFound} RAW files, loading them...';
        value = state.files.length / state.numberRawFilesFound;
      }
    } else {
      if (state.files.length > 0) {
        message = '${uiState.current + 1} of ${state.files.length} files';
      }
    }
    return SizedBox(
      height: 30,
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Text(
                message,
                style: const TextStyle(fontSize: 10),
              ),
            ),
          ),
          state.isLoading
              ? Padding(
                  padding: const EdgeInsets.fromLTRB(0, 3, 15, 3),
                  child: SizedBox(
                      width: 250,
                      child: LinearProgressIndicator(
                        backgroundColor: Colors.blueGrey,
                        value: value,
                      ),),)
              : Container()
        ],
      ),
    );
  }
}
