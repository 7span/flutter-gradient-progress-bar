import 'dart:math';

import 'package:flutter/material.dart';

/// A widget that displays a colorful circular progress indicator.
class ColorfulCircularProgressIndicator extends StatefulWidget {
  /// The width of the line used to draw the circle.
  final double strokeWidth;

  /// List of colors for circular progress indicator.
  final List<Color> colors;

  /// Setting the width of circular progress indicator.
  final double indicatorWidth;

  /// Setting the height of circular progress indicator.
  final double indicatorHeight;

  /// Creates a [ColorfulCircularProgressIndicator].
  const ColorfulCircularProgressIndicator(
      {super.key,
      this.strokeWidth = 5.0,
      required this.colors,
      this.indicatorHeight = 40.0,
      this.indicatorWidth = 40.0});

  @override
  ColorfulCircularProgressIndicatorState createState() =>
      ColorfulCircularProgressIndicatorState();
}

/// A widget that displays a colorful circular progress indicator.
class ColorfulCircularProgressIndicatorState
    extends State<ColorfulCircularProgressIndicator>
    with TickerProviderStateMixin {
  /// animation controller for first animation.
  late AnimationController firstAnimationController;

  /// defines start angle in draw arc.
  late Animation<double> firstAnimation;

  /// animation controller for second animation.
  late AnimationController secondAnimationController;

  /// defines sweep angle in draw arc.
  late Animation<double> secondAnimation;

  /// random number generator.
  Random rd = Random();

  /// random color id.
  int randomColorId = 0;

  /// helper id for color changes.
  int helpId = 0;

  /// helper id for loop.
  int loopHelperId = 0;

  @override
  void initState() {
    super.initState();
    initAnimation();
    firstAnimationController.forward();
    secondAnimationController.forward();
  }

  @override
  void dispose() {
    firstAnimationController.dispose();
    secondAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.indicatorHeight,
      width: widget.indicatorWidth,
      child: CustomPaint(
        painter: MyCustomPainter(
            startAngle: firstAnimation.value,
            sweepAngle: secondAnimation.value,
            listColors: widget.colors,
            currentIndex: randomColorId,
            customStrokeWidth: widget.strokeWidth),
      ),
    );
  }

  /// Switches the colors in the list.
  void switchColors() {
    if (widget.colors.isNotEmpty) {
      final listSize = widget.colors.length;
      if (listSize == 1) {
      } else {
        if (loopHelperId > listSize - 1) {
          loopHelperId = 0;
          randomColorId = loopHelperId;
        } else {
          if (loopHelperId == 0) {
            loopHelperId++;
          }
          randomColorId = loopHelperId;
          if (loopHelperId > 0) {
            loopHelperId++;
          }
        }
      }
    }
  }

  /// Changes the color of the circular progress indicator.
  void doColorChanges() {
    if (helpId <= 100) {
      helpId++;
      if (helpId == 100) {
        switchColors();
      }
      if (helpId > 100) {
        helpId = 0;
      }
    }
  }

  /// Initializes the animation controllers and animations.
  void initAnimation() {
    firstAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    firstAnimation =
        Tween<double>(begin: -pi, end: pi).animate(firstAnimationController)
          ..addListener(() {
            setState(() {
              doColorChanges();
            });
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              firstAnimationController.repeat();
            } else if (status == AnimationStatus.dismissed) {
              firstAnimationController.forward();
            }
          });

    secondAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1300),
    );
    secondAnimation = Tween<double>(begin: -1, end: -6).animate(CurvedAnimation(
        parent: secondAnimationController, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {
          /*doColorChanges();*/
        });
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          secondAnimationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          secondAnimationController.forward();
        }
      });
  }
}

/// A custom painter that draws a circular progress indicator.
class MyCustomPainter extends CustomPainter {
  /// The start angle of the arc.
  final double startAngle;

  /// The sweep angle of the arc.
  final double sweepAngle;

  /// The list of colors for the arc.
  final List<Color> listColors;

  /// The current index of the color in the list.
  final int currentIndex;

  /// The stroke width of the arc.
  final double customStrokeWidth;

  /// Creates a [MyCustomPainter].
  MyCustomPainter(
      {required this.startAngle,
      required this.sweepAngle,
      required this.listColors,
      required this.currentIndex,
      required this.customStrokeWidth});

  @override
  void paint(Canvas canvas, Size size) {
    Paint myCircle = Paint()
      ..color = Colors.transparent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    canvas.drawCircle(
      Offset(size.width * .5, size.height * .5),
      size.width * .3,
      myCircle,
    );

    Paint myArc = Paint()
      ..color = listColors[currentIndex]
      ..style = PaintingStyle.stroke
      ..strokeWidth = customStrokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromLTRB(0, 0, size.width, size.height),
      startAngle,
      sweepAngle,
      false,
      myArc,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
