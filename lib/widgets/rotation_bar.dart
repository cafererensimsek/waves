import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../wave_state_provider.dart';

class RotationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isEditing = Provider.of<Wave>(context).isEditing;
    bool isSlideBarVisible = Provider.of<Wave>(context).isSlideBarVisible;
    double rotation = Provider.of<Wave>(context).rotation;
    return Visibility(
      visible: isEditing && isSlideBarVisible,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white.withOpacity(0.5),
        ),
        width: 150,
        child: Slider(
          value: rotation,
          label: 'Döndür',
          min: 0.0,
          max: 2 * pi,
          onChanged: (newValue) =>
              Provider.of<Wave>(context, listen: false).setRotation(newValue),
        ),
      ),
    );
  }
}
