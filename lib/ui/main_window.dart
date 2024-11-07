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
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shot_select/ui/widgets/contact_sheet_view.dart';

import '../state/providers.dart';
import 'widgets/side_bar.dart';
import 'widgets/toolbar.dart';

class MainWindow extends ConsumerStatefulWidget {
  const MainWindow({super.key});

  @override
  ConsumerState<MainWindow> createState() => _MainWindowState();
}

class _MainWindowState extends ConsumerState<MainWindow> {

  /// Listen for key pressed events
  bool _onKey(KeyEvent event) {
    final key = event.logicalKey;
    if (event is KeyUpEvent) {
      int current = ref.watch(uiStateProvider).current;
      if(key==LogicalKeyboardKey.arrowDown || key==LogicalKeyboardKey.arrowRight ) {
        int fileCount = ref.watch(rawFileStateProvider).files.length;
        if(current < fileCount-1) {
          ref.read(uiStateProvider.notifier).incrementCurrent();
        }
      }
      else if(key==LogicalKeyboardKey.arrowUp || key==LogicalKeyboardKey.arrowLeft ) {
        if(current>0) {
          ref.read(uiStateProvider.notifier).decrementCurrent();
        }
      }
    }
    return true;
  }

  @override
  void initState() {
    super.initState();
    ServicesBinding.instance.keyboard.addHandler(_onKey);
  }

  @override
  void dispose() {
    ServicesBinding.instance.keyboard.removeHandler(_onKey);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Toolbar(),
            Expanded(
              child: Row(
                children: [
                  Expanded(child: ContactSheetView(),),
                  VerticalDivider(),
                  SideBar(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
