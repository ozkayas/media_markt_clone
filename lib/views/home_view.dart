import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:media_markt_clone/models/repo.dart';
import 'package:media_markt_clone/views/app_text.dart/app_text.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _carouselIndex = 0;
  var txt = AppTxt.instance;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: ListView(children: [
        _mainCarousel(),
        _redTitle(textTheme, txt.kChosenForYou),
        _redTitle(textTheme, txt.kMMSuggests),
      ]),
    );
  }

  Padding _redTitle(TextTheme textTheme, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
      child: Text(title, style: textTheme.headline2),
    );
  }

  Widget _mainCarousel() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CarouselSlider.builder(
          itemCount: carouselItems.length,
          itemBuilder: (context, index, realIndex) {
            final imageUrl = carouselItems[index];
            return buildImage(imageUrl, index);
          },
          options: CarouselOptions(
              aspectRatio: 90 / 100,
              viewportFraction: 1,
              enableInfiniteScroll: false,
              onPageChanged: (index, reason) {
                setState(() {
                  _carouselIndex = index;
                });
              }),
        ),
        SizedBox(height: 8),
        Center(child: buildIndicator(carouselItems.length)),
      ],
    );
  }

  Widget buildImage(String imageUrl, int index) {
    return Container(
      margin: EdgeInsets.all(8),
      child: Image.asset(
        imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget buildIndicator(int count) {
    return AnimatedSmoothIndicator(
      activeIndex: _carouselIndex,
      count: count,
      effect: ColorTransitionEffect(
          dotHeight: 12,
          dotWidth: 12,
          radius: 8,
          paintStyle: PaintingStyle.fill,
          strokeWidth: 2,
          activeStrokeWidth: 2,
          dotColor: Colors.grey,
          activeDotColor: Colors.red),
    );
  }
}
