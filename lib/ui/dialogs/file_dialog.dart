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

import '../../state/file_state.dart';
import '../../state/providers.dart';

class FileDialog extends ConsumerStatefulWidget {
  final String title;
  final VoidCallback? onApprove;
  const FileDialog({super.key, required this.title, required this.onApprove});

  static Future<void> showCopyDialog(BuildContext context) async {
    await show(context, 'Copy Files', (){});
  }

  static Future<void> showMoveDialog(BuildContext context) async {
    await show(context, 'Move Files', (){});
  }

  static Future<void> show(BuildContext context, String title, VoidCallback? onApprove) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return FileDialog(title: title, onApprove: onApprove,);
      },
    );
  }

  @override
  ConsumerState<FileDialog> createState() => _FileDialogState();
}

class _FileDialogState extends ConsumerState<FileDialog> {
  @override
  Widget build(BuildContext context) {
    FileState state = ref.watch(fileStateProvider);

    return AlertDialog(
      title: Text(widget.title),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Destination: '),
          Row(
            children: [
              Expanded(child: Text(state.directory, style: const TextStyle(fontSize: 10),),),
              IconButton(onPressed: () async {
                String? selectedDirectory = await FilePicker.platform.getDirectoryPath();
                if(selectedDirectory != null) {
                  ref.read(fileStateProvider.notifier).selectDirectory(selectedDirectory);
                }
              }, icon: const Icon(Icons.more_horiz),),
            ],
          ),
          Expanded(child: SizedBox(
            width: 290,
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // number of items in each row
                  mainAxisSpacing: 5.0, // spacing between rows
                  crossAxisSpacing: 5.0, // spacing between columns
                ),
                padding: const EdgeInsets.all(10.0), // padding around the grid
                itemCount: state.rawFiles.length, // total number of items
                itemBuilder: (context, index) {
                  return Image.memory(state.rawFiles[index].smallThumbnail);
                }),
          ),),
          Padding(padding: const EdgeInsets.all(10), child: LinearProgressIndicator(value: state.current==0?0:(state.current/state.rawFiles.length),),),
        ],
      ),
      actions: <Widget>[
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          onPressed: widget.onApprove,
          child: Text(widget.title),
        ),
      ],
    );

  }
}
