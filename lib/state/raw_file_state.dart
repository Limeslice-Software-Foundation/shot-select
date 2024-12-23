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
import '../model/raw_file.dart';

part 'raw_file_state.freezed.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class RawFileState with _$RawFileState {
  const factory RawFileState({
    required String directory,
    required List<RawFile> files,
    @Default(false) bool isLoading,
    @Default(false) bool isError,
    @Default(0) int numberRawFilesFound,

  }) = _RawFileState;
}