import 'package:flutter/material.dart';
import 'package:mbrella/includes/productAppBar.dart';

class ShippingAddressList extends StatefulWidget {
  const ShippingAddressList({super.key});

  @override
  _ShippingAddressListState createState() => _ShippingAddressListState();
}

class _ShippingAddressListState extends State<ShippingAddressList> {
  List<Map<String, String>> addresses = [
    {
      "firstName": "John",
      "lastName": "Doe",
      "email": "john.doe@example.com",
      "country": "USA",
      "phone": "1234567890",
      "division": "California",
      "district": "Los Angeles",
      "city": "Los Angeles",
      "addressLine": "123 Main St",
    },
    {
      "firstName": "nazrul",
      "lastName": "islam",
      "email": "john.doe@example.com",
      "country": "BD",
      "phone": "01749015457",
      "division": "California",
      "district": "Los Angeles",
      "city": "Los Angeles",
      "addressLine": "123 Main St",
    },
    // Add more addresses as needed
  ];

  void _editAddress(Map<String, String> address) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom),
          child: AddAddressForm(address: address),
        );
      },
    );
  }

  void _deleteAddress(int index) {
    setState(() {
      addresses.removeAt(index);
    });
  }

  void _addAddress(Map<String, String> address) {
    setState(() {
      addresses.add(address);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ProductAppBar(title: 'Shipping Address List'),
      body: ListView.builder(
        itemCount: addresses.length,
        itemBuilder: (context, index) {
          final address = addresses[index];
          return Card(
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              title: Text('${address['firstName']} ${address['lastName']}'),
              subtitle: Text(address['addressLine'] ?? ''),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit, color: Colors.blue),
                    onPressed: () => _editAddress(address),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _deleteAddress(index),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (BuildContext context) {
              return Padding(
                padding: EdgeInsets.only( bottom: MediaQuery.of(context).viewInsets.bottom),
                child: AddAddressForm(onSubmit: _addAddress),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}


class AddAddressForm extends StatefulWidget {
  final Map<String, String>? address;
  final Function(Map<String, String>)? onSubmit;

  const AddAddressForm({Key? key, this.address, this.onSubmit}) : super(key: key);

  @override
  _AddAddressFormState createState() => _AddAddressFormState();
}

class _AddAddressFormState extends State<AddAddressForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _emailController;
  late TextEditingController _countryController;
  late TextEditingController _phoneController;
  late TextEditingController _divisionController;
  late TextEditingController _districtController;
  late TextEditingController _cityController;
  late TextEditingController _addressLineController;

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController(text: widget.address?['firstName'] ?? '');
    _lastNameController = TextEditingController(text: widget.address?['lastName'] ?? '');
    _emailController = TextEditingController(text: widget.address?['email'] ?? '');
    _countryController = TextEditingController(text: widget.address?['country'] ?? '');
    _phoneController = TextEditingController(text: widget.address?['phone'] ?? '');
    _divisionController = TextEditingController(text: widget.address?['division'] ?? '');
    _districtController = TextEditingController(text: widget.address?['district'] ?? '');
    _cityController = TextEditingController(text: widget.address?['city'] ?? '');
    _addressLineController = TextEditingController(text: widget.address?['addressLine'] ?? '');
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _countryController.dispose();
    _phoneController.dispose();
    _divisionController.dispose();
    _districtController.dispose();
    _cityController.dispose();
    _addressLineController.dispose();
    super.dispose();
  }

  void _submitForm() {
    final newAddress = {
      "firstName": _firstNameController.text,
      "lastName": _lastNameController.text,
      "email": _emailController.text,
      "country": _countryController.text,
      "phone": _phoneController.text,
      "division": _divisionController.text,
      "district": _districtController.text,
      "city": _cityController.text,
      "addressLine": _addressLineController.text,
    };
    widget.onSubmit?.call(newAddress);
    Navigator.of(context).pop(newAddress);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.yellow.withOpacity(0.1),
                  border: Border(
                    bottom: BorderSide(color: Colors.yellow.withOpacity(0.7), width: 2)
                  )
                ),

                child: Text('Add new shipping address' ,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
              ),

              TextFormField(
                controller: _firstNameController,
                decoration: InputDecoration(labelText: 'First Name'),
              ),
              TextFormField(
                controller: _lastNameController,
                decoration: InputDecoration(labelText: 'Last Name'),
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
              ),
              TextFormField(
                controller: _countryController,
                decoration: InputDecoration(labelText: 'Country'),
              ),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(labelText: 'Phone'),
                keyboardType: TextInputType.phone,
              ),
              TextFormField(
                controller: _divisionController,
                decoration: InputDecoration(labelText: 'Division'),
              ),
              TextFormField(
                controller: _districtController,
                decoration: InputDecoration(labelText: 'District'),
              ),
              TextFormField(
                controller: _cityController,
                decoration: InputDecoration(labelText: 'City'),
              ),
              TextFormField(
                controller: _addressLineController,
                decoration: InputDecoration(labelText: 'Address Line'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.yellow.withOpacity(0.5),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.add),
                    SizedBox(width: 5),
                    Text('Add Address'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

