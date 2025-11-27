import 'package:flutter/material.dart';
import 'package:luckyui/components/buttons/lucky_icon_button.dart';
import 'package:luckyui/theme/lucky_colors.dart';
import 'package:luckyui/theme/lucky_tokens.dart';

/// A widget that displays a bottom sheet.
class LuckyBottomSheet extends StatelessWidget {
  /// Shows a bottom sheet.
  static Future<T?> show<T>({
    required BuildContext context,
    required List<Widget> children,
    bool showClose = true,
    bool expanded = false,
    EdgeInsetsGeometry padding = const EdgeInsets.symmetric(
      horizontal: spaceMd,
    ),
  }) {
    return showModalBottomSheet<T?>(
      context: context,
      useSafeArea: true,
      isScrollControlled: expanded,
      scrollControlDisabledMaxHeightRatio: 1.0,
      shape: RoundedRectangleBorder(
        borderRadius: radius2xl.copyWith(
          bottomLeft: Radius.zero,
          bottomRight: Radius.zero,
        ),
      ),
      backgroundColor: context.luckyColors.surfaceTint,
      barrierColor: black.withAlpha(200),
      builder: (context) {
        return LuckyBottomSheet(padding: padding, children: children);
      },
    );
  }

  /// The children to display in the bottom sheet.
  final List<Widget> children;

  /// The padding of the bottom sheet.
  final EdgeInsetsGeometry padding;

  /// Whether to show the close button.
  final bool showClose;

  /// Creates a new [LuckyBottomSheet] widget.
  const LuckyBottomSheet({
    super.key,
    required this.children,
    required this.padding,
    this.showClose = true,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      clipBehavior: Clip.none,
      children: [
        SingleChildScrollView(
          padding: padding,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...children,
              SizedBox(height: MediaQuery.of(context).padding.bottom),
            ],
          ),
        ),
        if (showClose)
          Padding(
            padding: const EdgeInsets.only(right: spaceSm, top: spaceSm),
            child: LuckyIconButton(
              nativeIcon: Icons.close_rounded,
              size: iconLg,
              color: context.luckyColors.n600,
              onTap: () => Navigator.pop(context), // Close modal.
            ),
          ),
      ],
    );
  }
}
