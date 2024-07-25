import 'package:flutter/material.dart';

import 'checkout.dart';

class BillingInfo extends StatefulWidget {
  const BillingInfo({Key? key}) : super(key: key);

  @override
  State<BillingInfo> createState() => _BillingInfoState();
}

class _BillingInfoState extends State<BillingInfo> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController divisionController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController address2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Billing Information',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.0),
          TextField(
            controller: firstNameController,
            decoration: InputDecoration(
              labelText: 'First Name *',
            ),
          ),
          SizedBox(height: 12.0),
          TextField(
            controller: lastNameController,
            decoration: InputDecoration(
              labelText: 'Last Name *',
            ),
          ),
          SizedBox(height: 12.0),
          TextField(
            controller: emailAddressController,
            decoration: InputDecoration(
              labelText: 'Email Address',
            ),
          ),
          SizedBox(height: 12.0),
          Row(
            children: [
              SizedBox(
                width: 100.0,
                child: TextField(
                  controller: countryController,
                  decoration: InputDecoration(
                    labelText: 'Country',
                  ),
                ),
              ),
              SizedBox(width: 12.0),
              Flexible(
                child: TextField(
                  controller: phoneNumberController,
                  decoration: InputDecoration(
                    labelText: 'Phone No. *',
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.0),
          TextField(
            controller: divisionController,
            decoration: InputDecoration(
              labelText: 'Division *',
            ),
          ),
          SizedBox(height: 12.0),
          TextField(
            controller: districtController,
            decoration: InputDecoration(
              labelText: 'District',
            ),
          ),
          SizedBox(height: 12.0),
          TextField(
            controller: cityController,
            decoration: InputDecoration(
              labelText: 'City',
            ),
          ),
          SizedBox(height: 12.0),
          TextField(
            controller: address2Controller,
            decoration: InputDecoration(
              labelText: 'Address 2',
            ),
          ),
          SizedBox(height: 24.0),

         Center(
           child:  ElevatedButton(
             onPressed: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) => Checkout(page: 3)));
             },
             style: ElevatedButton.styleFrom(
               backgroundColor: Colors.yellow.withOpacity(0.5), // Background color
               padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(40),
               ),
               elevation: 2,
             ),
             child: const Row(
               mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.center,
               mainAxisSize: MainAxisSize.min,
               children: [
                 Icon(Icons.double_arrow, color: Colors.black), // Icon
                 SizedBox(width: 8), // Space between icon and text
                 Text('Go Next',
                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black, ),
                 ),
               ],
             ),
           ),
         ),
          const SizedBox(height: 20),
        ],

      ),
    );
  }
}
