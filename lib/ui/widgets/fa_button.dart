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

const defaultHighlightColor = Colors.blueAccent;

class FaButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData iconData;
  final Color? color;
  final Color? highlightColor;
  final String? label;
  final bool? isSelected;
  final IconData? selectedIcon;

  const FaButton(
      {super.key, required this.onPressed, required this.iconData, this.color, this.highlightColor, this.label,
        this.isSelected, this.selectedIcon});

  @override
  Widget build(BuildContext context) {
    Color? iconColor = color;
    IconData? data = iconData;
    if (isSelected != null && isSelected! && selectedIcon != null) {
      data = selectedIcon;
    }
    if(isSelected != null && isSelected! && highlightColor != null) {
      iconColor = highlightColor!;
    }
    Widget icon = FaIcon(
      data,
      size: 17,
      color: iconColor,
    );
    return IconButton(
      focusNode: FocusNode(canRequestFocus: false),
      padding: const EdgeInsets.all(6.0),
      constraints: const BoxConstraints(),
      onPressed: onPressed,
      focusColor: iconColor,
      splashColor: iconColor,
      icon: label == null
          ? icon
          : Badge(
              label: Text(
                label!,
                style: const TextStyle(fontSize: 8),
              ),
              padding: const EdgeInsets.all(0),
              largeSize: 6,
              offset: const Offset(1, -2),
              backgroundColor: Colors.blueAccent,
              child: icon,
            ),
    );
  }
}
