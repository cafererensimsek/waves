import 'package:flutter/material.dart';

class PaylasButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
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
    );
  }
}
