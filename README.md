# BannerCarousel

BannerCarousel is a custom widget that builds a FullScreen carousel or not, with animation on the indicators.

<img src="https://github.com/MaiaraM/banner_carousel/blob/main/screenshots/customcarousel.gif?raw=true" alt="drawing" width="350"/>

  - [Default](#Default)
  - [FullScreen](#FullScreen)
  - [Custom Caroulsel](#Custom-carousel)
  - [Custom Banner](#Custom-carousel)
  - [OnTap Event](#Ontap-event)



## Default:

<img src="https://github.com/MaiaraM/banner_carousel/blob/main/screenshots/default.gif?raw=true" alt="drawing" width="350"/>

```dart
   BannersCarousel(banners: BannerImages.listBanners)
```

## FullScreen:

<img src="https://github.com/MaiaraM/banner_carousel/blob/main/screenshots/fullscreen.gif?raw=true" alt="drawing" width="350"/>

```dart
    BannersCarousel.fullScreen(
       banners: BannerImages.listBanners,
        animation: false,
     );
```

## Custom Carrousel:

<img src="https://github.com/MaiaraM/banner_carousel/blob/main/screenshots/customcarousel.gif?raw=true" alt="drawing" width="350"/>

```dart
   BannersCarousel(
      banners: BannerImages.listBanners,
      customizedIndicators: TypeIndicator.animation(width: 20, height: 5, spaceBetween: 2, widthExpanded: 50),
      height: 120,
      activeColor: Colors.amberAccent,
      disableColor: Colors.white,
      animation: true,
      borderRadius: 10,
      width: 250,
      indicationBottom: false,
  ),
```

## Custom Banner:

<img src="https://github.com/MaiaraM/banner_carousel/blob/main/screenshots/custombanner.gif?raw=true" alt="drawing" width="350"/>

```dart
          BannersCarousel(
            animation: false,
            viewportFraction: 0.60,
            showIndicator: false,
            customizedBanners: [
              Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
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
## Ontap Event:


```dart
   BannersCarousel(
     banners: BannerImages.listBanners,
     onTap: (id) => print(id),
   )
```
