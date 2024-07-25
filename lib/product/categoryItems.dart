import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mbrella/product/singleItem.dart';
import 'package:motion_tab_bar/MotionTabBar.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';
import '../includes/productAppBar.dart';
import '../includes/utility.dart';
import 'package:badges/badges.dart' as badges;

import '../main.dart';

class CategoryItems extends StatefulWidget {
  const CategoryItems({Key? key}) : super(key: key);

  @override
  State<CategoryItems> createState() => _CategoryItemsState();
}

class _CategoryItemsState extends State<CategoryItems> with SingleTickerProviderStateMixin {
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

  var page= 1;
  MotionTabBarController? _motionTabBarController;

  @override
  void initState() {
    super.initState();
    _motionTabBarController = MotionTabBarController(
      initialIndex: 0, length: 5, vsync: this,
    );
  }

  // Helper method to get tab label based on index
  String _getTabLabel(int index) {
    return ["Home","Products", "Favourite", "My Cart",  "Account"][index];
  }

  @override
  void dispose() {
    super.dispose();
    _motionTabBarController!.dispose();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: const ProductAppBar(title: 'product app bar',),
      body: Column(
        children: [
          Container(
            height: 30,
            decoration: BoxDecoration(
              color: Colors.yellow.withOpacity(0.3),
              border: Border(
                bottom: BorderSide(
                  width: 2, color: Colors.deepOrange.withOpacity(0.3),
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SizedBox(
                    height: 30,
                    child: Stack(
                      children: [
                        ClipPath(
                          clipper: CustomClipperPath(),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.yellow.withOpacity(0.8),
                              gradient: LinearGradient(
                                colors: [
                                  Colors.orange.withOpacity(0.5),
                                  Colors.orange.withOpacity(0.3),
                                  Colors.orange.withOpacity(0.5),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                              border: Border(
                                right: BorderSide( width: 1,
                                  color: Colors.orange.withOpacity(0.2),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: InkWell(
                            onTap: () {
                              Utility.openFilterModal(context);
                            },
                            child: const Row(
                              children: [
                                SizedBox(width: 40, height: 30),
                                Icon(Icons.filter_list, size: 17),
                                Text(' Filters'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 30,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: const Row(
                      children: [
                        SizedBox(width: 40),
                        FaIcon(FontAwesomeIcons.sort,size: 14, color: Colors.black45,),
                        Text(' Sorting'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: Column(
              children: [
                Expanded( // Wrap the GridView.builder with Expanded
                  child: GridView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 1),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Number of items per row
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: imgList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
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
                                bottom: 0, left: 50,right: 0,top: 80,
                                child: Row(
                                  children: [
                                    Container(
                                      width: 35,  height: 35,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: Colors.yellow.withOpacity(0.5),
                                        shape: BoxShape.circle,
                                        border: Border.all(width: 1, color: Colors.white),
                                      ),
                                      child: IconButton(
                                        onPressed: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductPage()));
                                        },
                                        icon: const Icon(Icons.saved_search_outlined, color: Colors.black),
                                        iconSize: 20, // Adjust icon size if needed
                                      ),
                                    ),
                                    const SizedBox(width: 7),
                                    Container(
                                      width: 35,  height: 35,
                                      alignment: Alignment.center, // Center the IconButton
                                      decoration: BoxDecoration(
                                        color: Colors.yellow.withOpacity(0.5),
                                        shape: BoxShape.circle, // Make the container circular
                                        border: Border.all(width: 1, color: Colors.white),
                                      ),
                                      child: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.favorite_outline_rounded, color: Colors.black),
                                        iconSize: 20, // Adjust icon size if needed
                                      ),
                                    ),
                                    const SizedBox(width: 7),
                                    Container(
                                      width: 35,height: 35,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: Colors.yellow.withOpacity(0.5),
                                        shape: BoxShape.circle,
                                        border: Border.all(width: 1, color: Colors.white),
                                      ),
                                      child: IconButton(
                                        onPressed: () {
                                          Utility.getToast(
                                            context,
                                            Icons.check_outlined,
                                            Colors.yellow,
                                            Colors.green,
                                            Colors.white,
                                            'Add to cart success',
                                            'The item has been added to your cart',
                                          );
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
              ],
            ),
          ),

        ],
      ),
      bottomNavigationBar: MotionTabBar(
        controller: _motionTabBarController,
        initialSelectedTab: _getTabLabel(page),
        useSafeArea: false,
        labels: const ["Home","Products", "Favourite", "My Cart",  "Account"],
        icons: const [
          Icons.home_outlined, Icons.list,  Icons.favorite_border, Icons.shopping_bag_outlined, Icons.perm_identity,
        ],
        // Optional badges
        badges: const [
          null,  null, null,badges.Badge(
            badgeContent: Text(
              '4', style: TextStyle(color: Colors.white),
            ),
          ), null,
        ],
        tabSize: 50,
        tabBarHeight: 55,
        textStyle: TextStyle(
          fontSize: 12,
          color: Colors.yellow.withOpacity(0.8),
          fontWeight: FontWeight.w500,
        ),
        tabIconColor: Colors.yellow.withOpacity(0.8),
        tabIconSize: 28.0,
        tabIconSelectedSize: 26.0,
        tabSelectedColor: Colors.yellow.withOpacity(0.2),
        tabIconSelectedColor: Colors.white,
        tabBarColor: Colors.black.withOpacity(0.4),
        onTabItemSelected: (int value) {
          setState(() {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp(page: value)));
          });
        },
      )
    );
  }
}
