import 'package:flutter/material.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({Key? key}) : super(key: key);

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  final List<Order> orders = [
    Order(orderNumber: "#1234", totalAmount: "\$100", status: "Delivered"),
    Order(orderNumber: "#1235", totalAmount: "\$80", status: "Pending"),
    Order(orderNumber: "#1236", totalAmount: "\$120", status: "Shipped"),
    Order(orderNumber: "#1237", totalAmount: "\$90", status: "Delivered"),
    Order(orderNumber: "#1238", totalAmount: "\$110", status: "Pending"),
    Order(orderNumber: "#1239", totalAmount: "\$95", status: "Shipped"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Orders'),
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          itemCount: orders.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: ListTile(
                title: Text('Order Number: ${orders[index].orderNumber}'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Total Amount: ${orders[index].totalAmount}'),
                    Text('Status: ${orders[index].status}'),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PrintPage(
                        orderNumber: orders[index].orderNumber,
                        totalAmount: orders[index].totalAmount,
                        status: orders[index].status,
                      ),
                    ),
                  );
                },

              ),
            );
          },
        ),
      ),
    );
  }
}

class Order {
  final String orderNumber;
  final String totalAmount;
  final String status;

  Order({
    required this.orderNumber,
    required this.totalAmount,
    required this.status,
  });
}



class PrintPage extends StatelessWidget {
  final String orderNumber;
  final String totalAmount;
  final String status;

  PrintPage({
    required this.orderNumber,
    required this.totalAmount,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('order Invoice'),
      ),
      body: SingleChildScrollView( // Wrap with SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              SizedBox(height: 24),
              _buildOrderInfo(),
              SizedBox(height: 24),
              Divider(),
              SizedBox(height: 24),
              _buildBillingAddress(),
              SizedBox(height: 24),
              Divider(),
              SizedBox(height: 24),
              _buildItems(),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order Number:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              orderNumber,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'Status:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              status,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildOrderInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Order Summary',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total Amount:',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              totalAmount,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBillingAddress() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Billing Address:',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),
        Text(
          'John Doe',
          style: TextStyle(fontSize: 16),
        ),
        Text(
          '123 Main Street, Apartment 4B',
          style: TextStyle(fontSize: 16),
        ),
        Text(
          'New York, NY 10001',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  Widget _buildItems() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Items:',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),
        _buildOrderItem('Product 1', 'Quantity: 2', '\$50'),
        _buildOrderItem('Product 2', 'Quantity: 1', '\$30'),
        _buildOrderItem('Product 3', 'Quantity: 3', '\$80'),
        // Add more order items as needed
      ],
    );
  }

  Widget _buildOrderItem(String productName, String quantity, String price) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          productName,
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 4),
        Text(
          quantity,
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
        RichText(
          text: TextSpan(
            style: const TextStyle(color: Colors.black, fontSize: 14),
            children: <TextSpan>[
              const TextSpan(text: 'Price ', style: TextStyle(color: Colors.grey)),
              TextSpan(text: price, style: const TextStyle(color: Colors.black45)),
            ],
          )
        ),

        const SizedBox(height: 8),
      ],
    );
  }

}
