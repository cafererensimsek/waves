import 'package:flutter/cupertino.dart';

class Wave with ChangeNotifier {
  bool _isEditing = false;
  bool _isTitleVisible = false;
  bool _isBittiVisible = false;
  bool _isSlideBarVisible = false;
  String _title = "";
  double _rotation = 0.0;

  final _titleController = TextEditingController();

  bool get isEditing => _isEditing;
  bool get isTitleVisible => _isTitleVisible;
  bool get isBittiVisible => _isBittiVisible;
  bool get isSlideBarVisible => _isSlideBarVisible;
  String get title => _title;
  double get rotation => _rotation;
  TextEditingController get titleController {
    _titleController.addListener(() => _title = _titleController.text);
    return _titleController;
  }

  void toggleEditStatus() {
    _isEditing = !_isEditing;
    notifyListeners();
  }

  void toggleTitleVisibility() {
    _isTitleVisible = !_isTitleVisible;
    notifyListeners();
  }

  void toggleBittiVisibility() {
    _isBittiVisible = !_isBittiVisible;
    notifyListeners();
  }

  void toggleSlideBarVisibility() {
    _isSlideBarVisible = !_isSlideBarVisible;
    notifyListeners();
  }

  void setRotation(double newRotation) {
    _rotation = newRotation;
    notifyListeners();
  }

  void resetRotation() {
    _rotation = 0;
    notifyListeners();
  }
}
