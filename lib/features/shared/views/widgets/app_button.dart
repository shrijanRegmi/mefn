import 'package:flutter/material.dart';

import '../../../../utils/app_colors.dart';

enum _Type {
  filled,
  bordered,
}

class AppButton extends StatelessWidget {
  final String? value;
  final Widget? icon;
  final _Type _type;
  final Color? color;
  final Color? borderColor;
  final TextStyle? textStyle;
  final double? minWidth;
  final double borderRadius;
  final EdgeInsets? padding;
  final Function()? onPressed;
  final bool shadow;
  final bool loading;
  final double loaderSize;

  const AppButton.filled({
    Key? key,
    this.value,
    this.icon,
    this.onPressed,
    this.color,
    this.textStyle,
    this.minWidth,
    this.borderRadius = 5.0,
    this.padding,
    this.shadow = false,
    this.loading = false,
    this.loaderSize = 30.0,
  })  : _type = _Type.filled,
        borderColor = null,
        super(key: key);

  const AppButton.bordered({
    Key? key,
    this.value,
    this.icon,
    this.onPressed,
    this.borderColor,
    this.textStyle,
    this.minWidth,
    this.borderRadius = 5.0,
    this.padding,
    this.shadow = false,
    this.loading = false,
    this.loaderSize = 30.0,
  })  : _type = _Type.bordered,
        color = null,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return _type == _Type.filled
        ? _filledBuilder(context)
        : _borderedBuilder(context);
  }

  Widget _filledBuilder(final BuildContext context) {
    final mColor = color ?? Theme.of(context).colorScheme.primary;

    return MaterialButton(
      onPressed: onPressed,
      color: mColor,
      minWidth: minWidth,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      elevation: shadow ? 7.0 : 0.0,
      padding: padding,
      disabledColor: kcLightGrey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) icon ?? Container(),
          if (icon != null && value != null)
            const SizedBox(
              width: 10.0,
            ),
          if (value != null)
            Text(
              '$value',
              style: textStyle ??
                  const TextStyle(
                    color: Colors.white,
                  ),
            ),
          if (loading && value != null)
            const SizedBox(
              width: 20.0,
            ),
          if (loading)
            SizedBox(
              width: loaderSize,
              height: loaderSize,
              child: const CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 1.0,
              ),
            ),
        ],
      ),
    );
  }

  Widget _borderedBuilder(final BuildContext context) {
    final mBorderColor = borderColor ?? Theme.of(context).colorScheme.primary;

    return MaterialButton(
      onPressed: onPressed,
      minWidth: minWidth,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        side: BorderSide(color: mBorderColor),
      ),
      elevation: shadow ? 7.0 : 0.0,
      padding: padding,
      highlightColor: Colors.transparent,
      focusColor: mBorderColor.withOpacity(0.2),
      hoverColor: mBorderColor.withOpacity(0.2),
      splashColor: mBorderColor.withOpacity(0.2),
      disabledColor: kcLightGrey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) icon ?? Container(),
          if (icon != null && value != null)
            const SizedBox(
              width: 10.0,
            ),
          if (value != null)
            Text(
              '$value',
              style: textStyle ??
                  TextStyle(
                    color: mBorderColor,
                  ),
            ),
          if (loading && value != null)
            const SizedBox(
              width: 20.0,
            ),
          if (loading)
            SizedBox(
              width: loaderSize,
              height: loaderSize,
              child: CircularProgressIndicator(
                color: mBorderColor,
                strokeWidth: 1.0,
              ),
            ),
        ],
      ),
    );
  }
}
