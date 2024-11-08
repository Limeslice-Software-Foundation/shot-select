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
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../ui_state.dart';

class UIStateNotifier extends StateNotifier<UIState> {
  UIStateNotifier() : super(const UIState());

  void incrementCurrent() {
    state = state.copyWith(current: state.current+1);
  }

  void decrementCurrent() {
    state = state.copyWith(current: state.current-1);
  }

  void setCurrent(int current) {
    state = state.copyWith(current: current);
  }

  void noRating() {
    state = state.copyWith(filterNoRating: !state.filterNoRating);
  }

  void oneStar() {
    state = state.copyWith(filterOneStar: !state.filterOneStar);
  }

  void twoStar() {
    state = state.copyWith(filterTwoStar: !state.filterTwoStar);
  }

  void threeStar() {
    state = state.copyWith(filterThreeStar: !state.filterThreeStar);
  }

  void fourStar() {
    state = state.copyWith(filterFourStar: !state.filterFourStar);
  }

  void fiveStar() {
    state = state.copyWith(filterFiveStar: !state.filterFiveStar);
  }

  void filterUntagged() {
    state = state.copyWith(filterUntagged: !state.filterUntagged);
  }

  void filterRejected() {
    state = state.copyWith(filterRejected: !state.filterRejected);
  }

  void filterTagged() {
    state = state.copyWith(filterTagged: !state.filterTagged);
  }

  void filterNoColor() {
    state = state.copyWith(filterNoColor: !state.filterNoColor);
  }

  void filterRedColor() {
    state = state.copyWith(filterRedColor: !state.filterRedColor);
  }

  void filterYellowColor() {
    state = state.copyWith(filterYellowColor: !state.filterYellowColor);
  }

  void filterGreenColor() {
    state = state.copyWith(filterGreenColor: !state.filterGreenColor);
  }

  void filterBlueColor() {
    state = state.copyWith(filterBlueColor: !state.filterBlueColor);
  }

  void filterPurpleColor() {
    state = state.copyWith(filterPurpleColor: !state.filterPurpleColor);
  }

  void showGridView(bool showGridView) {
    state = state.copyWith(showGridView: showGridView);
  }
}
