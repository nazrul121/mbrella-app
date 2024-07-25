import 'package:flutter/material.dart';

import 'congrats.dart';

class Placeorder extends StatefulWidget {
  const Placeorder({Key? key}) : super(key: key);

  @override
  State<Placeorder> createState() => _PlaceorderState();
}

class _PlaceorderState extends State<Placeorder> {
  String _selectedDelivery = '1';
  String _selectedPayment = '1';

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(  'Delivery option',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),

          _buildDeliveryOption('Inside Dhaka'),
          const SizedBox(height: 10),
          _buildDeliveryOption('Outside Dhaka'),


          const SizedBox(height: 30),
          const Text(  'Payment options',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),

          _buildPaymentOption('Cash On Delivery'),
          const SizedBox(height: 10),
          _buildPaymentOption('Pay Online'),

          const SizedBox(height: 10),

          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>CongratulationPage()));
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.check),
                  Text('Confirm Order')
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }

  Widget _buildDeliveryOption(String option) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.yellow.withOpacity(0.3),
      child: ListTile(
        title: Text(option),
        leading: _selectedDelivery == option
            ? const Icon(Icons.check, color: Colors.green)
            : const Icon(Icons.check_box_outline_blank, color: Colors.black),
        onTap: () {
          setState(() {
            _selectedDelivery = option;
          });
        },
      ),
    );
  }

  Widget _buildPaymentOption(String option) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.yellow.withOpacity(0.3),
      child: ListTile(
        title: Text(option),
        leading: _selectedPayment == option
            ? const Icon(Icons.check, color: Colors.green)
            : const Icon(Icons.check_box_outline_blank, color: Colors.black),
        onTap: () {
          setState(() {
            _selectedPayment = option;
          });
        },
      ),
    );
  }
}
