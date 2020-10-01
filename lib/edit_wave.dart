import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:liner_waves/wave_state_provider.dart';
import 'package:provider/provider.dart';

import 'widgets/bitti_buton.dart';
import 'widgets/content_box.dart';
import 'widgets/paylas_button.dart';
import 'widgets/rotation_bar.dart';
import 'widgets/title_box.dart';
import 'widgets/title_button.dart';
import 'widgets/wave_button.dart';

class EditWave extends StatelessWidget {
  final File wavePhoto;

  const EditWave(this.wavePhoto);

  static GlobalKey screen = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    bool isEditing = Provider.of<Wave>(context).isEditing;
    return RepaintBoundary(
      key: screen,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: FileImage(wavePhoto),
            fit: BoxFit.fill,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          floatingActionButton: PaylasButton(screen),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            iconTheme: IconThemeData(color: Colors.white),
            backgroundColor: Colors.transparent,
            centerTitle: !isEditing,
            title: !isEditing ? WaveButton() : TitleButton(),
            actions: [BittiButton()],
          ),
          body: LayoutBuilder(
            builder: (context, constraints) => SingleChildScrollView(
              child: Container(
                height: constraints.maxHeight,
                child: Stack(
                  children: [
                    Positioned(
                      top: constraints.maxHeight / 3,
                      left: (constraints.maxWidth - 150) / 2,
                      child: TitleBox(),
                    ),
                    ContentBox(constraints.maxWidth, constraints.maxHeight),
                    Positioned(
                      bottom: constraints.maxHeight / 6,
                      child: RotationBar(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
