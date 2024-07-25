import 'package:flutter/material.dart';
import 'package:mbrella/cart/my_cart.dart';
import 'package:mbrella/checkout/billing.dart';
import 'package:mbrella/checkout/placeOrder.dart';
import 'package:mbrella/checkout/shipping.dart';
import 'package:mbrella/main.dart';

class ProcessCheckout extends StatefulWidget {
  final int page;
  const ProcessCheckout({super.key, required this.page});

  @override
  State<ProcessCheckout> createState() => _ProcessCheckoutState();
}

class _ProcessCheckoutState extends State<ProcessCheckout> {

  @override
  void initState() {
    super.initState();
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
      return Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MyApp(page: 0)),
            );
          },
          child: const Text('Refresh'),
        ),
      );
    } else if (widget.page == 1) {
      return SizedBox(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child:  SingleChildScrollView(
          child: Column(
            children: [
              Text(widget.page.toString()),
              const MyCart(),
            ],
          ),
        ),
      );
    }
    else if (widget.page == 2) {
      return const SingleChildScrollView(
        child: BillingInfo(),
      );

    }
    else if (widget.page == 3) {

      return const SingleChildScrollView(
        child: ShippingInfo(),
      );

    }else if (widget.page == 4) {
      return const SingleChildScrollView(
          child: Placeorder()
      );
    }
    else {
      return const Text('Check ends');
    }

  }

}
