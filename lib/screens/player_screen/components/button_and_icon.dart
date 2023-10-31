import 'package:flutter/material.dart';
import 'package:music_app/constants/app_color.dart';

class ButtonAndIcon extends StatelessWidget {
  const ButtonAndIcon({
    super.key,
    this.onPressed,
    required this.size,
    this.distance = 10,
    this.blur = 20,
    this.child,
    this.imageUrl,
    this.colors,
  });
  final VoidCallback? onPressed;
  final double size;
  final double distance;
  final double blur;
  final Widget? child;
  final String? imageUrl;
  final List<Color>? colors;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          height: size,
          width: size,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          padding: EdgeInsets.all(3),
          decoration: BoxDecoration(
              color: colors == null ? AppColor.bgColor : colors![1],
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColor.white,
                  blurRadius: blur,
                  offset: Offset(-distance, -distance),
                ),
                BoxShadow(
                  color: AppColor.bgDark,
                  blurRadius: blur,
                  offset: Offset(distance, distance),
                )
              ]),
          child: imageUrl != null
              ? Container(
                  decoration: BoxDecoration(
                      color: AppColor.bgColor,
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: colors ?? [AppColor.white, AppColor.bgDark])),
                  child: CircleAvatar(
                    backgroundImage: AssetImage(imageUrl!),
                  ),
                )
              : colors == null
                  ? Container(
                      child: child,
                    )
                  : Container(
                      decoration: BoxDecoration(
                          color: AppColor.bgColor,
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors:
                                  colors ?? [AppColor.white, AppColor.bgDark])),
                      child: child,
                    )),
    );
  }
}
