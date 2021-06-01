import 'package:flutter/material.dart';

/// Model to Banner of caroulse
class BannerModel {
  /// The [imagePath] is the path to the image.
  /// That can be assert Path or Network Path
  final String imagePath;

  /// The [id] to indentify the banner.
  final String id;

  /// The [boxFit] How the image should be inscribed into the [Container].
  /// Default value is [BoxFit.cover]
  final BoxFit boxFit;

  ///
  /// BannerModel(imagePath: '/assets/banner1.png', id: "1")
  ///
  /// OR
  ///
  /// BannerModel(imagePath: '"https://picjumbo.com/wp-content/uploads/the-golden-gate-bridge-sunset-1080x720.jpg"', id: "2"),
  BannerModel(
      {required this.imagePath, required this.id, this.boxFit = BoxFit.cover});
}
