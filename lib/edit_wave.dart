import 'dart:io';
import 'package:flutter/material.dart';
import 'package:liner_waves/wave_state_provider.dart';
import 'package:provider/provider.dart';

import 'widgets/bitti_buton.dart';
import 'widgets/content_box.dart';
import 'widgets/paylas_button.dart';
import 'widgets/rotation_bar.dart';
import 'widgets/title_box.dart';
import 'widgets/title_button.dart';
import 'widgets/wave_button.dart';

class EditWave extends StatefulWidget {
  final File wavePhoto;

  const EditWave(this.wavePhoto);

  @override
  EditWaveState createState() => EditWaveState();
}

class EditWaveState extends State<EditWave> {
  @override
  Widget build(BuildContext context) {
    bool isEditing = Provider.of<Wave>(context).isEditing;
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      floatingActionButton: PaylasButton(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        centerTitle: !isEditing,
        title: !isEditing ? WaveButton() : TitleButton(),
        actions: [BittiButton()],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Center(
                child: Image.file(widget.wavePhoto),
              ),
              TitleBox(context),
              ContentBox(),
              RotationBar(),
            ],
          ),
        ),
      ),
    );
  }
}
