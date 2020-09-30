import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../wave_state_provider.dart';

class TitleBox extends StatelessWidget {
  const TitleBox(this.ctx);

  final BuildContext ctx;

  @override
  Widget build(BuildContext context) {
    bool isEditing = Provider.of<Wave>(context).isEditing;
    bool isTitleVisible = Provider.of<Wave>(context).isTitleVisible;
    return Positioned(
      top: MediaQuery.of(ctx).size.height / 3,
      left: (MediaQuery.of(ctx).size.width - 150) / 2,
      child: AnimatedOpacity(
        opacity: isEditing && !isTitleVisible ? 1.0 : 0.0,
        duration: Duration(milliseconds: 300),
        child: Container(
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          child: TextField(
            autofocus: true,
            controller: Provider.of<Wave>(context).titleController,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}
