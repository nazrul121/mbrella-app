import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:mbrella/checkout/process.dart';
import '../includes/productAppBar.dart';
import 'package:motion_tab_bar/MotionTabBar.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';

import '../main.dart';

class Checkout extends StatefulWidget {
  var page;
  Checkout({required this.page,super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> with SingleTickerProviderStateMixin{
  late int _page;
  MotionTabBarController? _motionTabBarController;

  @override
  void initState() {
    super.initState();
    _page = widget.page;

    if(_page==0){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp(page: 0)));
    }
    _motionTabBarController = MotionTabBarController(
      initialIndex: _page,
      length: 5, // Number of tabs
      vsync: this,
    );
  }

  // Helper method to get tab label based on index
  String _getTabLabel(int index) {
    return ["Home", "My Cart", "Billing", "Shipping", "Place order"][index];
  }

  @override
  void dispose() {
    super.dispose();
    _motionTabBarController!.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ProductAppBar(title: 'Checkout'),
      body: ProcessCheckout(page: _page),
      bottomNavigationBar: MotionTabBar(
        controller: _motionTabBarController,
        initialSelectedTab: _getTabLabel(_page),
        useSafeArea: false,
        labels: const ["Home", "My Cart", "Billing", "Shipping", "Place order"],
        icons: const [
          Icons.home_outlined, Icons.shopping_bag_outlined,  Icons.payments_outlined, Icons.fire_truck, Icons.check
        ],
        // Optional badges
        badges: const [
          null,
          badges.Badge(
            badgeContent: Text(
              '4', style: TextStyle(color: Colors.white),
            ),
          ),
          null,  null, null,
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
            _page = value;
            if(value==0){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp(page: 0)));
            }
          });
        },
      )
    );
  }


}
