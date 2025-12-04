import 'package:flutter/material.dart';
import 'package:luckyui/theme/lucky_tokens.dart';

/// A widget that animates the scale of a child widget when tapped.
class LuckyTapAnimation extends StatefulWidget {
  /// The callback to be called when the widget is tapped.
  final VoidCallback? onTap;

  /// The callback to be called when the widget is long pressed.
  final VoidCallback? onLongPress;

  /// A notifier to control the animation state.
  final ValueNotifier<bool>? animationNotifier;

  /// The scale to apply when the widget is pressed.
  final double? pressedScale;

  /// The hit test behavior of the GestureDetector.
  final HitTestBehavior hitTestBehavior;

  /// The child widget to be animated.
  final Widget child;

  /// Creates a new [LuckyTapAnimation] widget.
  const LuckyTapAnimation({
    super.key,
    this.onTap,
    this.onLongPress,
    this.animationNotifier,
    this.pressedScale,
    this.hitTestBehavior = HitTestBehavior.opaque,
    required this.child,
  });

  @override
  State<LuckyTapAnimation> createState() => _LuckyTapAnimationState();
}

class _LuckyTapAnimationState extends State<LuckyTapAnimation> {
  static const kDefaultScale = 1.0;
  static const kPressedScale = 0.975;

  double _scale = kDefaultScale;

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: _scale,
      duration: veryFastDuration,
      curve: Curves.easeIn,
      child: Listener(
        onPointerDown: (_) {
          if (widget.onTap == null) {
            return;
          }
          if (!mounted) {
            return;
          }

          setState(() => _scale = widget.pressedScale ?? kPressedScale);
          widget.animationNotifier?.value = true;
        },
        onPointerCancel: (_) {
          if (widget.onTap == null) {
            return;
          }
          if (!mounted) {
            return;
          }

          setState(() => _scale = kDefaultScale);
          widget.animationNotifier?.value = false;
        },
        onPointerUp: (_) {
          if (widget.onTap == null) {
            return;
          }
          if (!mounted) {
            return;
          }

          setState(() => _scale = kDefaultScale);
          widget.animationNotifier?.value = false;
        },
        child: GestureDetector(
          behavior: widget.hitTestBehavior,
          onTap: widget.onTap,
          onLongPress: widget.onLongPress,
          child: widget.child,
        ),
      ),
    );
  }
}
