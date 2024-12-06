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
import 'package:shot_select/ui/widgets/app_menu.dart';
import 'package:shot_select/ui/widgets/main_panel.dart';
import 'package:shot_select/ui/widgets/statusbar.dart';

import '../state/providers.dart';
import '../state/raw_file_state.dart';
import 'widgets/side_bar.dart';

class MainWindow extends ConsumerWidget {
  const MainWindow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    RawFileState state = ref.watch(rawFileStateProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shot Select'),
        actions: [
          IconButton(
            onPressed: state.current < state.files.length || state.files.isEmpty ? null : () {
              ref.read(rawFileStateProvider.notifier).showTaggedImages(true);
            },
            icon: const Icon(Icons.check),
            color: Colors.green,
          ),
          IconButton(
            onPressed: state.current < state.files.length || state.files.isEmpty ? null : () {
              ref.read(rawFileStateProvider.notifier).showTaggedImages(false);
            },
            icon: const Icon(Icons.cancel_outlined),
            color: Colors.red,
          ),
          Builder(builder: (context) {
            return IconButton(
              onPressed: state.currentFile == null
                  ? null
                  : () {
                      Scaffold.of(context).openEndDrawer();
                    },
              icon: const Icon(Icons.info),
              color: Colors.blue,
            );
          }),
        ],
      ),
      drawer: const AppMenu(),
      body: const SafeArea(
        child: Column(
          children: [
            Expanded(child: MainPanel()),
            Statusbar(),
          ],
        ),
      ),
      endDrawer: const SideBar(),
    );
  }
}
