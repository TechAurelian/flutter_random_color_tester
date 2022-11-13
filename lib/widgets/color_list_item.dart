// Copyright 2021-2022 TechAurelian (https://techaurelian.com). All rights reserved.
// Use of this source code is governed by an MIT-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import '../utils/utils.dart' as utils;

class ColorListItem extends StatelessWidget {
  const ColorListItem({
    Key? key,
    required this.index,
    required this.color,
    this.onTap,
  }) : super(key: key);

  final int index;

  final Color color;

  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final Color contrastColor = utils.contrastColor(color);

    return Padding(
      padding: EdgeInsets.zero,
      child: ListTile(
        contentPadding: const EdgeInsets.all(64.0),
        tileColor: color,
        title: Text(
          index.toString(),
          style: Theme.of(context).textTheme.overline!.copyWith(
                color: contrastColor.withOpacity(0.5),
              ),
        ),
        subtitle: Text(
          utils.colorToHex(color),
          style: Theme.of(context).textTheme.titleLarge!.copyWith(color: contrastColor),
        ),
        onTap: onTap,
      ),
    );
  }
}
