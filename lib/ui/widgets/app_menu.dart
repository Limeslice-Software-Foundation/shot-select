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

import '../../state/providers.dart';
import '../../state/raw_file_state.dart';
import '../dialogs/app_about_dialog.dart';
import '../dialogs/file_dialog.dart';

class AppMenu extends ConsumerWidget {
  const AppMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    RawFileState state = ref.watch(rawFileStateProvider);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          ListTile(
            title: const Text('Open'),
            onTap: () async {
              String? selectedDirectory = await FilePicker.platform.getDirectoryPath();
              if (selectedDirectory != null) {
                await ref.read(rawFileStateProvider.notifier).loadFiles(selectedDirectory);
                // Close the drawer.
                Navigator.pop(context);
              }
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Copy Tagged'),
            enabled: state.current >= state.files.length && state.files.isNotEmpty,
            onTap: () async {
              ref.read(fileStateProvider.notifier).setFiles(state.rawFiles.where((x) => x.tagged != null && x.tagged == true).toList());
              await FileDialog.showCopyDialog(context);
            },
          ),
          ListTile(
            title: const Text('Move Tagged'),
            enabled: state.current >= state.files.length && state.files.isNotEmpty,
            onTap: () async {
              ref.read(fileStateProvider.notifier).setFiles(state.rawFiles.where((x) => x.tagged != null && x.tagged == true).toList());
              await FileDialog.showMoveDialog(context);
            },
          ),
          ListTile(
            title: const Text('Delete Rejected'),
            onTap: () {
              ref.read(fileStateProvider.notifier).setFiles(state.rawFiles.where((x) => x.tagged != null && x.tagged == false).toList());
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('About'),
            onTap: () async {
              await AppAboutDialog.show(context);
              // Close the drawer.
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
