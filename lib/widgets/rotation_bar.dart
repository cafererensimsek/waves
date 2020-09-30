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
    return Positioned(
      bottom: 18,
      left: 25,
      child: AnimatedOpacity(
        opacity: isEditing && isSlideBarVisible ? 1.0 : 0.0,
        duration: Duration(milliseconds: 300),
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
      ),
    );
  }
}
