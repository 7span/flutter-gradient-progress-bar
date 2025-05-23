library;

import 'package:flutter/material.dart';

/// A widget that displays a customizable gradient progress bar.
class GradientProgressIndicator extends StatefulWidget {
  /// The gradient colors for the progress bar.
  final List<Color> colors;

  /// The progress value between 0.0 and 1.0.
  final double value;

  /// Creates a [GradientProgressIndicator].
  ///
  /// The [value] must be between 0.0 and 1.0.
  const GradientProgressIndicator(this.colors, this.value, {super.key});

  @override
  GradientProgressIndicatorState createState() =>
      GradientProgressIndicatorState();
}

/// A widget that displays a customizable gradient progress bar.
class GradientProgressIndicatorState extends State<GradientProgressIndicator> {
  double _value = 0.0;

  @override
  void didUpdateWidget(GradientProgressIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    _value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final availableWidth = constraints.maxWidth;
        final widthToApply = availableWidth * _value;

        return Container(
          height: 10,
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xffFFC56F).withAlpha(90),
            borderRadius: const BorderRadius.all(Radius.circular(50.0)),
          ),
          child: Row(
            children: [
              AnimatedContainer(
                curve: Curves.linear,
                duration: const Duration(seconds: 1),
                width: widthToApply,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                  child: _GradientProgressInternal(
                    widget.colors,
                    _value,
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class _GradientProgressInternal extends StatelessWidget {
  static const double _kLinearProgressIndicatorHeight = 10.0;
  final List<Color> colors;
  final double value;

  const _GradientProgressInternal(this.colors, this.value);

  @override
  Widget build(BuildContext context) {
    int colorsCount = (colors.length * value).toInt();
    final colorsToApply = colors.sublist(0, colorsCount);
    if (colorsToApply.isEmpty) {
      return Container();
    }
    if (colorsToApply.length < 2) colorsToApply.add(colors[0]);

    return Container(
      constraints: const BoxConstraints.tightFor(
        width: double.infinity,
        height: _kLinearProgressIndicatorHeight,
      ),
      decoration:
          BoxDecoration(gradient: LinearGradient(colors: colorsToApply)),
    );
  }
}
