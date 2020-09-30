import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../wave_state_provider.dart';

class ContentBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isEditing = Provider.of<Wave>(context).isEditing;
    double rotation = Provider.of<Wave>(context).rotation;
    return AnimatedOpacity(
      opacity: isEditing ? 1.0 : 0.0,
      duration: Duration(milliseconds: 300),
      child: InteractiveViewer(
        transformationController: TransformationController(),
        maxScale: 10,
        minScale: 0.1,
        boundaryMargin: EdgeInsets.all(double.infinity),
        child: Align(
          child: Transform.rotate(
            angle: rotation,
            child: Container(
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: TextField(
                textAlign: TextAlign.center,
                minLines: 1,
                maxLines: 300,
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
