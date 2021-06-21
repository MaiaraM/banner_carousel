import 'package:banner_carousel/banner_carousel.dart';
import 'package:flutter/material.dart';

@immutable
class BannerWidget extends StatelessWidget {
  final BannerModel _bannerModel;

  /// The [borderRadius] of the container
  /// Default value 5
  final double borderRadius;

  /// The [_onTap] The Method when click on the Banner
  final VoidCallback _onTap;

  final double spaceBetween;

  BannerWidget({
    Key? key,
    required BannerModel bannerModel,
    this.borderRadius = 5,
    this.spaceBetween = 0,
    required VoidCallback onTap,
  })   : _bannerModel = bannerModel,
        _onTap = onTap,
        super(key: key);

  ImageProvider get _getImage {
    if (_bannerModel.imagePath.contains("https://") ||
        _bannerModel.imagePath.contains("http://")) {
      return NetworkImage(_bannerModel.imagePath);
    }
    return AssetImage(_bannerModel.imagePath);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: spaceBetween),
        decoration: BoxDecoration(
            image: DecorationImage(
              image: _getImage,
              fit: _bannerModel.boxFit,
            ),
            borderRadius: BorderRadius.circular(borderRadius)),
        width: double.maxFinite,
        // child: SizedBox(),
      ),
    );
  }
}
