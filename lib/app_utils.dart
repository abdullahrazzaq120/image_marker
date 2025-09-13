/*
 * Created by Abdullah Razzaq on 25/12/2024.
*/
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_marker/sidebar_icons_enum.dart';
import 'package:image_marker/sidebar_item.dart';
import 'dart:ui' as ui;
import 'mark.dart';

class AppUtils {
  static const double _markRadius = 20.0;

  static Offset getClosestPointForLine(Offset tap, Offset start, Offset end) {
    // Calculate the shortest distance from the tap to the line segment
    double dx = end.dx - start.dx;
    double dy = end.dy - start.dy;

    // If the line is just a point
    if (dx == 0 && dy == 0) {
      return start;
    }

    // Calculate the parameter t
    double t =
        ((tap.dx - start.dx) * dx + (tap.dy - start.dy) * dy) /
        (dx * dx + dy * dy);

    // Clamp t to the range [0, 1]
    t = t.clamp(0.0, 1.0);

    // Find the closest point on the line segment
    Offset closestPoint = Offset(start.dx + t * dx, start.dy + t * dy);

    // Check the distance from the tap to the closest point
    return closestPoint;
  }

  static Mark? getMarkIfExist(List<Mark> marks, Offset tapPosition) {
    try {
      final Mark focusedMark = marks.firstWhere((mark) {
        if (mark.type == 3) {
          final Offset closestPoint = AppUtils.getClosestPointForLine(
            tapPosition,
            mark.position,
            mark.endPosition!,
          );
          return (tapPosition - closestPoint).distance <= _markRadius;
        }
        return isMarkPositionNear(mark.position, tapPosition);
      });

      return focusedMark;
    } catch (e) {
      return null;
    }
  }

  static bool isMarkPositionNear(Offset targetedPosition, Offset tapPosition) {
    return (targetedPosition - tapPosition).distance <= _markRadius;
  }

  static Future<ui.Image> getImageDimensions(String image) async {
    final Completer<ui.Image> completer = Completer();
    ImageStream imageStream;

    if (image.startsWith('http') || image.startsWith('https')) {
      // It's a network image
      imageStream = NetworkImage(image).resolve(const ImageConfiguration());
    } else {
      // It's an asset image
      imageStream = AssetImage(image).resolve(const ImageConfiguration());
    }

    final listener = ImageStreamListener((ImageInfo info, bool _) {
      completer.complete(info.image);
    });

    imageStream.addListener(listener);

    // It's good practice to remove the listener when the future completes
    // to avoid memory leaks, especially if the completer can complete with an error.
    completer.future.whenComplete(() => imageStream.removeListener(listener));

    return completer.future;
  }

  // configuration for sidebar items
  static final Map<SidebarIconsEnum, SideBarItem> allSidebarItems = {
    SidebarIconsEnum.filledCircle: SideBarItem(icon: Icons.circle),
    SidebarIconsEnum.circle: SideBarItem(
      icon: Icons.radio_button_unchecked_rounded,
    ),
    SidebarIconsEnum.cross: SideBarItem(icon: Icons.close_sharp),
    SidebarIconsEnum.scratchLine: SideBarItem.scratch(),
    SidebarIconsEnum.delete: SideBarItem(icon: Icons.delete, isAction: true),
    SidebarIconsEnum.camera: SideBarItem(
      icon: Icons.camera_alt,
      isAction: true,
    ),
    SidebarIconsEnum.customIcon: SideBarItem(customCanvasIcon: ''),
  };

  static List<SideBarItem> getSidebarItems(
      {
    List<SidebarIconsEnum>? iconsEnums,
    String? customCanvasIcon,
  }) {
    final enums = iconsEnums ?? SidebarIconsEnum.values;
    return enums.map((e) {
      if (e == SidebarIconsEnum.customIcon && customCanvasIcon != null) {
        return SideBarItem(customCanvasIcon: customCanvasIcon, type: e.index);
      }
      final baseItem = allSidebarItems[e]!;
      return baseItem.copyWith(type: e.index); // auto-assign type
    }).toList();
  }

  // Utility to load an asset image into a ui.Image
  static Future<ui.Image> loadUiImage(String assetPath) async {
    final data = await rootBundle.load(assetPath);
    final codec = await ui.instantiateImageCodec(data.buffer.asUint8List());
    final frame = await codec.getNextFrame();
    return frame.image;
  }
}
