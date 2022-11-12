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
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: const BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          if (title != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Text(title!, style: Theme.of(context).textTheme.headline6),
            ),
          if (child != null) child!,
        ],
      ),
    );
  }
}