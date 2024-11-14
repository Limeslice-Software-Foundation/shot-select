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
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../state/providers.dart';
import '../../../state/raw_file_state.dart';
import '../../../state/ui_state.dart';

class ShotRating extends ConsumerWidget {
  ShotRating({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    UIState uiState = ref.watch(uiStateProvider);
    RawFileState state = ref.watch(rawFileStateProvider);
    int c = state.files[uiState.current].rating?? 0;
    if(c > 5) c = 5;

    List<Widget> stars = [];
    stars.add(IconButton(onPressed: (){
      ref.read(rawFileStateProvider.notifier).setRating(uiState.current, null);
    }, icon: const FaIcon(FontAwesomeIcons.star, size: 18)));
    int blanks = 5-c;
    for(int i = 0; i < c; i++) {
      stars.add(IconButton(onPressed: (){
        ref.read(rawFileStateProvider.notifier).setRating(uiState.current, i+1);
      }, icon: const FaIcon(FontAwesomeIcons.solidStar, size: 18, color: Colors.yellow,)));
    }
    for(int i = 0; i < blanks; i++) {
      stars.add(IconButton(onPressed: () {
        ref.read(rawFileStateProvider.notifier).setRating(uiState.current, c+i+1);
      }, icon: const FaIcon(FontAwesomeIcons.solidStar, size: 18)));
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: stars,
    );
  }
}
