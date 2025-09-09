# 📍 image_marker

A Flutter widget that allows users to **add, manage, and interact with marks on images**.  
Perfect for use cases like:

- 🚗 Car accident/scratch reporting
- 🗺 Location or map annotations
- 🏥 Medical image markings
- 📑 Document highlighting

---

## ✨ Features

- Tap to **add marks** at any position on an image
- Pass **custom marks** to display previously saved points
- Get callbacks when marks are **added** or **focused**
- Control marks via a **controller** (e.g., clear all marks, focus marks programmatically)
- Works with **any screen size** thanks to responsive ratio management

---

## 🚀 Installation

Add to your `pubspec.yaml`:
dependencies:
image_marker: ^0.0.1

## Usage
 
import 'package:image_marker/image_marker.dart';
import 'package:flutter/material.dart';

class ExampleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MarkerScreen(
          image: 'your-image-link-here',
          defaultMarks: [
            Mark(position: Offset(161, 209), type: 1),
            Mark(
              position: Offset(151, 255),
              endPosition: Offset(150, 349),
              type: 3,
            ),
            Mark(position: Offset(31, 332), type: 2),
          ],
          onMarkAdded: (mark) {
            print('Mark added: ${mark.position}');
          },
          controller: markerController,
        ),
      ),
    );
  }
}




## 🎮 Controller Example

Use the MarkerController to control marks programmatically:

final controller = MarkerController();

MarkerScreen(
  image: 'https://example.com/car.png',
  controller: controller,
  onMarkAdded: (mark) => print('Added: ${mark.position}'),
);

## 📄 License

This project is licensed under the MIT License. See the LICENSE
file for details.

## 📸 Demo

![Demo Screenshot](https://raw.githubusercontent.com/abdullahrazzaq120/image_marker/main/screenshots/demo.jpg)
