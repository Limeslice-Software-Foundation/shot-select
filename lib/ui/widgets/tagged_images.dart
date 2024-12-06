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

import '../../model/raw_file.dart';
import '../../state/providers.dart';
import '../../state/raw_file_state.dart';

class TaggedImages extends ConsumerWidget {
  final List<RawFile> images;
  const TaggedImages({super.key, required this.images});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    RawFileState state = ref.watch(rawFileStateProvider);
    return Column(
      children: [
        Text(state.showSelected ? 'Tagged Photos' : 'Rejected Photos'),
        const SizedBox(height: 10,),
        Expanded(
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // number of items in each row
                mainAxisSpacing: 5.0, // spacing between rows
                crossAxisSpacing: 5.0, // spacing between columns
              ),
              padding: const EdgeInsets.all(10.0), // padding around the grid
              itemCount: images.length, // total number of items
              itemBuilder: (context, index) {
                return Image.memory(images[index].smallThumbnail);
              }),
        )
      ],
    );
  }
}
