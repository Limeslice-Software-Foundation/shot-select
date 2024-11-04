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

const TextStyle fieldNameStyle =  TextStyle(fontSize: 9);
const TextStyle fieldValueStyle = TextStyle(fontSize: 11);
const double firstColumnWidth = 55;

class SideBarRow extends StatelessWidget {
  final String fieldName;
  final String value;
  const SideBarRow({super.key, required this.fieldName, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      SizedBox(width: firstColumnWidth, child: Text(fieldName, style: fieldNameStyle,)),
      const SizedBox(width: 8,),
      Expanded(child: Text(value, style: fieldValueStyle,),),
    ],);
  }
}