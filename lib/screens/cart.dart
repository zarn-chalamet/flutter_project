import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home.dart';
import 'package:flutter_application_1/screens/mybag_provider.dart';
import 'package:provider/provider.dart';

class MyCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final myBagProvider = Provider.of<MyBagProvider>(context);
    final bagItems = myBagProvider.bagItems;

    double subtotal = 0.0;

    for (var item in bagItems) {
      subtotal += item.price * item.quantity;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Bag'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate to the home page
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
            );
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: bagItems.length,
              itemBuilder: (context, index) {
                final item = bagItems[index];
                subtotal += item.price * item.quantity;

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        child: Image.network(
                          item.urlImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item.name, style: TextStyle(fontSize: 16)),
                            Text(item.description,
                                style: TextStyle(fontSize: 14)),
                            Text('${item.price.toString()} Baht',
                                style: TextStyle(fontSize: 16)),
                          ],
                        ),
                      ),
                      SizedBox(width: 16),
                      Column(
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () {
                              myBagProvider.adjustQuantity(item, -1);
                            },
                          ),
                          Text(item.quantity.toString()),
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                              myBagProvider.adjustQuantity(item, 1);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Subtotal: ${subtotal.toStringAsFixed(2)} Baht'),
                Text(
                    'Shipping Fee: 50.00 Baht'), // Adjust shipping fee as needed
                Divider(),
                Text('Total: \$${(subtotal + 50.0).toStringAsFixed(2)}'),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Add checkout functionality
            },
            child: Text('Checkout'),
          ),
        ],
      ),
    );
  }
}
