import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mbrella/account/profile.dart';
import 'package:mbrella/cart/my_cart.dart';
import 'package:mbrella/account/account.dart';
import 'package:mbrella/includes/category/list.dart';
import 'package:mbrella/includes/home/favourite.dart';
import 'package:mbrella/includes/home/highlights.dart';
import 'package:mbrella/includes/home/logoCarousel.dart';
import 'package:mbrella/includes/home/slider.dart';

import 'includes/utility.dart';

class HomeScreen extends StatefulWidget {
  final int page;
  const HomeScreen({super.key, required this.page});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  bool? isLoggedIn;

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();

  }

  Future<void> _checkLoginStatus() async {
    final loginStatus = await Utility.isLoggedIn();
    setState(() {
      isLoggedIn = loginStatus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: double.infinity,
      child: _buildChildWidget(),
    );
  }

  Widget _buildChildWidget() {
    if (widget.page == 0) {
      return SizedBox(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [

              const HomeCaurosal(),
              const SizedBox(height: 20,),
              const PromosionCaurosal(),
              const SizedBox(height: 5,),
              const Logocarousel(),

              const HighlightItems()
            ],
          ),
        ),
      );
    } else if (widget.page == 1) {
      return const SingleChildScrollView(
        child: Column(
          children: [
            Logocarousel(),
            CatList(),
          ],
        ),
      );
    } else if (widget.page == 2) {
      return const SingleChildScrollView(
        child: Column(
          children: [

            FavouriteItems(),
          ],
        ),
      );
    }else if (widget.page == 3) {
      return const SingleChildScrollView(
        child: MyCart()
      );
    }
    else if (widget.page == 4) {
      if(isLoggedIn==true){
        return const Profile();
      }else{
        return const Account();
      }
    } else {
      return Text('home ends');
    }
  }


}

