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
    final double hPadding = MediaQuery.of(context).size.width / 10;
    return Container(
      color: Colors.black12,
      child: Column(
        children: [
          if (title != null)
            Padding(
              padding: EdgeInsets.only(left: hPadding, right: hPadding, top: 32.0),
              child: Text(title!, style: Theme.of(context).textTheme.headline6),
            ),
          if (child != null)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: hPadding, vertical: 32.0),
              child: child!,
            ),
          Divider(color: Theme.of(context).colorScheme.primary, thickness: 8.0, height: 8.0),
        ],
      ),
    );
  }
}
