import 'package:flutter/material.dart';
import 'package:luckyui/animations/lucky_tap_animation.dart';
import 'package:luckyui/theme/lucky_colors.dart';
import 'package:luckyui/theme/lucky_tokens.dart';

enum LuckyButtonStyleEnum { primary, primaryAlternative, secondary }

class LuckyButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool disabled;
  final LuckyButtonStyleEnum style;
  const LuckyButton({
    super.key,
    required this.text,
    required this.onTap,
    this.disabled = false,
    this.style = LuckyButtonStyleEnum.primary,
  });

  @override
  Widget build(BuildContext context) {
    final Color enabledColor = style == LuckyButtonStyleEnum.primary
        ? blue
        : (style == LuckyButtonStyleEnum.primaryAlternative
              ? context.luckyColors.onSurface
              : context.luckyColors.surface);
    final Color disabledColor = style == LuckyButtonStyleEnum.primary
        ? blue300
        : context.luckyColors.n200;
    final Color textColor = style == LuckyButtonStyleEnum.primary
        ? white
        : (style == LuckyButtonStyleEnum.primaryAlternative
              ? context.luckyColors.surface
              : context.luckyColors.onSurface);

    return LuckyTapAnimation(
      onTap: onTap,
      child: AnimatedContainer(
        duration: fastDuration,
        curve: Curves.easeIn,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: spaceMd),
        decoration: BoxDecoration(
          color: disabled ? disabledColor : enabledColor,
          borderRadius: radius4xl,
          border: style == LuckyButtonStyleEnum.secondary
              ? Border.all(color: context.luckyColors.n100)
              : null,
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: textBase,
            fontWeight: semiBoldFontWeight,
          ),
        ),
      ),
    );
  }
}
