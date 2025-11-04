import 'package:flutter/material.dart';
import 'package:luckyui/luckyui.dart';

class LuckyRadioData {
  final String text;
  const LuckyRadioData({required this.text});
}

class LuckyRadioController extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void selectRadio(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}

class LuckyRadios extends StatefulWidget {
  final LuckyRadioController controller;
  final List<LuckyRadioData> radios;
  const LuckyRadios({
    super.key,
    required this.controller,
    required this.radios,
  });

  @override
  State<LuckyRadios> createState() => _LuckyRadiosState();
}

class _LuckyRadiosState extends State<LuckyRadios> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.radios.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return LuckyRadio(
          radio: widget.radios[index],
          selected: widget.controller.selectedIndex == index,
          onTap: () => _onRadioTap(index),
        );
      },
    );
  }

  void _onRadioTap(int index) {
    widget.controller.selectRadio(index);
    setState(() {});
  }
}

class LuckyRadio extends StatelessWidget {
  final LuckyRadioData radio;
  final bool selected;
  final VoidCallback onTap;
  const LuckyRadio({
    super.key,
    required this.selected,
    required this.radio,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: spaceMd),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: spaceSm),
            LuckyHeading(
              text: radio.text,
              fontSize: textBase,
              lineHeight: lineHeightNone,
              fontWeight: boldFontWeight,
            ),
            const Spacer(),
            Stack(
              alignment: Alignment.center,
              children: [
                AnimatedContainer(
                  duration: veryFastDuration,
                  curve: Curves.easeIn,
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    border: !selected
                        ? Border.all(
                            color: context.luckyColors.n400,
                            width: 1.5,
                          )
                        : null,
                    color: selected ? blue : null,
                    shape: BoxShape.circle,
                  ),
                ),
                AnimatedContainer(
                  duration: veryFastDuration,
                  curve: Curves.easeIn,
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: selected ? white : null,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
