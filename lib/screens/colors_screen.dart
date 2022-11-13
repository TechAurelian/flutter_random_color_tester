// Copyright 2021-2022 TechAurelian (https://techaurelian.com). All rights reserved.
// Use of this source code is governed by an MIT-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import '../common/ui_strings.dart';
import '../utils/utils.dart' as utils;
import '../widgets/color_list_item.dart';
import 'color_preview_screen.dart';

class ColorsScreen extends StatelessWidget {
  const ColorsScreen({
    Key? key,
    required this.colors,
  }) : super(key: key);

  /// The list of randomly generated colors to display.
  final List<Color> colors;

  /// Copies the color list to the clipboard.
  ///
  /// The color list is copied as a newline-separated list of hexadecimal color codes.
  Future<void> _onCopyPressed(BuildContext context) async {
    final String listAsString = colors.map(utils.colorToHex).join('\n');
    await utils.copyToClipboard(context, listAsString, UIStrings.colorListCopiedSnackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(UIStrings.colorsScreen(colors.length)),
        actions: [
          IconButton(
            icon: const Icon(Icons.content_copy),
            tooltip: UIStrings.copyColorListTooltip,
            onPressed: () => _onCopyPressed(context),
          ),
        ],
      ),
      body: _buildColorListView(context),
    );
  }

  Widget _buildColorListView(BuildContext context) {
    return ListView.separated(
      itemCount: colors.length,
      itemBuilder: (BuildContext context, int index) {
        final Color color = colors[index];
        return ColorListItem(
          index: index + 1,
          color: color,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ColorPreviewScreen(color: color)),
            );
          },
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Container(color: Theme.of(context).colorScheme.primary, height: 8.0);
      },
    );
  }
}
