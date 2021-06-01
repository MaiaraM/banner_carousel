# BannerCarousel

BannerCarousel is a custom widget that builds a FullScreen carousel or not, with animation on the indicators.

<img src="https://github.com/MaiaraM/banner_carousel/blob/main/screenshots/customcarousel.gif?raw=true" alt="drawing" width="350"/>

- [Parameters](#Parameters)
- [Models](#Models)
- [Examples](#Examples)
  - [Default](#Default)
  - [FullScreen](#FullScreen)
  - [Custom Caroulsel](#Custom-carousel)
  - [Custom Banner](#Custom-carousel)
  - [OnTap Event](#Ontap-event)



## Parameters
  - `banners` - List of `BannerModel`
  - `animation` - boolean for indicator animation - Default `true`
  - `indicatorBottom` - indicator is below carousel - Default `true`
  - `showIndicator` - show indicator - Default `true`
  - `height` - Default double `150`
  - `initialPage`
  - `viewportFraction`
  - `borderRadius` - Default `5`
  - `margin`
  - `activeColor`
  - `disableColor`
  - `customizedIndicators` - Accepts a `` model
  - `onPageChanged`
  - `onTap`
  - `customizedBanners` - List of `Widget`

## Models
  - `BannerModel` 
  - `IndicatorModel` 

## Example


```dart
List<BannerModel> listBanners = [
    BannerModel(pathImage: banner1, id: "1"),
    BannerModel(pathImage: banner2, id: "2"),
    BannerModel(pathImage: banner3, id: "3"),
    BannerModel(pathImage: banner4, id: "4"),
];
```

### Default:

<img src="https://github.com/MaiaraM/banner_carousel/blob/main/screenshots/default.gif?raw=true" alt="drawing" width="350"/>

```dart
BannersCarousel(banners: listBanners)
```

### FullScreen:

<img src="https://github.com/MaiaraM/banner_carousel/blob/main/screenshots/fullscreen.gif?raw=true" alt="drawing" width="350"/>

```dart
 BannersCarousel.fullScreen(
    banners: listBanners,
    animation: false,
 );
```

### Custom Carrousel:

<img src="https://github.com/MaiaraM/banner_carousel/blob/main/screenshots/customcarousel.gif?raw=true" alt="drawing" width="350"/>

```dart
BannersCarousel(
  banners: listBanners,
  customizedIndicators: TypeIndicator.animation(width: 20, height: 5, spaceBetween: 2, widthAnimation: 50),
  height: 120,
  activeColor: Colors.amberAccent,
  disableColor: Colors.white,
  animation: true,
  borderRadius: 10,
  width: 250,
  indicatorBottom: false,
),
```

### Custom Banner:

<img src="https://github.com/MaiaraM/banner_carousel/blob/main/screenshots/custombanner.gif?raw=true" alt="drawing" width="350"/>

```dart
BannersCarousel(
   animation: false,
   viewportFraction: 0.60,
   showIndicator: false,
   customizedBanners: [
        Container(
           decoration: BoxDecoration(
              border: Border.all(color: Colors.black,width: 2),),
              child: Image.network(BannerImages.banner1)),
        Container(
             margin: EdgeInsets.symmetric(horizontal: 20),
             decoration: BoxDecoration(
                  boxShadow: [
                     BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        spreadRadius: 0,
                        blurRadius: 4,
                        offset: Offset(0, 3),
                      ),
                    ],
               ),
              child: Image.network(BannerImages.banner2)),
         Container(
             margin: EdgeInsets.symmetric(horizontal: 20),
             decoration: BoxDecoration(
             border: Border.all(
                    color: Colors.green,
                    width: 3,
                  ),
                  borderRadius: BorderRadius.circular(50),
              image: DecorationImage(
              image: NetworkImage(
                        'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
              fit: BoxFit.cover,
              ),
           ),
       ),
    ],
),
```
### Ontap Event:


```dart
BannersCarousel(
  banners: listBanners,
  onTap: (id) => print(id),
)
```
