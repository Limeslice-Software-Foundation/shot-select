

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
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ui_state.freezed.dart';

@Freezed()
class UIState with _$UIState {
  const factory UIState({
    @Default(0) int current,
    @Default(0) int totalFiles,

    @Default(true) bool showGridView,
    @Default(true) bool showSideBar,

    @Default(false) bool filterNoRating,
    @Default(false) bool filterOneStar,
    @Default(false) bool filterTwoStar,
    @Default(false) bool filterThreeStar,
    @Default(false) bool filterFourStar,
    @Default(false) bool filterFiveStar,

    @Default(false) bool filterNoColor,
    @Default(false) bool filterRedColor,
    @Default(false) bool filterYellowColor,
    @Default(false) bool filterGreenColor,
    @Default(false) bool filterBlueColor,
    @Default(false) bool filterPurpleColor,

    @Default(false) bool filterRejected,
    @Default(false) bool filterTagged,
    @Default(false) bool filterUntagged,


  }) = _UIState;
}