import 'package:flutter/material.dart';
import 'package:mbrella/checkout/checkout.dart';
import '../includes/utility.dart';



class MyCart extends StatefulWidget {
  const MyCart({Key? key}) : super(key: key);

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {

  final List<Map<String, dynamic>> imgList = [
    {'imageUrl': 'https://mbrellabd.com/storage/images/sub-group/1641469634.jpg', 'quantity': 1},
    {'imageUrl': 'https://mbrellabd.com/storage/images/sub-group/1641442574.jpg', 'quantity': 1},
    {'imageUrl': 'https://mbrellabd.com/storage/images/sub-group/1669461123.jpg', 'quantity': 1},
    {'imageUrl': 'https://mbrellabd.com/storage/images/sub-group/1650869273.png', 'quantity': 1},
    {'imageUrl': 'https://mbrellabd.com/storage/images/sub-group/1641469523.jpg', 'quantity': 1},
  ];

  void _increaseQuantity(int index) {
    setState(() {
      imgList[index]['quantity']++;
    });
  }

  void _decreaseQuantity(int index) {
    setState(() {
      if (imgList[index]['quantity'] > 1) {
        imgList[index]['quantity']--;
      }
    });
  }

  void _removeItem(int index) {
    setState(() {
      imgList.removeAt(index);
    });
  }

  void check_method() async{
    Utility.getToast(context, Icons.telegram, Colors.red, Colors.blue, Colors.white, 'title', 'description');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: MediaQuery.of(context).size.height *0.6,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.yellow.withOpacity(0.1), Colors.white,
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.white,
                offset: Offset(0, 5),
                blurRadius: 4,spreadRadius:2,
              ),
            ],
          ),
          child: ListView.builder(
            itemCount: imgList.length,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Card(
                    margin: const EdgeInsets.only(bottom:8),
                    child: Container(
                      // color:Colors.white,
                      padding: const EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Image.network(
                            imgList[index]['imageUrl'],
                            width: 80, height: 80,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(  'Item ${index + 1}',
                                  style: const TextStyle( fontSize: 16, fontWeight: FontWeight.bold, ),
                                ),
                                const SizedBox(height: 5),
                                const Text( '\$19.99',
                                  style: TextStyle( fontSize: 16, color: Colors.grey, ),
                                ),
                              ],
                            ),
                          ),

                          Container(
                            decoration: const BoxDecoration(
                                color:Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(0))
                            ),
                            margin:const EdgeInsets.all(0),
                            child:Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.remove, color: Colors.orange),
                                  onPressed: () => _decreaseQuantity(index),
                                ),

                                Text(imgList[index]['quantity'].toString(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),

                                IconButton(
                                  icon: const Icon(Icons.add, color: Colors.green,),
                                  onPressed: () => _increaseQuantity(index),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top:0,
                    child: GestureDetector(
                      onTap: () => _removeItem(index),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.red.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(50)
                        ),
                        padding: const EdgeInsets.all(2),
                        child: const Icon(
                          Icons.cancel, color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),

        const SizedBox(height: 15),

        Container(
          padding: const EdgeInsets.all(16.0),
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            children: [
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Total of :'),
                    Text('\$ 5250.00',
                      style: TextStyle( fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Checkout(page: 2,)));
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.yellow.withOpacity(0.7),
                  padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                  textStyle: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold,
                  ),
                ),
                child: const Text('Checkout', style: TextStyle(color: Colors.black87),),
              ),
            ],
          ),
        )
      ],
    );
  }


}
