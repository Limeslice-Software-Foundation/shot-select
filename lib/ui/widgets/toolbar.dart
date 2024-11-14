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
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../state/providers.dart';
import '../../state/ui_state.dart';
import 'fa_button.dart';

class Toolbar extends ConsumerWidget {
  const Toolbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    UIState uiState = ref.watch(uiStateProvider);
    return Row(
      children: [
        IconButton(
          focusNode: FocusNode(canRequestFocus: false),
          tooltip: 'Open Folder',
          onPressed: () async {
            String? selectedDirectory = await FilePicker.platform.getDirectoryPath();
            if (selectedDirectory != null) {
              await ref.read(rawFileStateProvider.notifier).loadFiles(selectedDirectory);
            }
          },
          icon: const Icon(
            Icons.folder,
            size: 17,
          ),
        ),
        IconButton(
          focusNode: FocusNode(canRequestFocus: false),
          tooltip: 'Copy Images',
          onPressed: () {},
          icon: const Icon(
            Icons.file_copy,
            size: 17,
          ),
        ),
        IconButton(
          focusNode: FocusNode(canRequestFocus: false),
          tooltip: 'Move Images',
          onPressed: () {},
          icon: const Icon(
            Icons.drive_file_move,
            size: 17,
          ),
        ),
        IconButton(
          focusNode: FocusNode(canRequestFocus: false),
          tooltip: 'Delete Images',
          onPressed: () {},
          icon: const Icon(
            Icons.delete,
            size: 17,
          ),
        ),
        Expanded(
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaButton(
                  onPressed: () {
                    ref.read(uiStateProvider.notifier).noRating();
                  },
                  isSelected: uiState.filterNoRating,
                  iconData: FontAwesomeIcons.star,
                  selectedIcon: FontAwesomeIcons.solidStar,
                ),
                FaButton(
                  onPressed: () {
                    ref.read(uiStateProvider.notifier).oneStar();
                  },
                  isSelected: uiState.filterOneStar,
                  iconData: FontAwesomeIcons.star,
                  selectedIcon: FontAwesomeIcons.solidStar,
                  label: '1',
                ),
                FaButton(
                  onPressed: () {
                    ref.read(uiStateProvider.notifier).twoStar();
                  },
                  isSelected: uiState.filterTwoStar,
                  iconData: FontAwesomeIcons.star,
                  selectedIcon: FontAwesomeIcons.solidStar,
                  label: '2',
                ),
                FaButton(
                  onPressed: () {
                    ref.read(uiStateProvider.notifier).threeStar();
                  },
                  isSelected: uiState.filterThreeStar,
                  iconData: FontAwesomeIcons.star,
                  selectedIcon: FontAwesomeIcons.solidStar,
                  label: '3',
                ),
                FaButton(
                  onPressed: () {
                    ref.read(uiStateProvider.notifier).fourStar();
                  },
                  isSelected: uiState.filterFourStar,
                  iconData: FontAwesomeIcons.star,
                  selectedIcon: FontAwesomeIcons.solidStar,
                  label: '4',
                ),
                FaButton(
                  onPressed: () {
                    ref.read(uiStateProvider.notifier).fiveStar();
                  },
                  isSelected: uiState.filterFiveStar,
                  iconData: FontAwesomeIcons.star,
                  selectedIcon: FontAwesomeIcons.solidStar,
                  label: '5',
                ),
                const SizedBox(
                  height: 20,
                  child: VerticalDivider(
                    thickness: 1,
                  ),
                ),
                FaButton(
                  onPressed: () {
                    ref.read(uiStateProvider.notifier).filterNoColor();
                  },
                  isSelected: uiState.filterNoColor,
                  iconData: FontAwesomeIcons.circle,
                  selectedIcon: FontAwesomeIcons.solidCircle,
                ),
                FaButton(
                  onPressed: () {
                    ref.read(uiStateProvider.notifier).filterRedColor();
                  },
                  isSelected: uiState.filterRedColor,
                  iconData: FontAwesomeIcons.circle,
                  selectedIcon: FontAwesomeIcons.solidCircle,
                  color: Colors.red,
                ),
                FaButton(
                  onPressed: () {
                    ref.read(uiStateProvider.notifier).filterYellowColor();
                  },
                  isSelected: uiState.filterYellowColor,
                  iconData: FontAwesomeIcons.circle,
                  selectedIcon: FontAwesomeIcons.solidCircle,
                  color: Colors.yellow,
                ),
                FaButton(
                  onPressed: () {
                    ref.read(uiStateProvider.notifier).filterGreenColor();
                  },
                  isSelected: uiState.filterGreenColor,
                  iconData: FontAwesomeIcons.circle,
                  selectedIcon: FontAwesomeIcons.solidCircle,
                  color: Colors.green,
                ),
                FaButton(
                  onPressed: () {
                    ref.read(uiStateProvider.notifier).filterBlueColor();
                  },
                  isSelected: uiState.filterBlueColor,
                  iconData: FontAwesomeIcons.circle,
                  selectedIcon: FontAwesomeIcons.solidCircle,
                  color: Colors.blue,
                ),
                FaButton(
                  onPressed: () {
                    ref.read(uiStateProvider.notifier).filterPurpleColor();
                  },
                  isSelected: uiState.filterPurpleColor,
                  iconData: FontAwesomeIcons.circle,
                  selectedIcon: FontAwesomeIcons.solidCircle,
                  color: Colors.purple,
                ),
                const SizedBox(
                  height: 20,
                  child: VerticalDivider(
                    thickness: 1,
                  ),
                ),
                FaButton(
                  onPressed: () {
                    ref.read(uiStateProvider.notifier).filterUntagged();
                  },
                  isSelected: uiState.filterUntagged,
                  iconData: FontAwesomeIcons.square,
                  highlightColor: Colors.blue,
                ),
                FaButton(
                  onPressed: () {
                    ref.read(uiStateProvider.notifier).filterTagged();
                  },
                  isSelected: uiState.filterTagged,
                  iconData: FontAwesomeIcons.squareCheck,
                  highlightColor: Colors.green,
                ),
                FaButton(
                  onPressed: () {
                    ref.read(uiStateProvider.notifier).filterRejected();
                  },
                  isSelected: uiState.filterRejected,
                  iconData: FontAwesomeIcons.squareXmark,
                  highlightColor: Colors.red,
                ),
              ],
            ),
          ),
        ),

        IconButton(
          focusNode: FocusNode(canRequestFocus: false),
          tooltip: 'Contact Sheet View',
          onPressed: () {
            ref.read(uiStateProvider.notifier).showGridView(true);
          },
          isSelected: uiState.showGridView,
          icon: const Icon(Icons.grid_view_rounded, size: 15),
        ),
        IconButton(
          focusNode: FocusNode(canRequestFocus: false),
          tooltip: 'Loupe View',
          onPressed: () {
            ref.read(uiStateProvider.notifier).showGridView(false);
          },
          isSelected: !uiState.showGridView,
          icon: const Icon(Icons.image_rounded, size: 15),
        ),
      ],
    );
  }
}
