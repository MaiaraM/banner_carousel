import 'package:flutter/material.dart';

import 'banner_model.dart';
import 'banner_widget.dart';
import 'indicators_widget.dart';
import 'type_indicator.dart';

class BannersCarousel extends StatefulWidget {
  final List<BannerModel>? banners;
  final bool animation;
  final bool indicationBottom;
  final bool showIndicator;
  final double height;
  final double width;
  final int initialPage;
  final double viewportFraction;
  final double borderRadius;
  final EdgeInsetsGeometry? margin;
  final Color? activeColor;
  final Color? disableColor;
  final IndicatorModel customizedIndicators;
  final ValueChanged<int>? onPageChanged;
  final Function(String id)? onTap;
  final List<Widget>? customizedBanners;

  const BannersCarousel({
    Key? key,
    this.banners,
    this.height = 150,
    this.borderRadius = 5,
    this.width = double.maxFinite,
    this.margin,
    this.indicationBottom = true,
    this.showIndicator = true,
    this.disableColor,
    this.onTap,
    this.viewportFraction = 1.0,
    this.onPageChanged,
    this.initialPage = 0,
    this.activeColor,
    this.animation = true,
    this.customizedIndicators = const IndicatorModel.animation(
        width: 10, height: 10, spaceBetween: 3.0),
    this.customizedBanners,
  })  : assert(banners != null || customizedBanners != null,
            'banners or customizedBanners need to be implemented'),
        assert(
            banners == null || customizedBanners == null,
            'Cannot provide both a banners and a customizedBanners\n'
            'Choose only one to implement'),
        super(key: key);

  const BannersCarousel.fullScreen({
    Key? key,
    this.banners,
    this.height = 150,
    this.borderRadius = 0,
    this.viewportFraction = 1.0,
    this.initialPage = 0,
    this.disableColor,
    this.onPageChanged,
    this.indicationBottom = true,
    this.onTap,
    this.showIndicator = true,
    this.activeColor,
    this.animation = true,
    this.customizedBanners,
    this.customizedIndicators = const IndicatorModel.animation(
        width: 10, height: 10, spaceBetween: 3.0),
  })  : this.width = double.maxFinite,
        this.margin = EdgeInsets.zero,
        assert(banners != null || customizedBanners != null,
            'banners or customizedBanners need to be implemented'),
        assert(
            banners == null || customizedBanners == null,
            'Cannot provide both a banners and a customizedBanners\n'
            'Choose only one to implement'),
        super(key: key);

  @override
  _BannersCarouselState createState() => _BannersCarouselState();
}

class _BannersCarouselState extends State<BannersCarousel> {
  late int page;

  @override
  void initState() {
    page = widget.initialPage;
    super.initState();
  }

  Color get activeColor => widget.activeColor ?? Color(0xFF10306D);
  Color get disableColor => widget.disableColor ?? Color(0xFFC4C4C4);

  List<dynamic> get banners => widget.customizedBanners ?? widget.banners!;

  List<Widget> get listBanners =>
      widget.customizedBanners ??
      widget.banners!
          .map((banner) => BannerWidget(
                key: Key("Banner${banner.id}"),
                imagePath: banner.pathImage,
                onTap: widget.onTap != null
                    ? () => widget.onTap!(banner.id)
                    : () => print("Double Tap Banner ${banner.id}"),
                borderRadius: widget.borderRadius,
              ))
          .toList();

  List<Widget> get rowIndicator => banners
      .asMap()
      .entries
      .map((e) => CarouselIndicatorWidget(
            key: Key("Indicator${e.key}"),
            active: page == e.key,
            color: page == e.key ? activeColor : disableColor,
            animation: widget.animation,
            sizeIndicator: widget.customizedIndicators,
          ))
      .toList();

  double get totalHeigth => widget.indicationBottom && widget.showIndicator
      ? widget.height + widget.customizedIndicators.heightExpanded + 15
      : widget.height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: totalHeigth,
      width: widget.width,
      margin: widget.margin ?? EdgeInsets.symmetric(horizontal: 16.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(
                      widget.viewportFraction == 1 &&
                              widget.customizedBanners == null
                          ? 0.25
                          : 0.0),
                  spreadRadius: 0,
                  blurRadius: 4,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            height: widget.height,
            child: PageView(
              controller: PageController(
                  initialPage: widget.initialPage,
                  viewportFraction: widget.viewportFraction),
              onPageChanged: (index) => _onChangePage(index),
              children: listBanners,
            ),
          ),
          widget.showIndicator
              ? Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: rowIndicator,
                    ),
                  ),
                )
              : SizedBox()
        ],
      ),
    );
  }

  void _onChangePage(int index) {
    if (widget.onPageChanged != null) {
      widget.onPageChanged!(index);
    }
    setState(() => page = index);
  }
}
