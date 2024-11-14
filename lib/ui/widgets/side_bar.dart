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
import '../../state/ui_state.dart';
import 'shot/shot_color.dart';
import 'shot/shot_rating.dart';
import 'shot/shot_tag.dart';
import 'side_bar_row.dart';

DateFormat dateFormat = DateFormat.yMMMd();
DateFormat timeFormat = DateFormat.Hms();

class SideBar extends ConsumerWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    RawFileState state = ref.watch(rawFileStateProvider);
    UIState uiState = ref.watch(uiStateProvider);
    int currentIndex = ref.watch(uiStateProvider).current;
    return state.files.isEmpty ? Container() :
        uiState.showSideBar ?
      Row(
      children: [
        const VerticalDivider(),
        const SizedBox(width: 4,),
        SizedBox(
          width: 285,
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
              children: [
                Container(
                  color: Colors.blueGrey,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(child: Padding(padding: EdgeInsets.fromLTRB(10, 0, 0, 0) ,child: Text('Shot Rating', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),),),
                      IconButton(onPressed: (){
                        ref.read(uiStateProvider.notifier).showSideBar(false);
                      }, icon: const Icon(Icons.chevron_right),),
                    ],

                  ),
                ),
                SizedBox(height: 6,),
                ShotTag(),
                SizedBox(height: 6,),
                ShotRating(),
                SizedBox(height: 6,),
                ShotColor(),

                SizedBox(height: 30,),

                Text('Shot Information', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
                SizedBox(height: 12,),
                SideBarRow(fieldName: 'Filename', value: state.files[currentIndex].fileName),
                SizedBox(height: 10,),
                SideBarRow(fieldName: 'Date', value: dateFormat.format(state.files[currentIndex].timestamp)),
                SizedBox(height: 10,),
                SideBarRow(fieldName: 'Time', value: timeFormat.format(state.files[currentIndex].timestamp)),
                SizedBox(height: 10,),
                SideBarRow(fieldName: 'Dimensions', value: state.files[currentIndex].dimension),
                SizedBox(height: 10,),
                SideBarRow(fieldName: 'Camera', value: state.files[currentIndex].cameraMake),
                SizedBox(height: 10,),
                SideBarRow(fieldName: 'Model', value: state.files[currentIndex].cameraModel),
                SizedBox(height: 10,),
                SideBarRow(fieldName: 'Lens', value: state.files[currentIndex].lens),
                SizedBox(height: 10,),
                SideBarRow(fieldName: 'Focal Length', value: state.files[currentIndex].focalLength),
                SizedBox(height: 10,),
                SideBarRow(fieldName: 'Aperture', value: state.files[currentIndex].aperture),
                SizedBox(height: 10,),
                SideBarRow(fieldName: 'Shutter', value: state.files[currentIndex].shutter),
                SizedBox(height: 10,),
                SideBarRow(fieldName: 'ISO', value: state.files[currentIndex].iso),
                SizedBox(height: 10,),
              ],
            ),
          ),
        )
      ],
    ) : Container(
          color: Colors.blueGrey,
      child: SizedBox(width: 30, child: Center(child: IconButton(onPressed: (){
            ref.read(uiStateProvider.notifier).showSideBar(true);
          }, icon: const Icon(Icons.chevron_left),),),),
    );
  }
}
