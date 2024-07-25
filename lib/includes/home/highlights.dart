import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../utility.dart';

class HighlightItems extends StatefulWidget {
  const HighlightItems({Key? key}) : super(key: key);

  @override
  State<HighlightItems> createState() => _HighlightItemsState();
}

class _HighlightItemsState extends State<HighlightItems> {

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
    return SingleChildScrollView(
      child: Column(
        children: [


          Container(
            padding: const EdgeInsets.only(left: 20, top:15, bottom: 10,right: 20),
            color:Colors.white,
            child: const Row(
              children: [
                Text('New Products', style: TextStyle(fontSize: 19),),
                Spacer(),
                Text('View all'),
              ],
            ),

          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [ Colors.transparent, Colors.deepOrange.withOpacity(0.2), Colors.white,],
              ),
            ),
            padding: const EdgeInsets.only(bottom: 20,top: 10),
            child: CarouselSlider.builder(
              itemCount: (imgList.length / 2).ceil(), // Show 2 images per iteration
              options: CarouselOptions(
                height: 250.0,
                initialPage: 0,
                enableInfiniteScroll: true,
                enlargeCenterPage: true,

                viewportFraction: 0.89, // Adjust as needed
                aspectRatio: 16 / 12, // Adjust as needed
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 5),
                reverse: true,
              ),
              itemBuilder: (BuildContext context, int index, int realIndex) {
                int firstIndex = index * 2;
                int secondIndex = firstIndex + 1;

                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            decoration:BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    offset: const Offset(-10, 10), // Adjust the shadow direction
                                    blurRadius: 2.0,
                                    spreadRadius: -5.0,
                                  ),
                                ],
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(30),
                                )

                            ),
                            // padding: const EdgeInsets.all(8),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                              ),
                              child: FadeInImage.assetNetwork(
                                placeholder: 'assets/loading.gif',
                                image: secondIndex < imgList.length ? imgList[firstIndex] : '',
                                imageErrorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                  return Image.asset(
                                    'assets/loading.gif',
                                    fit: BoxFit.fitHeight,height: 250,
                                  );
                                },
                                fit: BoxFit.fitHeight,height: 250,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0, left: 0, right: -110, top: 50,
                            child: Column(
                              children: [
                                Container(
                                  width: 35,  height: 35,
                                  alignment: Alignment.center, // Center the IconButton
                                  decoration: BoxDecoration(
                                    color: Colors.yellow.withOpacity(0.5),
                                    shape: BoxShape.circle, // Make the container circular
                                  ),
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.saved_search_outlined, color: Colors.black),
                                    iconSize: 20, // Adjust icon size if needed
                                  ),
                                ),

                                const SizedBox(height: 7),

                                Container(
                                  width: 35,  height: 35,
                                  alignment: Alignment.center, // Center the IconButton
                                  decoration: BoxDecoration(
                                    color: Colors.yellow.withOpacity(0.5),
                                    shape: BoxShape.circle, // Make the container circular
                                  ),
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.favorite_outline_rounded, color: Colors.black),
                                    iconSize: 20, // Adjust icon size if needed
                                  ),
                                ),
                                const SizedBox(height: 7),
                                Container(
                                  width: 35,  height: 35,
                                  alignment: Alignment.center, // Center the IconButton
                                  decoration: BoxDecoration(
                                    color: Colors.yellow.withOpacity(0.5),
                                    shape: BoxShape.circle, // Make the container circular
                                  ),
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.shopping_bag_outlined, color: Colors.black),
                                    iconSize: 20, // Adjust icon size if needed
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Positioned(
                            bottom: 0, left: 0, right: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(30),
                                ),
                                color: Colors.black.withOpacity(0.5),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    spreadRadius: 2,  blurRadius: 5,
                                    offset: const Offset(0, 3), // Shadow position
                                  ),
                                ],
                                // gradient: LinearGradient(
                                //   begin: Alignment.topCenter,
                                //   end: Alignment.bottomCenter,
                                //   colors: [
                                //     Colors.transparent,
                                //     Colors.black.withOpacity(0.5),
                                //   ],
                                // ),
                              ),
                              child: Text(
                                '  Title ${firstIndex + 1}', // Example title text
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 13), // Add distance between images
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            decoration:BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    offset: const Offset(10, 10), // Opposite direction shadow
                                    blurRadius: 2.0,
                                    spreadRadius: -5,
                                  ),
                                ],
                                borderRadius: const BorderRadius.only(
                                  bottomRight: Radius.circular(30),
                                )

                            ),
                            // padding: const EdgeInsets.all(8),
                            child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  bottomRight: Radius.circular(30),
                                  topLeft: Radius.circular(30),
                                ),
                                child: FadeInImage.assetNetwork(
                                  placeholder: 'assets/loading.gif',
                                  image: secondIndex < imgList.length ? imgList[secondIndex] : '',
                                  imageErrorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                    return Image.asset(
                                      'assets/loading.gif',
                                      fit: BoxFit.fitHeight,height: 250,
                                    );
                                  },
                                  fit: BoxFit.fitHeight,height: 250,
                                )
                            ),
                          ),

                          Positioned(
                            bottom: 0, left: 0, right: 0, top: 120,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 35, // Set a smaller width
                                  height: 35, // Set a smaller height
                                  alignment: Alignment.center, // Center the IconButton
                                  decoration: BoxDecoration(
                                    color: Colors.yellow.withOpacity(0.5),
                                    shape: BoxShape.circle, // Make the container circular
                                  ),
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.saved_search_outlined, color: Colors.black),
                                    iconSize: 20, // Adjust icon size if needed
                                  ),
                                ),

                                const SizedBox(width: 7),

                                Container(
                                  width: 35,  height: 35,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.yellow.withOpacity(0.5),
                                    shape: BoxShape.circle, // Make the container circular
                                  ),
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.favorite_outline_rounded, color: Colors.black),
                                    iconSize: 20, // Adjust icon size if needed
                                  ),
                                ),

                                const SizedBox(width: 7),

                                Container(
                                  width: 35, // Set a smaller width
                                  height: 35, // Set a smaller height
                                  alignment: Alignment.center, // Center the IconButton
                                  decoration: BoxDecoration(
                                    color: Colors.yellow.withOpacity(0.5),
                                    shape: BoxShape.circle, // Make the container circular
                                  ),
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.shopping_bag_outlined, color: Colors.black),
                                    iconSize: 20, // Adjust icon size if needed
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Positioned(
                            bottom: 0, left: 0, right: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  bottomRight: Radius.circular(30),
                                ),
                                color: Colors.black.withOpacity(0.5),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    spreadRadius: 2,  blurRadius: 5,
                                    offset: const Offset(0, 3), // Shadow position
                                  ),
                                ],
                                // gradient: LinearGradient(
                                //   begin: Alignment.topCenter,
                                //   end: Alignment.bottomCenter,
                                //   colors: [
                                //     Colors.transparent,
                                //     Colors.black.withOpacity(0.5),
                                //   ],
                                // ),
                              ),
                              child: Text(
                                '  Title ${secondIndex + 1}', // Example title text
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),

          ),



          Container(
            padding: const EdgeInsets.only(left: 20, top:15, bottom: 10,right: 20),
            color:Colors.white,
            child: const Row(
              children: [
                Text('Best selling Products', style: TextStyle(fontSize: 19),),
                Spacer(),
                Text('View all'),
              ],
            ),

          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.deepOrange.withOpacity(0.2),
                  Colors.white,
                ],
              ),
            ),
            padding: const EdgeInsets.only(bottom: 20,top: 10),
            child: CarouselSlider.builder(
              itemCount: (imgList.length / 2).ceil(), // Show 2 images per iteration
              options: CarouselOptions(
                height: 250.0,
                initialPage: 0,
                enableInfiniteScroll: true,
                enlargeCenterPage: true,
                viewportFraction: 0.89, // Adjust as needed
                aspectRatio: 16 / 12, // Adjust as needed
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 5),
                reverse: false,
              ),
              itemBuilder: (BuildContext context, int index, int realIndex) {
                int firstIndex = index * 2;
                int secondIndex = firstIndex + 1;

                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            decoration:BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    offset: const Offset(-10, 10), // Adjust the shadow direction
                                    blurRadius: 2.0,
                                    spreadRadius: -5.0,
                                  ),
                                ],
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(30),
                                )

                            ),
                            // padding: const EdgeInsets.all(8),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                              ),
                              child: FadeInImage.assetNetwork(
                                placeholder: 'assets/loading.gif',
                                image: secondIndex < imgList.length ? imgList[firstIndex] : '',
                                imageErrorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                  return Image.asset(
                                    'assets/loading.gif',
                                    fit: BoxFit.fitHeight,height: 250,
                                  );
                                },
                                fit: BoxFit.fitHeight,height: 250,
                              ),
                              // Image.network(
                              //   secondIndex < imgList.length ? imgList[firstIndex] : '',
                              //   fit: BoxFit.cover,
                              // ),
                            ),
                          ),
                          Positioned(
                            bottom: 0, left: 0, right: -110, top: 50,
                            child: Column(
                              children: [
                                Container(
                                  width: 35,  height: 35,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.yellow.withOpacity(0.5),
                                      shape: BoxShape.circle,
                                      border: Border.all(width: 1,color: Colors.white)
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      Utility.getToast(context, Icons.check_outlined, Colors.yellow, Colors.green, Colors.white,
                                          'Add to cart success', 'The item has been added to your cart');
                                    },
                                    icon: const Icon(Icons.saved_search_outlined, color: Colors.black),
                                    iconSize: 20, // Adjust icon size if needed
                                  ),
                                ),

                                const SizedBox(height: 7),

                                Container(
                                  width: 35,  height: 35,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.yellow.withOpacity(0.5),
                                      shape: BoxShape.circle,
                                      border: Border.all(width: 1,color: Colors.white)
                                  ),
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.favorite_outline_rounded, color: Colors.black),
                                    iconSize: 20, // Adjust icon size if needed
                                  ),
                                ),
                                const SizedBox(height: 7),
                                Container(
                                  width: 35,  height: 35,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.yellow.withOpacity(0.5),
                                      shape: BoxShape.circle,
                                      border: Border.all(width: 1,color: Colors.white)
                                  ),
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.shopping_bag_outlined, color: Colors.black),
                                    iconSize: 20, // Adjust icon size if needed
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Positioned(
                            bottom: 0, left: 0, right: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(30),
                                ),
                                color: Colors.black.withOpacity(0.5),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    spreadRadius: 2,  blurRadius: 5,
                                    offset: const Offset(0, 3), // Shadow position
                                  ),
                                ],
                              ),
                              child: Text(
                                '  Title ${firstIndex + 1}', // Example title text
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 13), // Add distance between images
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            decoration:BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    offset: const Offset(10, 10), // Opposite direction shadow
                                    blurRadius: 2.0,
                                    spreadRadius: -5,
                                  ),
                                ],
                                borderRadius: const BorderRadius.only(
                                  bottomRight: Radius.circular(30),
                                )

                            ),
                            // padding: const EdgeInsets.all(8),
                            child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  bottomRight: Radius.circular(30),
                                  topLeft: Radius.circular(30),
                                ),
                                child: FadeInImage.assetNetwork(
                                  placeholder: 'assets/loading.gif',
                                  image: secondIndex < imgList.length ? imgList[secondIndex] : '',
                                  imageErrorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                    return Image.asset(
                                      'assets/loading.gif',
                                      fit: BoxFit.fitHeight,height: 250,
                                    );
                                  },
                                  fit: BoxFit.fitHeight,height: 250,
                                )
                            ),
                          ),

                          Positioned(
                            bottom: 0, left: 0, right: 0, top: 120,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                Container(
                                  width: 35,  height: 35,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.yellow.withOpacity(0.5),
                                      shape: BoxShape.circle,
                                      border: Border.all(width: 1,color: Colors.white)
                                  ),
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.saved_search_outlined, color: Colors.black),
                                    iconSize: 20, // Adjust icon size if needed
                                  ),
                                ),

                                const SizedBox(width: 7),

                                Container(
                                  width: 35, height: 35,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.yellow.withOpacity(0.5),
                                      shape: BoxShape.circle,
                                      border: Border.all(width: 1,color: Colors.white)
                                  ),
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.favorite_outline_rounded, color: Colors.black),
                                    iconSize: 20, // Adjust icon size if needed
                                  ),
                                ),

                                const SizedBox(width: 7),

                                Container(
                                  width: 35,  height: 35,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.yellow.withOpacity(0.5),
                                      shape: BoxShape.circle,
                                      border: Border.all(width: 1,color: Colors.white)
                                  ),
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.shopping_bag_outlined, color: Colors.black),
                                    iconSize: 20, // Adjust icon size if needed
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Positioned(
                            bottom: 0, left: 0, right: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  bottomRight: Radius.circular(30),
                                ),
                                color: Colors.black.withOpacity(0.5),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    spreadRadius: 2,  blurRadius: 5,
                                    offset: const Offset(0, 3), // Shadow position
                                  ),
                                ],
                                // gradient: LinearGradient(
                                //   begin: Alignment.topCenter,
                                //   end: Alignment.bottomCenter,
                                //   colors: [
                                //     Colors.transparent,
                                //     Colors.black.withOpacity(0.5),
                                //   ],
                                // ),
                              ),
                              child: Text(
                                '  Title ${secondIndex + 1}', // Example title text
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),

          ),

        ],
      ),
    );
  }
}
