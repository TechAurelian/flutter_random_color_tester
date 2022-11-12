// Copyright 2021-2022 TechAurelian (https://techaurelian.com). All rights reserved.
// Use of this source code is governed by an MIT-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import '../common/ui_strings.dart';
import '../widgets/color_list_item.dart';
import 'color_preview_screen.dart';

class ColorsScreen extends StatelessWidget {
  const ColorsScreen({
    Key? key,
    required this.colors,
  }) : super(key: key);

  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(UIStrings.colorsScreen(colors.length)),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
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
        return Divider(
          color: Theme.of(context).colorScheme.primary,
          thickness: 8.0,
          height: 8.0,
        );
      },
    );
  }
}
