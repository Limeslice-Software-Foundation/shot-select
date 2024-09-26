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

class Toolbar extends ConsumerWidget {
  bool lightTableView;
  Function onViewChanged;
  Toolbar({super.key, required this.lightTableView, required this.onViewChanged});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        children: [
          IconButton(onPressed: () async {
            String? selectedDirectory = await FilePicker.platform.getDirectoryPath();
            if (selectedDirectory != null) {
              ref.read(rawFileStateProvider.notifier).loadFiles(selectedDirectory);
            }
          }, icon: const FaIcon(FontAwesomeIcons.folderOpen)),
          const SizedBox(width: 10,),
          IconButton(onPressed: (){}, icon: const FaIcon(FontAwesomeIcons.clone)),
          const SizedBox(width: 10,),
          IconButton(onPressed: (){}, icon: const FaIcon(FontAwesomeIcons.trash)),
          Expanded(child: Container(),),
          SegmentedButton<bool>(segments: const [
             ButtonSegment<bool>(
                value: true,
                label: Text('Light Table'),
                icon: Icon(Icons.grid_view_rounded)),
            ButtonSegment<bool>(
                value: false,
                label: Text('Loupe'),
                icon: Icon(Icons.image_rounded)),
          ], selected: <bool>{lightTableView},
          onSelectionChanged: (Set<bool> newSelection) {
            onViewChanged(newSelection.first);
          },),
        ],
      ),
    );
  }
}
