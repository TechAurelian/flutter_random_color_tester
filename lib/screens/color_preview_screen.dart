// Copyright 2021-2022 TechAurelian (https://techaurelian.com). All rights reserved.
// Use of this source code is governed by an MIT-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import '../common/ui_strings.dart';
import '../utils/utils.dart' as utils;

class ColorPreviewScreen extends StatelessWidget {
  const ColorPreviewScreen({
    Key? key,
    required this.color,
  }) : super(key: key);

  final Color color;

  /// Copies the hexadecimal color code to the clipboard.
  Future<void> _onCopyPressed(BuildContext context) async {
    await utils.copyToClipboard(context, utils.colorToHex(color), UIStrings.colorCopiedSnackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        title: Text(utils.colorToHex(color)),
        actions: [
          IconButton(
            icon: const Icon(Icons.content_copy),
            tooltip: UIStrings.copyColorTooltip,
            onPressed: () => _onCopyPressed(context),
          ),
        ],
      ),
    );
  }
}
