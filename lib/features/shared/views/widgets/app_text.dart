import 'package:flutter/material.dart';

import '../../../../utils/app_text_styles.dart';

class AppText extends StatelessWidget {
  final String? value;
  final TextStyle? style;
  final TextAlign textAlign;
  final TextStyle defaultStyle;
  final int? limit;
  final Function()? onPressed;

  const AppText.heading1(
    this.value, {
    Key? key,
    this.style,
    this.textAlign = TextAlign.start,
    this.limit,
    this.onPressed,
  })  : defaultStyle = ktsHeading1,
        super(key: key);

  const AppText.heading2(
    this.value, {
    Key? key,
    this.style,
    this.textAlign = TextAlign.start,
    this.limit,
    this.onPressed,
  })  : defaultStyle = ktsHeading2,
        super(key: key);

  const AppText.heading3(
    this.value, {
    Key? key,
    this.style,
    this.textAlign = TextAlign.start,
    this.limit,
    this.onPressed,
  })  : defaultStyle = ktsHeading3,
        super(key: key);

  const AppText.heading4(
    this.value, {
    Key? key,
    this.style,
    this.textAlign = TextAlign.start,
    this.limit,
    this.onPressed,
  })  : defaultStyle = ktsHeading4,
        super(key: key);

  const AppText.title(
    this.value, {
    Key? key,
    this.style,
    this.textAlign = TextAlign.start,
    this.limit,
    this.onPressed,
  })  : defaultStyle = ktsTitle,
        super(key: key);

  const AppText.body(
    this.value, {
    Key? key,
    this.style,
    this.textAlign = TextAlign.start,
    this.limit,
    this.onPressed,
  })  : defaultStyle = ktsBody,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    if (value == null) return Container();
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onPressed,
      child: Text(
        _limitedText(),
        style: defaultStyle.merge(style),
        textAlign: textAlign,
      ),
    );
  }

  String _limitedText() {
    final text = value ?? '';
    if (limit != null) {
      return text.length > limit!
          ? '${text.substring(0, limit).trim()}...'
          : text;
    }
    return text;
  }
}
