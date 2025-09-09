/*
 * Created by Abdullah Razzaq on 09/09/2025.
*/
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';

import 'mark.dart';

class MarkImagesWidget extends StatelessWidget {
  Mark? globalFocusedMark;
  final Function(List<String>)? onMarkImagesClick;

  MarkImagesWidget({super.key, this.globalFocusedMark, this.onMarkImagesClick});

  @override
  Widget build(BuildContext context) {
    return  Positioned(
      left: globalFocusedMark!.position.dx + 5,
      // Adjust as needed for alignment
      top: globalFocusedMark!.position.dy - 5,
      // Popup above the mark
      child: Material(
        color: Colors.transparent,
        child: Container(
          // Calculate width based on the number of images.
          width: min((globalFocusedMark!.imagePaths!.length * 54.0) + 2.0, 164),
          padding: const EdgeInsets.all(1.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.black12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: GestureDetector(
            onTap: () {
              if (onMarkImagesClick != null) {
                onMarkImagesClick!(globalFocusedMark!.imagePaths!);
              }
            },
            child: SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: globalFocusedMark!.imagePaths!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: Image.file(
                      File(globalFocusedMark!.imagePaths![index]),
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
