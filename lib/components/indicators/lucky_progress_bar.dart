import 'package:flutter/material.dart';
import 'package:luckyui/theme/lucky_colors.dart';
import 'package:luckyui/theme/lucky_tokens.dart';

/// A widget that displays a progress bar.
class LuckyProgressBar extends StatelessWidget {
  /// The current value of the progress bar.
  final int current;

  /// The total value of the progress bar.
  final int total;

  /// The text to display in the progress bar for the current value.
  final String currentText;

  /// The text to display in the progress bar for the total value.
  final String totalText;

  /// Whether to show text in the progress bar (uses current/total if true and no custom text provided).
  final bool showText;

  /// Creates a new [LuckyProgressBar] widget.
  const LuckyProgressBar({
    super.key,
    required this.current,
    required this.total,
    this.currentText = "",
    this.totalText = "",
    this.showText = false,
  });

  /// The progress of the progress bar.
  double get progress => current / total;

  /// Whether the text should be shown in the progress bar.
  bool get _shouldShowText =>
      showText || (currentText.isNotEmpty && totalText.isNotEmpty);

  /// The text to display for current value.
  String get _currentDisplay =>
      currentText.isNotEmpty ? currentText : _formatNumber(current);

  /// The text to display for total value.
  String get _totalDisplay =>
      totalText.isNotEmpty ? totalText : _formatNumber(total);

  /// Format number with K/M suffix for large numbers.
  static String _formatNumber(int value) {
    if (value >= 1000000) {
      return '${(value / 1000000).toStringAsFixed(1)}M';
    } else if (value >= 1000) {
      return '${(value / 1000).toStringAsFixed(1)}K';
    }
    return value.toString();
  }

  static const double _heightLarge = 24;
  static const double _heightSmall = 8;

  static const double _halfProgress = 0.5;
  static const double _virtualProgressDelta = 0.075;

  @override
  Widget build(BuildContext context) {
    final Color noProgressTextColor = context.luckyColors.onSurface;
    const Color progressTextColor = white;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        Color textColor;
        double virtualProgress = progress;
        if (progress <= _halfProgress + _virtualProgressDelta &&
            progress >= _halfProgress - _virtualProgressDelta) {
          if (progress < _halfProgress) {
            textColor = noProgressTextColor;
            virtualProgress = _halfProgress - _virtualProgressDelta;
          } else {
            textColor = progressTextColor;
            virtualProgress = _halfProgress + _virtualProgressDelta;
          }
        } else {
          if (progress < _halfProgress) {
            textColor = noProgressTextColor;
          } else {
            textColor = progressTextColor;
          }
        }

        return Stack(
          alignment: Alignment.centerLeft,
          clipBehavior: Clip.none,
          children: [
            Container(
              width: double.infinity,
              height: _shouldShowText ? _heightLarge : _heightSmall,
              decoration: BoxDecoration(
                color: context.luckyColors.n100,
                borderRadius: _shouldShowText ? radiusXl : radiusSm,
              ),
            ),
            Container(
              width: constraints.maxWidth * virtualProgress,
              height: _shouldShowText ? _heightLarge : _heightSmall,
              decoration: BoxDecoration(
                color: context.luckyColors.primaryColor,
                borderRadius: _shouldShowText ? radiusXl : radiusSm,
              ),
            ),
            if (_shouldShowText)
              Center(
                child: Text(
                  '$_currentDisplay/$_totalDisplay',
                  style: TextStyle(
                    color: textColor,
                    fontSize: textXs,
                    fontWeight: boldFontWeight,
                    height: lineHeightXs,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
