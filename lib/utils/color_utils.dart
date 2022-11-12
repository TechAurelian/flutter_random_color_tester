// Copyright 2021-2022 TechAurelian (https://techaurelian.com). All rights reserved.
// Use of this source code is governed by an MIT-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

class ColorUtils {
  /// Returns the hexadecimal string representation of the given [Color].
  static String toHex(Color color) =>
      '#${(color.value & 0xFFFFFF).toRadixString(16).padLeft(6, '0').toUpperCase()}';

  /// Returns the black or white contrast color of the given [Color].
  static Color contrastColor(Color color) =>
      ThemeData.estimateBrightnessForColor(color) == Brightness.dark ? Colors.white : Colors.black;
}
