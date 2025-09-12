## 0.0.1

- 🎉 Initial release of **image_marker**
- Added `MarkerScreen` widget to display an image and allow interactive marking
- Added `Mark` model with position, type, and focus support
- Added `MarkerController` for programmatic control:
    - `clearMarks()` → remove all marks
    - `saveAll()` → save all existing marks
- Added callbacks:
    - `onMarkAdded` → triggered when a new mark is placed
    - `onMarkFocused` → triggered when an existing mark is focused
- Supports responsive positioning across different screen sizes
- Includes example app demonstrating usage

## 0.0.2

- Bug fixes

## 0.0.3

- User will be able to add a custom image to pin on canvas
- User will be able to show or hide sidebar icons