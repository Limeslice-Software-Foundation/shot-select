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

const Color defaultBackgroundColor = Color.fromRGBO(220, 220, 220, 1);

class Rating extends StatelessWidget {
  final int? rating;
  final Color? color;
  const Rating({super.key, this.rating, this.color});

  @override
  Widget build(BuildContext context) {
    Color iconColor = Colors.black87;
    Color background = defaultBackgroundColor;
    if(color!=null) {
      iconColor = Colors.white;
      background = color!;
    }
    int c = rating?? 0;
    if(c > 5) c = 5;

    List<Widget> stars = [];
    int blanks = 5-c;
    for(int i = 0; i < c; i++) {
      stars.add(FaIcon(FontAwesomeIcons.solidStar, size: 9,color: iconColor,));
    }
    for(int i = 0; i < blanks; i++) {
      stars.add(FaIcon(FontAwesomeIcons.star, size: 9,color: iconColor));
    }

    return Container(
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(20),
      ),
      width: 60,

      child: Padding(
        padding: const EdgeInsets.all(3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: stars,
        ),
      ),
    );
  }
}
