import 'package:flutter/material.dart';

@immutable
class BannerWidget extends StatelessWidget {
  final String imagePath;
  final double borderRadius;
  final BoxFit boxFit;
  final VoidCallback onTap;

  BannerWidget(
      {Key? key,
      required this.imagePath,
      this.borderRadius = 5,
      required this.onTap,
      this.boxFit = BoxFit.cover})
      : super(key: key);

  ImageProvider get _getImage {
    if (this.imagePath.contains("https://") ||
        this.imagePath.contains("http://")) {
      return NetworkImage(this.imagePath);
    }
    return AssetImage(this.imagePath);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: _getImage,
              fit: boxFit,
            ),
            borderRadius: BorderRadius.circular(borderRadius)),
        width: double.maxFinite,
        // child: SizedBox(),
      ),
    );
  }
}
