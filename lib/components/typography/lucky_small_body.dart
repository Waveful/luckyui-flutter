import 'package:flutter/material.dart';
import 'package:luckyui/theme/lucky_colors.dart';
import 'package:luckyui/theme/lucky_tokens.dart';

/// A widget that displays a small body text.
class LuckySmallBody extends StatelessWidget {

  /// The text to display.
  final String text;

  /// The color of the text.
  final Color? color;

  /// The font weight of the text.
  final FontWeight fontWeight;

  /// The text alignment of the text.
  final TextAlign textAlign;

  /// The maximum number of lines to display.
  final int? maxLines;

  /// The overflow of the text.
  final TextOverflow? overflow;

  /// Creates a new [LuckySmallBody] widget.
  const LuckySmallBody({
    super.key,
    required this.text,
    this.color,
    this.fontWeight = normalFontWeight,
    this.textAlign = TextAlign.start,
    this.maxLines,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color ?? context.luckyColors.n500,
        fontSize: textXs,
        fontWeight: fontWeight,
        height: lineHeightXs,
      ),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}