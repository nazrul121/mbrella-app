import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/widgets.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {


  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      color: Colors.yellow.withOpacity(0.1),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          offset: const Offset(0, 5),
                          blurRadius: 4,spreadRadius:2,
                        ),
                      ],
                      border: const Border(
                        top: BorderSide(width: 2, color: Colors.yellow),
                        left: BorderSide(width: 2, color: Colors.yellow),
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(50))
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.yellow.withOpacity(0.5), radius: 50,
                      backgroundImage: const NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRm7WBp_psWIHuSlNMvcSVhtECyPEoP3tFFkaczvsuaFl1F1QVc-Y9874DiiIN84jidBvo&usqp=CAU'),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Center(
                  child: Text( 'Nazrul Islam',
                    style: TextStyle( fontSize: 24, fontWeight: FontWeight.bold, ),
                  ),
                ),

              ],
            ),
          ),

          const SizedBox(height: 1.0),

          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 160,
                decoration: BoxDecoration(
                  color: Colors.orange.withOpacity(0.5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      offset: const Offset(-5, 5),
                      blurRadius: 4,  spreadRadius:2,
                    ),
                  ],
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      badges.Badge(
                        badgeContent: Text(
                          '5', style: TextStyle(color: Colors.white),
                        ),
                        child: Icon(Icons.shopping_bag_outlined, size: 30, color: Colors.white,),
                      ),
                      SizedBox(height: 12.0),
                      Text('Total Orders',
                        style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold,color: Colors.white ),
                      )

                    ],
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                width: 160,
                decoration: BoxDecoration(
                  color: Colors.orange.withOpacity(0.5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      offset: const Offset(5, 5),
                      blurRadius: 4,spreadRadius:2,
                    ),
                  ],
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      badges.Badge(
                        badgeStyle: badges.BadgeStyle(
                          badgeColor: Colors.green,
                        ),
                        badgeContent: Text(
                          '2', style: TextStyle(color: Colors.white),
                        ),
                        child: Icon(Icons.shopping_bag_outlined, size: 30, color: Colors.white,),
                      ),
                      SizedBox(height: 12.0),
                      Text('Delivered ',
                        style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold,color: Colors.white ),
                      )

                    ],
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 24.0),

          Container(
            width: 330,
            decoration: BoxDecoration(
              color: Colors.orange.withOpacity(0.5),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  offset: const Offset(0, 5),
                  blurRadius: 4,  spreadRadius:5,
                ),
              ],
            ),
            child:  Padding(
              padding: const EdgeInsets.all(16.0),
              child:  RichText(
                text: const TextSpan(
                  children: <TextSpan>[
                    TextSpan(text: 'You have total of ',
                      style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold,color: Colors.white ),
                    ),
                    TextSpan(text: ' 2 ', style: TextStyle(color: Colors.blue, fontSize: 50, fontWeight: FontWeight.bold)),
                    TextSpan(text: ' shipping address', style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold,color: Colors.white ),)
                  ],
                ),
                textScaleFactor: 0.5,
              )
            ),
          ),

        ],
      ),
    );
  }
}


