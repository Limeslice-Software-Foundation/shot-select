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

import '../../constants/colors.dart';
import '../../state/providers.dart';
import '../../state/raw_file_state.dart';
import '../../state/ui_state.dart';
import 'rating.dart';
import 'tag.dart';

class ContactSheetView extends ConsumerWidget {
  const ContactSheetView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int columnCount = getNumberOfColumns(context);
    RawFileState state = ref.watch(rawFileStateProvider);
    UIState uiState = ref.watch(uiStateProvider);

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columnCount, // number of items in each row
        mainAxisSpacing: 8.0, // spacing between rows
        crossAxisSpacing: 8.0, // spacing between columns
      ),
      padding: const EdgeInsets.all(10.0), // padding around the grid
      itemCount: state.files.length, // total number of items
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            ref.read(uiStateProvider.notifier).setCurrent(index);
          },
          onDoubleTap: () {
            ref.read(uiStateProvider.notifier).setCurrent(index);
            ref.read(uiStateProvider.notifier).showGridView(false);
          },
          child: Card(
            color: index==uiState.current ? midGray : null,
            child: AspectRatio(
              aspectRatio: 1,
              child: Column(
                children: [
                  Expanded(
                    child: Center(
                      child: Image.memory(
                        state.files[index].thumbNail,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6),
                    child: Row(
                      children: [
                        Rating(
                          rating: state.files[index].rating,
                          color: state.files[index].color,
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              state.files[index].fileName,
                              style: const TextStyle(fontSize: 8),
                            ),
                          ),
                        ),
                        Tag(
                          tagged: state.files[index].tagged,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  int getNumberOfColumns(context) {
    double width = MediaQuery.of(context).size.width;
    if (width > 1500) {
      return 5;
    } else if (width > 1200) {
      return 4;
    } else if (width > 900) {
      return 3;
    } else if (width > 600) {
      return 2;
    }
    return 1;
  }
}
