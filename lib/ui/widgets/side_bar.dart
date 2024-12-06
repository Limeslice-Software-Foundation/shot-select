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
import 'package:intl/intl.dart';

import '../../state/providers.dart';
import '../../state/raw_file_state.dart';
import 'side_bar_row.dart';

DateFormat dateFormat = DateFormat.yMMMd();
DateFormat timeFormat = DateFormat.Hms();

const SizedBox verticalSpace10 = SizedBox(
  height: 10,
);

class SideBar extends ConsumerWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    RawFileState state = ref.watch(rawFileStateProvider);
    return Drawer(
      child: state.currentFile == null
          ? Container()
          : Padding(
              padding: const EdgeInsets.all(12),
              child: SizedBox(
                width: 285,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 6,
                    ),
                    const Text(
                      'Shot Information',
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    SideBarRow(fieldName: 'Filename', value: state.currentFile!.fileName),
                    verticalSpace10,
                    SideBarRow(fieldName: 'Date', value: dateFormat.format(state.currentFile!.timestamp)),
                    verticalSpace10,
                    SideBarRow(fieldName: 'Time', value: timeFormat.format(state.currentFile!.timestamp)),
                    verticalSpace10,
                    SideBarRow(fieldName: 'Dimensions', value: state.currentFile!.dimension),
                    verticalSpace10,
                    SideBarRow(fieldName: 'Camera', value: state.currentFile!.cameraMake),
                    verticalSpace10,
                    SideBarRow(fieldName: 'Model', value: state.currentFile!.cameraModel),
                    verticalSpace10,
                    SideBarRow(fieldName: 'Lens', value: state.currentFile!.lens),
                    verticalSpace10,
                    SideBarRow(fieldName: 'Focal Length', value: state.currentFile!.focalLength),
                    verticalSpace10,
                    SideBarRow(fieldName: 'Aperture', value: state.currentFile!.aperture),
                    verticalSpace10,
                    SideBarRow(fieldName: 'Shutter', value: state.currentFile!.shutter),
                    verticalSpace10,
                    SideBarRow(fieldName: 'ISO', value: state.currentFile!.iso),
                    verticalSpace10,
                    Expanded(
                      child: Container(),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: FilledButton(
                          onPressed: () {
                            // close the drawer
                            Navigator.pop(context);
                          },
                          child: const Text('Close'),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
