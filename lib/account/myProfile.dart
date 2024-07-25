import 'package:flutter/material.dart';
import 'package:mbrella/account/shippings.dart';
import 'package:mbrella/account/updateProfile.dart';

import '../includes/productAppBar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ProductAppBar(title: 'My profile',),
      body: Container(
        height: double.infinity,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.yellow.withOpacity(0.1), Colors.teal.shade700],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 60.0,
                backgroundImage: NetworkImage('https://i.pinimg.com/236x/0f/c8/19/0fc8195626ae17060ccc78e62a6ca9e4.jpg'), // Replace with your image asset
                backgroundColor: Colors.transparent,
              ),
              const SizedBox(height: 20.0),
              const Text( 'John Doe',
                style: TextStyle( fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.black, ),
              ),
              const SizedBox(height: 10.0),
              const Text( 'johndoe@example.com',
                style: TextStyle(  fontSize: 16.0, color: Colors.black45, ),
              ),
              const SizedBox(height: 10.0),
              const Text( '+1 123 456 7890',
                style: TextStyle(  fontSize: 16.0, color: Colors.black45, ),
              ),
              const SizedBox(height: 10.0),
              const Text( '123 Main Street, Springfield, USA',
                style: TextStyle(  fontSize: 16.0, color: Colors.black45, ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30.0),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const UpdateProfile()));
                },
                icon: const Icon(Icons.edit, color: Colors.white),
                label: const Text('Update Profile', style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal.shade900,
                  padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
                ),
              ),
              const SizedBox(height: 10.0),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ShippingAddressList()));
                },
                icon: const Icon(Icons.location_on, color: Colors.white),
                label: const Text('View Shipping Address', style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal.shade900,
                  padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}