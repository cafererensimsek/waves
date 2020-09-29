import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';

class EditWave extends StatefulWidget {
  final File wavePhoto;

  const EditWave(this.wavePhoto);

  @override
  _EditWaveState createState() => _EditWaveState();
}

class _EditWaveState extends State<EditWave> {
  bool _isEditing = false;
  bool _isTitleVisible = true;
  String _title;
  double _rotation = 1.0;
  final titleController = TextEditingController();
  final transformationController = TransformationController();

  _changeTitle() {
    setState(() => _title = titleController.text);
  }

  @override
  void initState() {
    super.initState();
    titleController.addListener(_changeTitle);
  }

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.white,
        onPressed: () {},
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
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        centerTitle: !_isEditing,
        title: !_isEditing
            ? IconButton(
                icon: Icon(Icons.waves, size: 30),
                onPressed: () => setState(() => _isEditing = !_isEditing),
              )
            : _title == null
                ? IconButton(
                    icon: Icon(Icons.restore_outlined, color: Colors.white),
                    onPressed: () => setState(() => _isEditing = !_isEditing),
                  )
                : FlatButton(
                    child: Text(_title, style: TextStyle(color: Colors.white)),
                    onPressed: () => setState(() {
                      _isEditing = !_isEditing;
                      _isTitleVisible = true;
                    }),
                  ),
        actions: [
          Visibility(
            visible: _isEditing,
            child: FlatButton(
              onPressed: () => setState(() {
                _isTitleVisible = false;
                FocusScopeNode currentFocus = FocusScope.of(context);
                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
              }),
              child: Text(
                'Bitti',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Center(
                child: Image.file(
                  widget.wavePhoto,
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 3,
                left: (MediaQuery.of(context).size.width - 150) / 2,
                child: Visibility(
                  visible: _isEditing && _isTitleVisible,
                  child: Container(
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    child: TextField(
                      autofocus: true,
                      controller: titleController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: _isEditing,
                child: InteractiveViewer(
                  transformationController: transformationController,
                  maxScale: 10,
                  minScale: 0.1,
                  boundaryMargin: EdgeInsets.all(double.infinity),
                  child: Align(
                    child: Transform.rotate(
                      angle: 180 / (_rotation * 10),
                      child: Container(
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                        child: TextField(
                          textAlign: TextAlign.center,
                          minLines: 1,
                          maxLines: 100,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Visibility(
                  visible: _isEditing,
                  child: Slider(
                    label: 'Rotasyon',
                    value: _rotation,
                    min: 1.0,
                    max: 18.0,
                    onChanged: (newValue) => setState(() {
                      _rotation = newValue;
                      print(_rotation);
                    }),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
