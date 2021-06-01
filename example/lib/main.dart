import 'package:banners_carousel_package/banners_carousel_package.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Banner Carrousel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ///Base
          BannersCarousel(
            banners: BannerImages.listBanners,
            onTap: (id) => print(id),
          ),

          /// Carousel FullScreen
          BannersCarousel.fullScreen(
            banners: BannerImages.listBanners,
            height: 80,
            animation: false,
          ),

          /// Carousel Customized
          BannersCarousel(
            banners: BannerImages.listBanners,
            customizedIndicators: TypeIndicator.animation(
                width: 20, height: 5, spaceBetween: 2, widthExpanded: 50),
            height: 120,
            activeColor: Colors.amberAccent,
            disableColor: Colors.white,
            animation: true,
            borderRadius: 10,
            onTap: (id) => print(id),
            width: 250,
            indicationBottom: false,
          ),

          /// Banner Customized Without Indicator
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

          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}

class BannerImages {
  static const String banner1 =
      "https://picjumbo.com/wp-content/uploads/the-golden-gate-bridge-sunset-1080x720.jpg";
  static const String banner2 =
      "https://cdn.mos.cms.futurecdn.net/Nxz3xSGwyGMaziCwiAC5WW-1024-80.jpg";
  static const String banner3 = "https://wallpaperaccess.com/full/19921.jpg";
  static const String banner4 =
      "https://images.pexels.com/photos/2635817/pexels-photo-2635817.jpeg?auto=compress&crop=focalpoint&cs=tinysrgb&fit=crop&fp-y=0.6&h=500&sharp=20&w=1400";

  static List<BannerModel> listBanners = [
    BannerModel(path: banner1, id: "1"),
    BannerModel(path: banner2, id: "2"),
    BannerModel(path: banner3, id: "3"),
    BannerModel(path: banner4, id: "4"),
  ];
}
