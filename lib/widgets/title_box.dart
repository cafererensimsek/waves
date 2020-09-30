import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../wave_state_provider.dart';

class TitleBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: Provider.of<Wave>(context).isEditing &&
          !Provider.of<Wave>(context).isTitleVisible,
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
    );
  }
}
