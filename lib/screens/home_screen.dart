// Copyright 2021-2022 TechAurelian (https://techaurelian.com). All rights reserved.
// Use of this source code is governed by an MIT-style license that can be
// found in the LICENSE file.

// cSpell:ignore fromRGBO

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_randomcolor/flutter_randomcolor.dart';
import 'package:url_launcher/url_launcher.dart';

import '../common/ui_strings.dart';
import '../widgets/custom_chips.dart';
import '../widgets/options_container.dart';
import 'colors_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _colorCount = 100.0;

  final Set<ColorType> _colorTypeSet = {ColorType.random};

  Luminosity _luminosity = Luminosity.random;

  void _generatePressed() {
    Options options = Options(
      count: _colorCount.toInt(),
      format: Format.rgbArray,
      colorType: _colorTypeSet.toList(),
      luminosity: _luminosity,
    );
    final List rgbColors = RandomColor.getColor(options);
    List<Color> colors =
        rgbColors.map((rgb) => Color.fromRGBO(rgb[0], rgb[1], rgb[2], 1.0)).toList();

    Navigator.push(context, MaterialPageRoute(builder: (context) => ColorsScreen(colors: colors)));
  }

  Future<void> _onHelpPressed() async {
    await launchUrl(Uri.parse(UIStrings.helpUrl), mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        title: const Text(UIStrings.appName),
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline),
            tooltip: UIStrings.helpTooltip,
            onPressed: _onHelpPressed,
          ),
        ],
      ),
      body: _buildOptions(),
    );
  }

  Widget _buildOptions() {
    return ListView(
      children: [
        OptionsContainer(
          child: Column(
            children: [
              Text('${_colorCount.toInt()} color${_colorCount != 1 ? 's' : ''}'),
              Slider(
                min: 1,
                max: 1000,
                value: _colorCount,
                onChanged: (double value) {
                  setState(() => _colorCount = value);
                },
              ),
              const SizedBox(height: 16.0),
              FloatingActionButton.extended(
                icon: const Icon(Icons.color_lens_outlined),
                label: const Text(UIStrings.generateButton),
                onPressed: _generatePressed,
              )
            ],
          ),
        ),
        OptionsContainer(
          title: UIStrings.colorTypeSubtitle,
          child: Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            alignment: WrapAlignment.center,
            children: [
              _buildColorTypeChip(ColorType.random),
              _buildColorTypeChip(ColorType.red),
              _buildColorTypeChip(ColorType.orange),
              _buildColorTypeChip(ColorType.yellow),
              _buildColorTypeChip(ColorType.green),
              _buildColorTypeChip(ColorType.blue),
              _buildColorTypeChip(ColorType.purple),
              _buildColorTypeChip(ColorType.pink),
              _buildColorTypeChip(ColorType.monochrome),
            ],
          ),
        ),
        OptionsContainer(
          title: UIStrings.luminositySubtitle,
          child: Wrap(
            alignment: WrapAlignment.spaceBetween,
            children: [
              _buildLuminosityChip(Luminosity.random),
              _buildLuminosityChip(Luminosity.bright),
              _buildLuminosityChip(Luminosity.light),
              _buildLuminosityChip(Luminosity.dark),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildColorTypeChip(ColorType colorType) {
    return ColorFilterChip(
      color: _colorTypeColors[colorType]!,
      label: describeEnum(colorType),
      selected: _colorTypeSet.contains(colorType),
      onSelected: (bool value) {
        setState(() {
          if (value) {
            _colorTypeSet.add(colorType);
          } else {
            _colorTypeSet.remove(colorType);
          }
        });
      },
    );
  }

  Widget _buildLuminosityChip(Luminosity luminosity) {
    return ChoiceChip(
      label: Text(describeEnum(luminosity)),
      selected: _luminosity == luminosity,
      onSelected: (bool selected) {
        if (selected) {
          setState(() {
            _luminosity = luminosity;
          });
        }
      },
    );
  }

  final Map<ColorType, Color> _colorTypeColors = {
    ColorType.random: Colors.teal,
    ColorType.red: Colors.red,
    ColorType.orange: Colors.orange,
    ColorType.yellow: Colors.yellow,
    ColorType.green: Colors.green,
    ColorType.blue: Colors.blue,
    ColorType.purple: Colors.purple,
    ColorType.pink: Colors.pink,
    ColorType.monochrome: Colors.grey,
  };
}
