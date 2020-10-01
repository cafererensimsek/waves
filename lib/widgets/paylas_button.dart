import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:liner_waves/main.dart';
import 'package:provider/provider.dart';
import 'package:liner_waves/wave_state_provider.dart';

class PaylasButton extends StatelessWidget {
  final GlobalKey screen;
  PaylasButton(this.screen);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: Provider.of<Wave>(context).isPaylasVisible,
      child: FloatingActionButton.extended(
        backgroundColor: Colors.white,
        onPressed: () async {
          Provider.of<Wave>(context, listen: false).opacity = 0.0;
          await Future.delayed(Duration(milliseconds: 20));
          File wave = await Provider.of<Wave>(context, listen: false)
              .createWave(context, screen);
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => LinerScreen(wave: wave),
              ),
              (route) => false);
        },
        label: Text(
          'Paylaş',
          style: TextStyle(color: Colors.blue, fontSize: 20),
        ),
        icon: Icon(
          Icons.arrow_right,
          size: 40,
          color: Colors.blue,
        ),
      ),
    );
  }
}
