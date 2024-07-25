import 'package:flutter/material.dart';

import '../utility.dart';

class FavouriteItems extends StatefulWidget {
  const FavouriteItems({Key? key}) : super(key: key);

  @override
  State<FavouriteItems> createState() => _FavouriteItemsState();
}

class _FavouriteItemsState extends State<FavouriteItems> {
  final List<String> imgList = [
    'https://mbrellabd.com/storage/images/sub-group/1641469634.jpg',
    'https://mbrellabd.com/storage/images/sub-group/1641442574.jpg',
    'https://mbrellabd.com/storage/images/sub-group/1669461123.jpg',
    'https://mbrellabd.com/storage/images/sub-group/1650869273.png',
    'https://mbrellabd.com/storage/images/sub-group/1641469523.jpg',
    'https://mbrellabd.com/storage/images/sub-group/1640687565.jpg',
    'https://mbrellabd.com/storage/images/sub-group/1669461123.jpg',
    'https://mbrellabd.com/storage/images/sub-group/1650869273.png',
    'https://mbrellabd.com/storage/images/sub-group/1641469523.jpg',
    'https://mbrellabd.com/storage/images/sub-group/1669461123.jpg',
    'https://mbrellabd.com/storage/images/sub-group/1650869273.png',
    'https://mbrellabd.com/storage/images/sub-group/1641469523.jpg',
    'https://mbrellabd.com/storage/images/sub-group/1640687565.jpg',
    'https://mbrellabd.com/storage/images/sub-group/1669461123.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          const Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.favorite,size: 20,),
              Text(' My favourite items',style: TextStyle(fontSize: 20),),
            ],
          ),
          const Divider(height: 15),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: GridView.builder(
              shrinkWrap: true, // Important to prevent unbounded height error
              physics: const NeverScrollableScrollPhysics(), // Disable GridView's own scrolling
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of items per row
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: imgList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // Handle the onTap event here
                    print('Tapped on ${imgList[index]}');
                  },
                  child: GridTile(
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(imgList[index]),
                              fit: BoxFit.cover,
                              onError: (error, stackTrace) {
                                // Handle image load error
                              },
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 50,
                          right: 0,
                          top: 80,
                          child: Row(
                            children: [
                              Container(
                                width: 35,
                                height: 35,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.yellow.withOpacity(0.5),
                                  shape: BoxShape.circle,
                                  border: Border.all(width: 1, color: Colors.white),
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    // Your onPressed logic
                                  },
                                  icon: const Icon(Icons.saved_search_outlined, color: Colors.black),
                                  iconSize: 20, // Adjust icon size if needed
                                ),
                              ),
                              const SizedBox(width: 7),
                              Container(
                                width: 35,
                                height: 35,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.yellow.withOpacity(0.5),
                                  shape: BoxShape.circle,
                                  border: Border.all(width: 1, color: Colors.white),
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    Utility.getToast(context, Icons.check_outlined, Colors.yellow, Colors.green, Colors.white,
                                        'Add to cart success', 'The item has been added to your cart');
                                  },
                                  icon: const Icon(Icons.shopping_bag_outlined, color: Colors.black),
                                  iconSize: 20, // Adjust icon size if needed
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const Text('Check out now'),
        ],
      ),
    );
  }
}
