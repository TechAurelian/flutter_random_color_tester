// Copyright 2021-2022 TechAurelian (https://techaurelian.com). All rights reserved.
// Use of this source code is governed by an MIT-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import '../utils/utils.dart' as utils;

class ColorFilterChip extends StatelessWidget {
  const ColorFilterChip({
    Key? key,
    required this.color,
    required this.label,
    this.selected = false,
    required this.onSelected,
  }) : super(key: key);

  final Color color;

  final String label;

  final bool selected;

  final ValueChanged<bool>? onSelected;

  @override
  Widget build(BuildContext context) {
    final Color contrastColor = utils.contrastColor(color);

    return FilterChip(
      visualDensity: VisualDensity.compact,
      showCheckmark: false,
      avatar: CircleAvatar(
        backgroundColor: Colors.white,
        child: selected
            ? const Icon(Icons.check_rounded, color: Colors.black, size: 20.0)
            : const SizedBox.shrink(),
      ),
      backgroundColor: color,
      selectedColor: color,
      shape: StadiumBorder(side: BorderSide(color: color, width: 2.0)),
      label: Text(
        label,
        style: Theme.of(context).textTheme.caption!.copyWith(color: contrastColor),
      ),
      selected: selected,
      onSelected: onSelected,
    );
  }
}
