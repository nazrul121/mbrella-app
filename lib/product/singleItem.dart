import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:motion_tab_bar/MotionTabBar.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';
import 'package:widget_zoom/widget_zoom.dart';
import 'package:badges/badges.dart' as badges;
import '../includes/productAppBar.dart';
import '../main.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> with SingleTickerProviderStateMixin{
  final List<String> imgList = [
    'https://mbrellabd.com/storage/images/sub-group/1641469634.jpg',
    'https://mbrellabd.com/storage/images/sub-group/1641469607.jpg',
    'https://mbrellabd.com/storage/images/sub-group/1641442574.jpg',
    'https://mbrellabd.com/storage/images/slider/1703078518.jpg',
    'https://mbrellabd.com/storage/images/slider/1713607928.jpg',
    'https://mbrellabd.com/storage/images/sub-group/1650869273.png',
    'https://mbrellabd.com/storage/images/sub-group/1641442574.jpg',
    'https://mbrellabd.com/storage/images/sub-group/1641469523.jpg',
    'https://mbrellabd.com/storage/images/sub-group/1641469471.jpg',
    'https://mbrellabd.com/storage/images/sub-group/1640687565.jpg',
  ];

  int _current = 0;
  final CarouselController _controller = CarouselController();

  final productColors = ['Red', 'Blue', 'Green', 'Yellow'];
  final productSizes = ['S', 'M', 'L', 'XL'];

  String? selectedColor;
  String? selectedSize;

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
      appBar: const ProductAppBar(title: 'Product title goes here'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              items: imgList.asMap().entries.map((entry) {
                return GestureDetector(
                  child: Center(
                    child: Stack(
                      children: [
                        WidgetZoom(
                          heroAnimationTag: entry.key,
                          zoomWidget: Image.network( entry.value ),
                        )
                      ],
                    ),
                  ),
                );
              }).toList(),
              carouselController: _controller,
              options: CarouselOptions(
                autoPlay: false,
                enlargeCenterPage: true,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                },
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imgList.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () {
                      _controller.animateToPage(entry.key);
                    },
                    child: Container(
                      width: 80, height: 80,
                      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: _current == entry.key ? Colors.yellow : Colors.grey,
                          width: 3.0,
                        ),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: ClipOval(
                        child: Image.network(entry.value, fit: BoxFit.cover,  ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 16.0),
            const Text(  'Product Name',
              style: TextStyle( fontSize: 24.0,fontWeight: FontWeight.bold,),
            ),
            const SizedBox(height: 8.0),
            const Text( '\$99.99',
              style: TextStyle( fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.green,),
            ),
            const SizedBox(height: 16.0),
            const Text( 'Colors',
              style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold, ),
            ),
            const SizedBox(height: 8.0),

            Row(
              children: productColors.map((color) {
                bool isSelected = selectedColor == color; // Check if current color is selected
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedColor = isSelected ? null : color; // Toggle selection
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 8.0),
                    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.yellow.withOpacity(0.5) : Colors.yellow.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border(
                        bottom: BorderSide(width: 1, color: isSelected ? Colors.deepOrange : Colors.deepOrange.withOpacity(0.5)),
                      ),
                    ),
                    child: Text( color,
                      style: TextStyle(
                        color: isSelected ? Colors.black : Colors.black,
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),


            const SizedBox(height: 16.0),
            const Text('Sizes', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold,) ),
            const SizedBox(height: 8.0),
            Row(
              children: productSizes.map((size) {
                bool isSelected = selectedSize == size;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedSize = isSelected ? null : size; // Toggle selection
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 8.0),
                    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.yellow.withOpacity(0.5) : Colors.yellow.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border(
                        bottom: BorderSide(width: 1, color: isSelected ? Colors.deepOrange : Colors.deepOrange.withOpacity(0.5)),
                      ),
                    ),
                    child: Text( size,
                      style: TextStyle(
                        color: isSelected ? Colors.black : Colors.black,
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 16.0),
            const Text( 'Product Code: ABC123', style: TextStyle( fontSize: 16.0, ) ),
            const SizedBox(height: 8.0),
            const Text('SKU: 987654321', style: TextStyle(fontSize: 16.0,),  ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Add to cart action
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black, backgroundColor: Colors.yellow.withOpacity(0.6),
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                    ),
                    child: const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.shopping_bag_outlined, size: 17,),
                        Text(' Add to Cart',style: TextStyle(fontSize: 17),)
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16.0),
                IconButton(
                  onPressed: () {
                    // Favorite action
                  },
                  icon: const Icon(Icons.favorite_border),
                  color: Colors.red,
                  iconSize: 32.0,
                ),
              ],
            ),
          ],
        ),
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

