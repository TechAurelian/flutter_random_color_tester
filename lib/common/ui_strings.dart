// Copyright 2021-2022 TechAurelian (https://techaurelian.com). All rights reserved.
// Use of this source code is governed by an MIT-style license that can be
// found in the LICENSE file.

class UIStrings {
  // -----------------------------------------------------------------------------------------------
  // App
  // -----------------------------------------------------------------------------------------------

  static const String appName = 'Flutter Random Color Tester';

  // -----------------------------------------------------------------------------------------------
  // Home Screen
  // -----------------------------------------------------------------------------------------------

  static const String helpTooltip = 'What is this app?';
  static const String helpUrl = 'https://github.com/TechAurelian/flutter_random_color_tester';

  static const String colorTypeSubtitle = 'Color Type';
  static const String luminositySubtitle = 'Luminosity';

  static const String generateButton = 'GENERATE';

  // -----------------------------------------------------------------------------------------------
  // Colors Screen
  // -----------------------------------------------------------------------------------------------

  static String colorsScreen(int count) => '$count Random Colors';
  static const String copyColorListTooltip = 'Copy newline-delimited color codes to the clipboard';
  static const String colorListCopiedSnackBar = 'Newline-delimited color codes copied to clipboard';

  // -----------------------------------------------------------------------------------------------
  // Color Preview Screen
  // -----------------------------------------------------------------------------------------------

  static const String copyColorTooltip = 'Copy the color code to the clipboard';
  static const String colorCopiedSnackBar = 'Color code copied to clipboard';
}
