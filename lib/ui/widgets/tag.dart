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
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const Color defaultColor = Color.fromRGBO(220, 220, 220, 1);

class Tag extends StatelessWidget {
  final bool? tagged;
  const Tag({super.key, this.tagged});

  @override
  Widget build(BuildContext context) {
    Color xColor = defaultColor;
    if(tagged != null && !tagged!) {
      xColor = Colors.red;
    }
    Color checkColor = defaultColor;
    if(tagged != null && tagged!) {
      checkColor = Colors.green;
    }

    return SizedBox(
      width: 50,
      child: Padding(
        padding: const EdgeInsets.all(3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(FontAwesomeIcons.squareXmark, size: 13,color: xColor),
            const SizedBox(width: 3,),
            FaIcon(FontAwesomeIcons.squareCheck, size: 13,color: checkColor),
          ],
        ),
      ),
    );
  }
}
