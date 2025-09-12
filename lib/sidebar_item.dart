/*
 * Created by Abdullah Razzaq on 09/09/2025.
*/
import 'package:flutter/material.dart';

class SideBarItem {
  final int? type;
  final IconData? icon;
  final String? customCanvasIcon;
  final bool isAction;
  final bool isScratch;

  SideBarItem({
    this.type,
    this.icon,
    this.customCanvasIcon,
    this.isAction = false,
    this.isScratch = false,
  });

  SideBarItem.scratch()
    : type = null,
      icon = null,
      customCanvasIcon = null,
      isScratch = true,
      isAction = false;

  SideBarItem copyWith({
    int? type,
    IconData? icon,
    String? customCanvasIcon,
    bool? isScratch,
    bool? isAction,
  }) {
    return SideBarItem(
      type: type ?? this.type,
      icon: icon ?? this.icon,
      customCanvasIcon: customCanvasIcon ?? this.customCanvasIcon,
      isAction: isAction ?? this.isAction,
      isScratch: isScratch ?? this.isScratch,
    );
  }
}
