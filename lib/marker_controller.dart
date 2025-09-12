/*
 * Created by Abdullah Razzaq on 08/09/2025.
*/

import 'package:flutter/material.dart';

class MarkerController {
  VoidCallback? _clearAllNewMarksCallback;
  VoidCallback? _saveAllMarksCallback;

  void bind({VoidCallback? clearMarks, VoidCallback? saveAllMarks}) {
    _clearAllNewMarksCallback = clearMarks;
    _saveAllMarksCallback = saveAllMarks;
  }

  void clearAllMarks() {
    _clearAllNewMarksCallback?.call();
  }

  void saveAllMarks() {
    _saveAllMarksCallback?.call();
  }

  void dispose() {
    _clearAllNewMarksCallback = null;
    _saveAllMarksCallback = null;
  }
}
