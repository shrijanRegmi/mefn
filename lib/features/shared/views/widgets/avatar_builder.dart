import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mefn/utils/app_colors.dart';

class AvatarBuilder extends StatelessWidget {
  final String? letter;
  final String? imgUrl;
  final Color? textColor;
  final double size;
  final Color bgColor;
  final bool border;
  final Color borderColor;
  final String? heroTag;
  final Widget? overlayWidget;
  final Function()? onPressed;

  const AvatarBuilder.image(
    this.imgUrl, {
    final Key? key,
    this.size = 40.0,
    this.bgColor = kcLightGrey,
    this.border = false,
    this.borderColor = kcPrimaryDark,
    this.heroTag,
    this.overlayWidget,
    this.onPressed,
  })  : letter = null,
        textColor = null,
        super(key: key);

  const AvatarBuilder.letter(
    this.letter, {
    final Key? key,
    this.size = 40.0,
    this.textColor = kcWhite,
    this.bgColor = kcLightGrey,
    this.border = false,
    this.borderColor = kcPrimaryDark,
    this.overlayWidget,
    this.onPressed,
  })  : imgUrl = null,
        heroTag = null,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        _mainComponentBuilder(),
        Positioned(
          right: -2.0,
          top: -9.0,
          child: overlayWidget ?? const SizedBox(),
        ),
      ],
    );
  }

  Widget _mainComponentBuilder() {
    if (imgUrl != null) {
      final widget = GestureDetector(
        onTap: onPressed,
        behavior: HitTestBehavior.opaque,
        child: Container(
          width: size + 2,
          height: size + 2,
          padding: const EdgeInsets.all(2.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: !border
                ? null
                : Border.all(
                    color: borderColor,
                    width: 2.0,
                  ),
          ),
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              color: bgColor,
              shape: BoxShape.circle,
              image: DecorationImage(
                image: CachedNetworkImageProvider('$imgUrl'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      );

      if (heroTag != null) {
        return Hero(
          tag: heroTag!,
          child: widget,
        );
      }

      return widget;
    } else if (letter != null) {
      return GestureDetector(
        onTap: onPressed,
        behavior: HitTestBehavior.opaque,
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: bgColor,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              letter!,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
          ),
        ),
      );
    } else {
      return GestureDetector(
        onTap: onPressed,
        child: Container(
          width: size + 2,
          height: size + 2,
          padding: const EdgeInsets.all(2.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: !border
                ? null
                : Border.all(
                    color: borderColor,
                    width: 2.0,
                  ),
          ),
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              color: bgColor,
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(
              'assets/svgs/upload_img.svg',
              color: kcBlack,
            ),
          ),
        ),
      );
    }
  }
}
