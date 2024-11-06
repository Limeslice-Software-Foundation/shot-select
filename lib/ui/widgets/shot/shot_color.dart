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

import '../fa_button.dart';

class ShotColor extends StatelessWidget {
  const ShotColor({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FaButton(
          onPressed: () {

          },
          isSelected: false,
          iconData: FontAwesomeIcons.circle,
          selectedIcon: FontAwesomeIcons.solidCircle,
        ),
        FaButton(
          onPressed: () {

          },
          isSelected: false,
          iconData: FontAwesomeIcons.circle,
          selectedIcon: FontAwesomeIcons.solidCircle,
          color: Colors.red,
        ),
        FaButton(
          onPressed: () {

          },
          isSelected: false,
          iconData: FontAwesomeIcons.circle,
          selectedIcon: FontAwesomeIcons.solidCircle,
          color: Colors.yellow,
        ),
        FaButton(
          onPressed: () {

          },
          isSelected: false,
          iconData: FontAwesomeIcons.circle,
          selectedIcon: FontAwesomeIcons.solidCircle,
          color: Colors.green,
        ),
        FaButton(
          onPressed: () {

          },
          isSelected: false,
          iconData: FontAwesomeIcons.circle,
          selectedIcon: FontAwesomeIcons.solidCircle,
          color: Colors.blue,
        ),
        FaButton(
          onPressed: () {

          },
          isSelected: false,
          iconData: FontAwesomeIcons.circle,
          selectedIcon: FontAwesomeIcons.solidCircle,
          color: Colors.purple,
        ),
      ],
    );
  }
}
