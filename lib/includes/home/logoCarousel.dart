import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Logocarousel extends StatefulWidget {
  const Logocarousel({Key? key}) : super(key: key);

  @override
  State<Logocarousel> createState() => _LogocarouselState();
}

class _LogocarouselState extends State<Logocarousel> {
  @override
  final List<String> imgList = [
    'https://mbrellabd.com/storage/images/sub-group/1641469634.jpg',
    'https://mbrellabd.com/storage/images/sub-group/1641469607.jpg',
    'https://mbrellabd.com/storage/images/sub-group/1641442574.jpg',
    'https://mbrellabd.com/storage/images/sub-group/1641469879.jpg',
    'https://mbrellabd.com/storage/images/sub-group/1669461123.jpg',
    'https://mbrellabd.com/storage/images/sub-group/1650869273.png',
    'https://mbrellabd.com/storage/images/sub-group/1641442574.jpg',
    'https://mbrellabd.com/storage/images/sub-group/1641469523.jpg',
    'https://mbrellabd.com/storage/images/sub-group/1641469471.jpg',
    'https://mbrellabd.com/storage/images/sub-group/1640687565.jpg',
  ];


  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: (imgList.length / 3).ceil() * 3, // Ensures multiples of 4 for proper loop
      itemBuilder: (BuildContext context, int index, int realIndex) {
        int firstIndex = index % imgList.length;
        int secondIndex = (index + 1) % imgList.length;
        int thirdIndex = (index + 2) % imgList.length;
        // int fourthIndex = (index + 3) % imgList.length;
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildCarouselItem(context, firstIndex, imgList),
            const SizedBox(width: 10),
            _buildCarouselItem(context, secondIndex, imgList),
            const SizedBox(width: 10),
            _buildCarouselItem(context, thirdIndex, imgList),
            // const SizedBox(width: 10),
            // _buildCarouselItem(context, fourthIndex, imgList),
          ],
        );
      },
      options: CarouselOptions(
        height: 155.0,
        aspectRatio: 16 / 12,
        viewportFraction: 0.85,
        initialPage: 0,
        enableInfiniteScroll: true,
        // reverse: true,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        pauseAutoPlayOnTouch: true,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
        onPageChanged: (index, reason) {
          // print('Page changed to $index because $reason');
        },
        pageSnapping: true,
        scrollPhysics: const BouncingScrollPhysics(),
        disableCenter: false,
      ),
    );
  }

  Widget _buildCarouselItem(BuildContext context, int index, List<String> imgList) {
    return Expanded(
      child: Column(
        children: [
          const SizedBox(height: 12,),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  offset: const Offset(10, 10),
                  blurRadius: 2.0,
                  spreadRadius: -5.0,
                ),
              ],
              borderRadius: const BorderRadius.all(Radius.circular(50)),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(50)),
              child: FadeInImage.assetNetwork(
                placeholder: 'assets/loading2.gif',
                image: imgList[index % imgList.length], // Ensure index wraps around
                imageErrorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                  return Image.asset(
                    'assets/loading2.gif',
                    fit: BoxFit.cover, height: 98,width: 98,
                  );
                },
                fit: BoxFit.contain, height: 98,width: 98,
              ),
            ),
          ),
          const Text('Title goes here')
        ],
      ),
    );
  }


}
