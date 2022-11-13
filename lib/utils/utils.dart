// Copyright 2021-2022 TechAurelian (https://techaurelian.com). All rights reserved.
// Use of this source code is governed by an MIT-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Returns the hexadecimal string representation of the given [Color].
String colorToHex(Color color) =>
    '#${(color.value & 0xFFFFFF).toRadixString(16).padLeft(6, '0').toUpperCase()}';

/// Returns the black or white contrast color of the given [Color].
Color contrastColor(Color color) =>
    ThemeData.estimateBrightnessForColor(color) == Brightness.dark ? Colors.white : Colors.black;

/// Copies the given [text] to the clipboard.
Future<void> copyToClipboard(BuildContext context, String text, String feedback) async {
  final ScaffoldMessengerState messengerState = ScaffoldMessenger.of(context);
  await Clipboard.setData(ClipboardData(text: text));
  messengerState.showSnackBar(SnackBar(content: Text(feedback)));
}
