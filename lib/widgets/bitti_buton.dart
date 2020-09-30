import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../wave_state_provider.dart';

class BittiButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isEditing = Provider.of<Wave>(context).isEditing;

    bool isBittiVisible = Provider.of<Wave>(context).isBittiVisible;
    return Visibility(
      visible: isEditing && isBittiVisible,
      child: FlatButton(
        onPressed: () {
          Provider.of<Wave>(context, listen: false).toggleBittiVisibility();
          Provider.of<Wave>(context, listen: false).toggleTitleVisibility();
          Provider.of<Wave>(context, listen: false).toggleSlideBarVisibility();

          FocusScope.of(context).unfocus();
        },
        child: Text(
          'Bitti',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
