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
class ShotColorEnum {
  static final ShotColorEnum blue = ShotColorEnum(color: Colors.blue, name: 'Blue');
  static final ShotColorEnum green = ShotColorEnum(color: Colors.green, name: 'Green');
  static final ShotColorEnum purple = ShotColorEnum(color: Colors.purple, name: 'Purple');
  static final ShotColorEnum red = ShotColorEnum(color: Colors.red, name: 'Red');
  static final ShotColorEnum yellow = ShotColorEnum(color: Colors.yellow, name: 'Yellow');


  final Color color;
  final String name;

  ShotColorEnum({required this.color, required this.name});

  @override
  String toString() {
    return name;
  }

  static ShotColorEnum? fromColor(Color? color) {
    if(color==null) {
      return null;
    }
    switch(color) {
      case Colors.blue: {
        return blue;
      }
      case Colors.green: {
        return green;
      }
      case Colors.purple: {
        return purple;
      }
      case Colors.red: {
        return red;
      }
      case Colors.yellow: {
        return yellow;
      }
      default: {
        return null;
      }
    }
  }

  static ShotColorEnum? fromString(String? name) {
    if(name==null) {
      return null;
    }
    String colorStr = name.toLowerCase();
    switch(colorStr) {
      case 'blue': {
        return blue;
      }
      case 'green': {
        return green;
      }
      case 'purple': {
        return purple;
      }
      case 'red': {
        return red;
      }
      case 'yellow': {
        return yellow;
      }
      default: {
        return null;
      }
    }
  }

}