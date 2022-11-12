// Copyright 2021-2022 TechAurelian (https://techaurelian.com). All rights reserved.
// Use of this source code is governed by an MIT-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import 'common/ui_strings.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const FlutterRandomColorTester());
}

class FlutterRandomColorTester extends StatelessWidget {
  const FlutterRandomColorTester({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final Color appPrimaryColor = Colors.grey.shade700;
    const Color appPrimaryColor = Colors.black;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: UIStrings.appName,
      theme: ThemeData(
        brightness: Brightness.light,
        colorScheme: const ColorScheme.light(
          primary: appPrimaryColor,
          onPrimary: Colors.white,
          secondary: appPrimaryColor,
          onSecondary: Colors.white,
        ),
        chipTheme: ChipTheme.of(context).copyWith(
          secondarySelectedColor: appPrimaryColor,
          secondaryLabelStyle: const TextStyle(color: Colors.white),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
