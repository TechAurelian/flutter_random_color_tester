// Copyright 2021-2022 TechAurelian (https://techaurelian.com). All rights reserved.
// Use of this source code is governed by an MIT-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

class OptionsContainer extends StatelessWidget {
  const OptionsContainer({
    Key? key,
    this.title,
    this.child,
  }) : super(key: key);

  final String? title;

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    const double pad = 40.0;
    return Column(
      children: [
        if (title != null)
          Padding(
            padding: const EdgeInsets.only(left: pad, right: pad, top: pad),
            child: Text(title!, style: Theme.of(context).textTheme.headline6),
          ),
        if (child != null)
          Container(
            constraints: const BoxConstraints(maxWidth: 600.0),
            padding: const EdgeInsets.all(pad),
            child: child!,
          ),
        Container(color: Theme.of(context).colorScheme.primary, height: 8.0),
      ],
    );
  }
}
