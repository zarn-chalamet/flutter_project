import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/custom_scaffold.dart';
import 'package:flutter_application_1/screens/home.dart';

class Favorite extends StatelessWidget {
  final List<ShoeItem> favoriteProducts;
  const Favorite({required this.favoriteProducts});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          SizedBox(
            height: 55,
            width: double.infinity,
            child: Container(
              child: Text('Favorite'),
              color: Colors.blueAccent,
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Adjust the number of columns as needed
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: favoriteProducts.length,
              itemBuilder: (context, index) {
                return ShoeBox(shoe: favoriteProducts[index], context: context);
              },
            ),
          ),
        ],
      ),
      showBottomNavBar: true,
      initialIndex: 1,
    );
  }
}
