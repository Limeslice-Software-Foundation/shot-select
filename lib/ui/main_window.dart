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
import 'package:shot_select/ui/widgets/statusbar.dart';

import '../model/shot_color_enum.dart';
import '../state/providers.dart';
import '../state/ui_state.dart';
import 'widgets/contact_sheet_view.dart';
import 'widgets/loupe_view.dart';
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
    int current = ref.watch(uiStateProvider).current;
    if (event is KeyUpEvent) {

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
      } else if(key==LogicalKeyboardKey.keyT) {
        ref.read(rawFileStateProvider.notifier).setTag(current, true);
      } else if(key==LogicalKeyboardKey.keyU) {
        ref.read(rawFileStateProvider.notifier).setTag(current, null);
      } else if(key==LogicalKeyboardKey.keyX) {
        ref.read(rawFileStateProvider.notifier).setTag(current, false);
      }else if(key==LogicalKeyboardKey.digit0) {
        ref.read(rawFileStateProvider.notifier).setRating(current, null);
      }else if(key==LogicalKeyboardKey.digit1) {
        ref.read(rawFileStateProvider.notifier).setRating(current, 1);
      }else if(key==LogicalKeyboardKey.digit2) {
        ref.read(rawFileStateProvider.notifier).setRating(current, 2);
      }else if(key==LogicalKeyboardKey.digit3) {
        ref.read(rawFileStateProvider.notifier).setRating(current, 3);
      }else if(key==LogicalKeyboardKey.digit4) {
        ref.read(rawFileStateProvider.notifier).setRating(current, 4);
      }else if(key==LogicalKeyboardKey.digit5) {
        ref.read(rawFileStateProvider.notifier).setRating(current, 5);
      }else if(key==LogicalKeyboardKey.keyB) {
        ref.read(rawFileStateProvider.notifier).setColor(current, ShotColorEnum.blue.color);
      }else if(key==LogicalKeyboardKey.keyG) {
        ref.read(rawFileStateProvider.notifier).setColor(current, ShotColorEnum.green.color);
      }else if(key==LogicalKeyboardKey.keyR) {
        ref.read(rawFileStateProvider.notifier).setColor(current, ShotColorEnum.red.color);
      }else if(key==LogicalKeyboardKey.keyP) {
        ref.read(rawFileStateProvider.notifier).setColor(current, ShotColorEnum.purple.color);
      }else if(key==LogicalKeyboardKey.keyY) {
        ref.read(rawFileStateProvider.notifier).setColor(current, ShotColorEnum.yellow.color);
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
    UIState uiState = ref.watch(uiStateProvider);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Toolbar(),
            Expanded(
              child: Row(
                children: [
                  Expanded(child: uiState.showGridView ? const ContactSheetView() : const LoupeView(),),
                  const SideBar(),
                ],
              ),
            ),
            const Statusbar(),
          ],
        ),
      ),
    );
  }
}
