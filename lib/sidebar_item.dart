/*
 * Created by Abdullah Razzaq on 09/09/2025.
*/
import 'package:flutter/material.dart';

class SideBarItem {
  final int type;
  final IconData? icon;
  final bool isAction;
  final bool isDivider;

  SideBarItem({required this.type, required this.icon, this.isAction = false})
    : isDivider = false;

  SideBarItem.divider({required this.type})
    : icon = null,
      isDivider = true,
      isAction = false;
}
