import 'package:flutter/material.dart';
import 'package:food_recpie_app/utils/colors.dart';
import 'package:food_recpie_app/utils/search_list_provider.dart';
import 'package:food_recpie_app/utils/slider_utils.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class SliderLabelWidget extends StatefulWidget {
  final Function(String sliderValue) onFileChanged;
  const SliderLabelWidget({Key? key, required this.onFileChanged})
      : super(key: key);

  @override
  _SliderLabelWidgetState createState() => _SliderLabelWidgetState();
}

class _SliderLabelWidgetState extends State<SliderLabelWidget> {
  int indexTop = 0;
  double valueBottom = 20;

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: const SliderThemeData(
        /// ticks in between
        activeTickMarkColor: Colors.transparent,
        inactiveTickMarkColor: Colors.transparent,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildSliderTopLabel(),
        ],
      ),
    );
  }

  Widget buildSliderTopLabel() {
    final labels = ['<10', '30', '>60'];
    const double min = 0;
    final double max = labels.length - 1.0;
    final divisions = labels.length - 1;

    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 3.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: Utils.modelBuilder(
              labels,
              (index, label) {
                const selectedColor = primaryColor;
                const unselectedColor = secondaryText;
                final isSelected = index <= indexTop;
                final color = isSelected ? selectedColor : unselectedColor;

                return buildLabel(
                    label: label as String, color: color, width: 9.w);
              },
            ),
          ),
        ),
        Slider(
            value: indexTop.toDouble(),
            min: min,
            max: max,
            divisions: divisions,
            activeColor: primaryColor,
            inactiveColor: formText,
            onChanged: (value) => setState(() {
                  indexTop = value.toInt();
                  // if (indexTop == 1) {
                  //   widget.onFileChanged('30');
                  // } else if (indexTop == 2) {
                  //   widget.onFileChanged('>60');
                  // } else {
                  //   widget.onFileChanged('<10');
                  // }
                  if (Provider.of<SearchListProvider>(context, listen: false)
                          .time ==
                      '30') {
                    widget.onFileChanged('30');
                  } else if (Provider.of<SearchListProvider>(context,
                              listen: false)
                          .time ==
                      '>60') {
                    widget.onFileChanged('>60');
                  } else {
                    widget.onFileChanged('<10');
                  }
                  //log('Log: Slider - Index = $sliderValue');
                })),
      ],
    );
  }

  Widget buildLabel({
    required String label,
    required double width,
    required Color color,
  }) =>
      SizedBox(
        width: width,
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'InterBold',
            fontSize: 11.sp,
          ).copyWith(color: color),
        ),
      );
}
