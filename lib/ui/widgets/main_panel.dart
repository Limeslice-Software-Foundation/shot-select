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
import 'tagged_images.dart';

class MainPanel extends ConsumerWidget {
  const MainPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    RawFileState state = ref.watch(rawFileStateProvider);
    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator.adaptive());
    }
    if (state.currentFile != null) {
      return Center(
        child: InteractiveViewer(
          maxScale: 3,
          minScale: 1,
          child: Image.memory(state.currentFile!.thumbNail),
        ),
      );
    }

    if (state.current >= state.files.length && state.files.isNotEmpty) {
      return TaggedImages(
        images: state.rawFiles.where((x) => x.tagged != null && x.tagged == state.showSelected).toList(),
      );
    }

    return const Center();
  }
}