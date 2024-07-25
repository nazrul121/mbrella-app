import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
class HomeCaurosal extends StatefulWidget {
  const HomeCaurosal({Key? key}) : super(key: key);

  @override
  State<HomeCaurosal> createState() => _HomeCaurosalState();
}

class _HomeCaurosalState extends State<HomeCaurosal> {


  final List<String> sliderList = [
    'https://mbrellabd.com/storage/images/slider/1703078518.jpg',
    'https://mbrellabd.com/storage/images/slider/1713607928.jpg',
    'https://mbrellabd.com/storage/images/slider/1703073000.jpg',
    'https://mbrellabd.com/storage/images/slider/1703078461.jpg',
    'https://mbrellabd.com/storage/images/slider/1703078442.webp',
    // Add more image URLs as needed
  ];


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            offset: const Offset(0,2),
            blurRadius:7, spreadRadius: 3,
          ),
        ],
        color: Colors.white.withOpacity(0.1),

      ),
      child: CarouselSlider.builder(
        itemCount: sliderList.length,
        options: CarouselOptions(
            height: 190,
            initialPage: 0,
            enableInfiniteScroll: false,
            enlargeCenterPage: true,
            viewportFraction: 1.0, // Adjust as needed
            aspectRatio: 16 / 16, // Adjust as needed
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            scrollPhysics: const ClampingScrollPhysics(),
            scrollDirection: Axis.vertical
        ),
        itemBuilder: (BuildContext context, int index, int realIndex) {
          return ListView(
            children: [
              FadeInImage.assetNetwork(
                placeholder: 'assets/loading.gif',
                image:  sliderList[index],
                imageErrorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                  return Image.asset(
                    'assets/loading.gif',
                    fit: BoxFit.cover, width: 200, height: 200,
                  );
                },
                fit: BoxFit.cover, width: 200, height: 200,
              ),
              // Image.network(
              //   sliderList[index],
              //   height: 200, // Adjust image height as needed
              //   fit: BoxFit.cover,
              // ),
            ],
          );
        },
      ),
    ) ;
  }

}






class PromosionCaurosal extends StatefulWidget {
  const PromosionCaurosal({Key? key}) : super(key: key);

  @override
  State<PromosionCaurosal> createState() => _PromosionCaurosalState();
}

class _PromosionCaurosalState extends State<PromosionCaurosal> {
  final int highlightedIndex = 1;

  final List<String> sliderList = [
    'https://mbrellabd.com/storage/images/promotion/1715072506.jpg',
    // Add more image URLs as needed
  ];


  @override
  Widget build(BuildContext context) {
    return Container(
        child: CarouselSlider.builder(
          itemCount: sliderList.length,
          options: CarouselOptions(
            height: 180,
            autoPlay: true,
            aspectRatio: 2.0,
            enlargeCenterPage: true,
            reverse: true
          ),
          itemBuilder: (context, index, realIdx) {
            return Container(
              child: Wrap(
                children: [
                  Center(
                      child: Image.network(sliderList[index], fit: BoxFit.cover, width: 2000)
                  ),
                  Center(
                    child: Text('One'),
                  )
                ],
              ),
            );
          },
        )
    ) ;
  }

}
