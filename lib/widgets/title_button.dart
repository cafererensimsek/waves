import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../wave_state_provider.dart';

class TitleButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String title = Provider.of<Wave>(context).title;
    bool isTitleVisible = Provider.of<Wave>(context).isTitleVisible;
    return Visibility(
      visible: isTitleVisible,
      child: FlatButton(
        child: Text(
          title,
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        onPressed: () {
          // enable editing and disable sharing again
          Provider.of<Wave>(context, listen: false).toggleTitleVisibility();
          Provider.of<Wave>(context, listen: false).toggleSlideBarVisibility();
          Provider.of<Wave>(context, listen: false).toggleBittiVisibility();
          Provider.of<Wave>(context, listen: false).opacity = 0.0;
        },
      ),
    );
  }
}
