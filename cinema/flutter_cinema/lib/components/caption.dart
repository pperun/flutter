import 'dart:ui';

import 'package:flutter/material.dart';

class Caption extends StatelessWidget {
  final String? text;
  final Icon? icon;
  final CaptionType type;
  final BorderRadius borderRadius;
  final EdgeInsets padding;

  const Caption({
    super.key,
    this.text,
    this.icon,
    CaptionType? type,
    BorderRadius? borderRadius,
    EdgeInsets? padding,
  })  : type = type ?? CaptionType.small,
        borderRadius =
            borderRadius ?? const BorderRadius.all(Radius.circular(10)),
        padding = padding ?? const EdgeInsets.all(10);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 3,
          sigmaY: 3,
          tileMode: TileMode.decal
        ),
        child: Container(
          alignment: Alignment.center,
          padding: padding,
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            color: Colors.black.withOpacity(0.5),
          ),
          child: text  != null ? Text(
            text!,
            style: TextStyle(
              color: Colors.white,
              fontSize: type == CaptionType.small ? 14.0 : 24.0,
            ),
            overflow: TextOverflow.ellipsis,
          ) : icon
        ),
      ),
    );
  }
}

enum CaptionType { small, large }
