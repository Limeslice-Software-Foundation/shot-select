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

const TextStyle font11 = TextStyle(fontSize: 11);

class Statusbar extends ConsumerWidget {
  const Statusbar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    RawFileState state = ref.watch(rawFileStateProvider);
    String message = '';
    String fileName = '';
    if (state.isLoading) {
      message = 'Finding RAW files...';
      if (state.files.isNotEmpty) {
        message = 'Found ${state.files.length} RAW files, loading them...';
      }
    } else {
      if (state.files.isNotEmpty && state.currentFile != null) {
        message = '${state.current + 1} of ${state.files.length} files';
        fileName = state.currentFile!.fileName;
      }
    }
    return SizedBox(
      height: 76,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(message, style: font11,),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(fileName, style: font11,),
                ],
              ),
            ),
            IconButton(
              onPressed: state.currentFile == null ? null : () {
                ref.read(rawFileStateProvider.notifier).tagCurrentImage(false);
              },
              icon: const Icon(Icons.cancel_outlined),
              color: Colors.red,
            ),
            IconButton(
              onPressed: state.currentFile == null ? null : () {
                ref.read(rawFileStateProvider.notifier).tagCurrentImage(true);
              },
              icon: const Icon(Icons.check),
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
