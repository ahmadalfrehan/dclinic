import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Conf/Debug/out.dart';
import '../../Conf/Debug/screen-stability.dart';
import '../../conf/style/app-text-style.dart';
import '../../conf/theme/app-themes.dart';

class AppTextField extends StatefulWidget {
  final String hint;
  final String? validatorMessage;
  final String? svgIcon;
  final IconData? iconData;
  final bool? isPassword;
  final bool? isPhone;
  final bool? isEmail;
  final TextEditingController? textEditingController;

  const AppTextField({
    Key? key,
    this.isPassword,
    this.svgIcon,
    this.isPhone,
    this.isEmail,
    this.validatorMessage,
    required this.iconData,
    required this.hint,
    this.textEditingController,
  }) : super(key: key);

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool isObscure = false;
  bool isError = false;

  @override
  void initState() {
    isObscure = widget.isPassword == true ? true : false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: SizedBox(
        height: isError ? null : ScreenStability.height(60),
        child: TextFormField(
          textAlignVertical: TextAlignVertical.bottom,
          controller: widget.textEditingController,
          textInputAction: TextInputAction.next,
          textDirection: TextDirection.ltr,
          obscureText: isObscure,
          decoration: InputDecoration(
            errorStyle: const TextStyle(fontSize: 10),
            fillColor: AppTheme.white245,
            filled: true,
            // suffixText:widget.isPhone==true? '0':null,
            suffixStyle:
                const TextStyle(color: AppTheme.primaryColor, fontSize: 18),
            suffixIcon: widget.isPassword != null
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        isObscure = !isObscure;
                      });
                    },
                    icon: Icon(
                      isObscure ? Icons.visibility_off : Icons.visibility,
                      color: AppTheme.darkBlue,
                    ),
                  )
                : null,
            prefixIcon: Icon(widget.iconData, color: AppTheme.darkBlue),
            hintText: widget.hint.tr,
            hintStyle: AppTextStyle.textStyleWith400Weight15SizeDarkBlueColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
                gapPadding: 55),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
          keyboardType: widget.isPhone == true ? TextInputType.phone : null,
          validator: widget.validatorMessage != null
              ? (value) {
                  log(value);
                  if (value!.isEmpty) {
                    setState(() {
                      isError = true;
                    });
                    return widget.validatorMessage;
                  }
                  if (widget.isEmail == true) {
                    if (!value.contains('@')) {
                      setState(() {
                        isError = true;
                      });
                      return 'must contains @';
                    } else {
                      return null;
                    }
                  }
                  if (widget.isPassword == true) {
                    if (value.length < 8) {
                      setState(() {
                        isError = true;
                      });
                      return 'password must be at least 8 digits';
                    } else {
                      return null;
                    }
                  } else {
                    return null;
                  }
                }
              : null,
        ),
      ),
    );
  }
}
