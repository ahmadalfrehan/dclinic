
import 'package:flutter/material.dart';

import '../../conf/style/app-text-style.dart';
import '../../conf/theme/app-themes.dart';

class Button extends StatelessWidget {
  final String text;
  final Function() function;
  final IconData icon;

  const Button(this.text, this.function, this.icon, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: function,
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(text,
                    style:
                    AppTextStyle.textStyleWith500Weight15SizeDarkBlueColor),
                Icon(
                  icon,
                  color: AppTheme.darkBlue,
                ),
              ],
            ),
          )),
    );
  }
}
