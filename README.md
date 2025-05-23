# Flutter Progress Indicators Package

![Pub Version](https://img.shields.io/badge/pub-v0.0.2-blue) ![Flutter Version](https://img.shields.io/badge/flutter-v3.3.1-blue) ![Dart Version](https://img.shields.io/badge/dart-v2.18.0-blue)

A comprehensive Flutter package for both Android and iOS that provides beautiful, customizable progress indicators with gradient and colorful circular designs.

## Features

- **Colorful Circular Progress Indicator**: Multi-colored circular progress indicator with smooth animations
- **Gradient Progress Bar**: Linear progress bar with customizable gradient colors
- Cross-platform support (Android & iOS)
- Smooth animations and transitions
- Highly customizable color schemes

## Screenshots

### Progress Indicator
![Screen_Recording_20250523-120831](https://github.com/user-attachments/assets/eb2edcc3-fb65-44fb-834d-150d32a14fa1)

## Installation

Add the dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter:
    sdk: flutter
  colorful_circular_progress_indicator: ^0.0.2
  gradient_progress_bar: ^latest_version
```

## Usage

### Colorful Circular Progress Indicator

```dart
import 'package:colorful_circular_progress_indicator/colorful_circular_progress_indicator.dart';

class CircularProgressExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ColorfulCircularProgressIndicator(
          colors: [
            Colors.red,
            Colors.orange,
            Colors.yellow,
            Colors.green,
            Colors.blue,
            Colors.indigo,
            Colors.purple,
          ],
          strokeWidth: 8.0,
          radius: 50.0,
          progress: 0.7,
        ),
      ),
    );
  }
}
```

### Gradient Progress Bar

```dart
import 'package:gradient_progress_bar/gradient_progress_bar.dart';

class GradientProgressExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            GradientProgressIndicator([
              Color(0xffF68270),
              Color(0xffF1C358),
              Color(0xffEFDE62),
              Color(0xffE5F3BE),
              Color(0xffCDE8F1),
              Color(0xffDDC5EE),
              Color(0xffF2E0F9),
            ], 0.8)
          ],
        ),
      ),
    );
  }
}
```

### Complete Example

```dart
import 'package:flutter/material.dart';
import 'package:colorful_circular_progress_indicator/colorful_circular_progress_indicator.dart';
import 'package:gradient_progress_bar/gradient_progress_bar.dart';

class ProgressIndicatorsDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Progress Indicators Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Colorful Circular Progress Indicator
            ColorfulCircularProgressIndicator(
              colors: [
                Colors.red,
                Colors.orange,
                Colors.yellow,
                Colors.green,
                Colors.blue,
                Colors.indigo,
                Colors.purple,
              ],
              strokeWidth: 8.0,
              radius: 50.0,
              progress: 0.7,
            ),
            
            // Gradient Progress Bar
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: GradientProgressIndicator([
                Color(0xffF68270),
                Color(0xffF1C358),
                Color(0xffEFDE62),
                Color(0xffE5F3BE),
                Color(0xffCDE8F1),
                Color(0xffDDC5EE),
                Color(0xffF2E0F9),
              ], 0.8),
            ),
          ],
        ),
      ),
    );
  }
}
```

## API Reference

### ColorfulCircularProgressIndicator

| Parameter | Type | Description | Default |
|-----------|------|-------------|---------|
| `colors` | `List<Color>` | List of colors for the progress indicator | Required |
| `strokeWidth` | `double` | Width of the progress stroke | `4.0` |
| `radius` | `double` | Radius of the circular indicator | `20.0` |
| `progress` | `double` | Progress value (0.0 to 1.0) | `0.0` |

### GradientProgressIndicator

| Parameter | Type | Description | Default |
|-----------|------|-------------|---------|
| `colors` | `List<Color>` | List of gradient colors | Required |
| `progress` | `double` | Progress value (0.0 to 1.0) | Required |
| `height` | `double` | Height of the progress bar | `8.0` |
| `borderRadius` | `double` | Border radius of the progress bar | `4.0` |

## Examples

For more detailed examples, check out:
- [Progress Example](https://github.com/urvashik-7span/gradient_progress_bar/tree/main/example)

## Contributors

### Gradient Progress Bar
**[Urvashi Kharecha](https://www.linkedin.com/in/urvashi-kharecha/)**
<a href="https://www.linkedin.com/in/urvashi-kharecha-23a544114/" target="blank"><img align="center" src="https://raw.githubusercontent.com/rahuldkjain/github-profile-readme-generator/master/src/images/icons/Social/linked-in-alt.svg" alt="linedin_logo" height="18" width="28" /></a>

### Colorful Circular Progress Indicator
**[Ruchit Soni](https://www.linkedin.com/in/ruchit-soni/)**
<a href="https://www.linkedin.com/in/ruchit-soni-3741191b2/" target="blank"><img align="center" src="https://raw.githubusercontent.com/rahuldkjain/github-profile-readme-generator/master/src/images/icons/Social/linked-in-alt.svg" alt="linedin_logo" height="18" width="28" /></a>

## Issues & Support

Having issues? File them here:
- [Issues](https://github.com/urvashi-k-7span/gradient_progress_bar/issues)

## Contributing

**🤘🏻 Great!** We welcome contributions to both packages.

### For Progress Bar:
1. Fork the [Repository](https://github.com/urvashi-k-7span/gradient_progress_bar)
2. Update Code
3. Write a meaningful Commit Message
4. Send a PR

That's all you need to contribute!

## License

This project is licensed under the MIT License - see the individual package repositories for details.

## Changelog

See [CHANGELOG.md](CHANGELOG.md) for details about changes in each version.

---

**Made with ❤️ by the Flutter community**
