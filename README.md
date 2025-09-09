# image_marker

A Flutter widget that allows users to add, manage, and interact with marks on images. Useful for car
inspections, medical images, maps, and more.

## Features

- Add marks by tapping on the image
- Focus on existing marks
- Delete all marks (using controller)
- Custom mark types

## Usage

```dart
           MarkerScreen(
              image: 'https://app.speedautosystems.com/app/images/suv_exterior.jpg',
              defaultMarks: [
                Mark(position: Offset(161, 209), type: 1),
                Mark(
                  position: Offset(151, 255),
                  endPosition: Offset(150, 349),
                  type: 3,
                ),
                Mark(position: Offset(31, 332), type: 2),
              ],
              onMarkAdded: (mark){
                print('Mark added: ${mark.position}');
              },
              controller: markerController,
            ),
