import 'package:flutter/material.dart';
import 'package:mbrella/home.dart';
import 'package:motion_tab_bar/MotionTabBar.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';
import 'includes/appBar.dart';
import 'includes/drawer.dart';
import 'package:badges/badges.dart' as badges;

void main(){
  runApp(MyApp(page: 0,));
}

class MyApp extends StatefulWidget {
  var page;
  MyApp({required this.page,super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin{
  late int page;
  final int _badgeCount = 5;
  MotionTabBarController? _motionTabBarController;

  @override
  void initState() {
    super.initState();
    page = widget.page;

    _motionTabBarController = MotionTabBarController(
      initialIndex: page,
      length: 5, // Number of tabs
      vsync: this,
    );
  }

  // Helper method to get tab label based on index
  String _getTabLabel(int index) {
    return ["Home", "Product", "Favourite", "My Cart", "Account"][index];
  }

  @override
  void dispose() {
    super.dispose();
    _motionTabBarController!.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: const CustomDrawer(),
        appBar: const appBarInfo(title: 'Mbrella ltd',),
        body: HomeScreen(page: page),
        bottomNavigationBar: MotionTabBar(
          controller: _motionTabBarController,
          initialSelectedTab: _getTabLabel(page),
          useSafeArea: false,
          labels: const ["Home", "Product", "Favourite", "My Cart", "Account"],
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
              _motionTabBarController?.index = value;
              page = value;
            });
          },
        )
      ),
    );
  }
}


