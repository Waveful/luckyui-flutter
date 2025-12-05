import 'package:flutter/material.dart';
import 'package:luckyui/components/indicators/lucky_icons.dart';
import 'package:luckyui/theme/lucky_colors.dart';
import 'package:luckyui/theme/lucky_tokens.dart';

/// A widget that displays a badge with an icon and a text.
class LuckyBadge extends StatelessWidget {
  /// The icon to display in the badge.
  final LuckyIconData icon;

  /// The text to display in the badge.
  final String text;

  /// Creates a new [LuckyBadge] widget.
  const LuckyBadge({super.key, required this.icon, this.text = ""});

  /// Whether the badge has text.
  bool get hasText => text.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        LuckyIcon(icon: icon, color: context.luckyColors.primaryColor),
        if (hasText) const SizedBox(width: spaceXs),
        if (hasText)
          Text(
            text,
            style: TextStyle(
              color: context.luckyColors.primaryColor,
              fontSize: textLg,
              fontWeight: semiBoldFontWeight,
            ),
          ),
      ],
    );
  }
}
