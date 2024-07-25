import 'package:flutter/material.dart';
import 'package:mbrella/account/dashboard.dart';
import 'package:mbrella/account/myProfile.dart';
import 'package:mbrella/account/order.dart';
import 'package:mbrella/account/shippings.dart';
import '../includes/utility.dart';
import '../main.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {});

    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
              border: Border(
                bottom: BorderSide(color: Colors.yellow.withOpacity(0.7))
              )
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      _tabController.animateTo(0);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      decoration: BoxDecoration(
                        color: _tabController.index == 0 ? Colors.yellow.withOpacity(0.4) : Colors.grey.shade300,

                      ),
                      child: Center(
                        child: Text('Dashboard',
                          style: TextStyle(
                            color: _tabController.index == 0 ? Colors.black.withOpacity(0.7) : Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      _tabController.animateTo(1);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      decoration: BoxDecoration(
                        color: _tabController.index == 1 ? Colors.yellow.withOpacity(0.4) : Colors.grey.shade300,

                      ),
                      child: Center(
                        child: Text('My Orders',
                          style: TextStyle(
                            color: _tabController.index == 1 ? Colors.black.withOpacity(0.7) : Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {

                      RenderBox renderBox = context.findRenderObject() as RenderBox;
                      var size = renderBox.size;
                      var offset = renderBox.localToGlobal(Offset.zero);

                      var position = RelativeRect.fromLTRB(
                        size.width - -0, //  pixels away from right edge
                        kToolbarHeight + 100, // 10 pixels below the AppBar
                        0, 0,
                      );

                      showMenu(
                        context: context,
                        position: position,

                        items: <PopupMenuEntry>[
                          PopupMenuItem(
                            child: InkWell(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                ),
                                child: const ListTile(
                                  leading: Icon(Icons.personal_injury),
                                  title: Text('My profile'),
                                ),
                              ),
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>  ProfileScreen()));
                              },
                            ),
                          ),
                          PopupMenuItem(
                            child: InkWell(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  ),
                                  child: const ListTile(
                                  leading: Icon(Icons.location_on_outlined),
                                  title: Text('Shipping addresses'),
                                  ),
                              ),
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>ShippingAddressList()));
                              },
                            )
                          ),
                          PopupMenuItem(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                              ),
                              child: const ListTile(
                                leading: Icon(Icons.lock_reset),
                                title: Text('Change Password'),
                              ),
                            ),
                          ),
                          PopupMenuItem(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                              ),
                              child: InkWell(
                                 onTap: () {
                                   Utility.setLoggedIn(false);
                                   Navigator.push(context, MaterialPageRoute(builder: (context)=>  MyApp(page: 4,)));
                                 },
                                 child: const ListTile(
                                   leading: Icon(Icons.logout_sharp),
                                   title: Text('Sign out'),
                                 ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.4),
                      ),
                      child: const Center(
                        child: Text( 'More', style: TextStyle(color: Colors.black, fontSize: 14,  ),  ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                Dashboard(),
                MyOrders(),
              ],
            ),
          ),
        ],
      );
  }
}
