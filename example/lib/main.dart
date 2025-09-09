/*
 * Created by Abdullah Razzaq on 09/09/2025.
*/

import 'package:flutter/material.dart';
import 'package:image_marker/mark.dart';
import 'package:image_marker/marker_controller.dart';
import 'package:image_marker/marker_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Image Marker Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ExampleScreen(),
    );
  }
}

class ExampleScreen extends StatelessWidget {
  const ExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = MarkerController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Marker Example'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              controller.clearAllMarks();
            },
          ),
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              controller.saveAllMarks();
            },
          ),
        ],
      ),
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
          controller: controller,
        ),
      ),
    );
  }
}
