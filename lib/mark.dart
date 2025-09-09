/*
 * Created by Abdullah Razzaq on 10/12/2024.
*/
import 'dart:ui';

import 'package:flutter/material.dart';

class Mark {
  Offset position;
  Offset? endPosition;
  int type;
  bool isFocus;
  List<String>? imagePaths;
  List<String>? imageLinks;
  bool isNew;

  Mark({
    required this.position,
    this.endPosition,
    required this.type,
    this.isFocus = false,
    this.imagePaths,
    this.imageLinks,
    this.isNew = false,
  });

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'x': position.dx,
      'y': position.dy,
      'x1': endPosition?.dx,
      'y1': endPosition?.dy,
      'type': type,
      'isFocus': isFocus,
      'imagePaths': imagePaths,
      'imageLinks': imageLinks,
      'isNew': isNew,
    };
  }

  // Create from JSON
  factory Mark.fromJson(Map<String, dynamic> json) {
    return Mark(
      position: Offset(json['x'], json['y']),
      endPosition: Offset(json['x1'], json['y1']),
      type: json['type'] as int,
      isFocus: json['isFocus'] as bool,
      imagePaths: json['imagePaths'] != null
          ? List<String>.from(json['imagePaths'])
          : null,
      imageLinks: json['imageLinks'] != null
          ? List<String>.from(json['imageLinks'])
          : null,
      isNew: json['isNew'] as bool,
    );
  }

  Mark copyWith({
    Offset? position,
    Offset? endPosition,
    int? type,
    bool? isFocus,
    List<String>? imagePaths,
    List<String>? imageLinks,
    bool? isNew,
  }) {
    return Mark(
      position: position ?? this.position,
      endPosition: endPosition ?? this.endPosition,
      type: type ?? this.type,
      isFocus: isFocus ?? this.isFocus,
      imagePaths: imagePaths ?? this.imagePaths,
      imageLinks: imageLinks ?? this.imageLinks,
      isNew: isNew ?? this.isNew,
    );
  }
}
