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
import 'package:url_launcher/url_launcher.dart';

import 'error_dialog.dart';

const String lsfUrl = 'https://limeslice.org';
const String poppinsFontUrl = 'https://github.com/itfoundry/Poppins';
const String iconsUrl = 'https://www.libraw.org/';

const TextStyle font11 = TextStyle(fontSize: 11);

class AppAboutDialog extends StatelessWidget {
  const AppAboutDialog({super.key});

  static Future<void> show(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('About'),
          content: const AppAboutDialog(),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Shot Select',
            style: TextStyle(fontSize: 30),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            '1.0.0',
            style: TextStyle(fontSize: 11, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 11,
          ),
          const Text(
            'Copyright 2024 The Limeslice Software Foundation.',
            style: font11,
          ),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
                onTap: () async {
                  if (!await launchUrl(Uri.parse(lsfUrl))) {
                    ErrorDialog.show(context,'Failed to open url.');
                  }
                },
                child: const Text(
                  lsfUrl,
                  style: TextStyle(fontSize: 11, color: Colors.blue),
                )),
          ),

          /// ======================================================[ FONT ]
          const SizedBox(
            height: 11,
          ),
          const Text(
            'Poppins Font, Copyright 2020 The Poppins Project Authors',
            style: font11,
          ),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
                onTap: () async {
                  if (!await launchUrl(Uri.parse(poppinsFontUrl))) {
                    ErrorDialog.show(context,'Failed to open url.');
                  }
                },
                child: const Text(
                  poppinsFontUrl,
                  style: TextStyle(fontSize: 11, color: Colors.blue),
                )),
          ),
          const Text(
            'This Font Software is licensed under the',
            style: font11,
          ),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
                onTap: () async {
                  if (!await launchUrl(Uri.parse('https://openfontlicense.org/open-font-license-official-text/'))) {
                    ErrorDialog.show(context,'Failed to open url.');
                  }
                },
                child: const Text(
                  'SIL Open Font License, Version 1.1 ',
                  style: TextStyle(fontSize: 11, color: Colors.blue),
                )),
          ),


          /// ======================================================[ Libraw ]
          const SizedBox(
            height: 11,
          ),
          const Text(
            'The LibRaw package is copyright (C) 2008-2024 LibRaw LLC\nLibRaw uses code from Dave Coffin’s dcraw.c utility (without RESTRICTED/GPL2 code)\nCopyright 1997-2018 by Dave Coffin, dcoffin a cybercom o net LibRaw uses DCB demosaic code by Jaceck Gozdz distributed under BSD license\nCopyright (C) 2010, Jacek Gozdz (cuniek@kft.umcs.lublin.pl) LibRaw uses Roland Karlsson’s X3F tools source code, licensed under BSD license\nCopyright (c) 2010, Roland Karlsson',
            style: font11,
          ),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
                onTap: () async {
                  if (!await launchUrl(Uri.parse(iconsUrl))) {
                    ErrorDialog.show(context,'Failed to open url.');
                  }
                },
                child: const Text(
                  iconsUrl,
                  style: TextStyle(fontSize: 11, color: Colors.blue),
                )),
          ),
        ],
      ),
    );
  }
}
