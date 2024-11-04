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

import 'side_bar_row.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 285,
      child: Padding(
        padding: EdgeInsets.all(18),
        child: Column(
          children: [
            Text('Shot Information', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
            SizedBox(height: 14,),
            Divider(),
            SizedBox(height: 14,),
            SideBarRow(fieldName: 'Filename', value: 'RAW_CANON_5D_ARGB.CR2'),
            SizedBox(height: 10,),
            SideBarRow(fieldName: 'Date', value: '2006-01-15'),
            SizedBox(height: 10,),
            SideBarRow(fieldName: 'Time', value: '13:32:40'),
            SizedBox(height: 10,),
            SideBarRow(fieldName: 'Dimensions', value: '4640 x 3472'),
            SizedBox(height: 10,),
            SideBarRow(fieldName: 'Camera', value: 'Canon'),
            SizedBox(height: 10,),
            SideBarRow(fieldName: 'Model', value: 'EOS 5D'),
            SizedBox(height: 10,),
            SideBarRow(fieldName: 'Lens', value: 'OLYMPUS M.14-42mm F3.5-5.6 EZ'),
            SizedBox(height: 10,),
            SideBarRow(fieldName: 'Focal Length', value: '200mm'),
            SizedBox(height: 10,),
            SideBarRow(fieldName: 'Aperture', value: 'f3.5'),
            SizedBox(height: 10,),
            SideBarRow(fieldName: 'Shutter', value: '1/15s'),
            SizedBox(height: 10,),
            SideBarRow(fieldName: 'ISO', value: '200'),
            SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}
