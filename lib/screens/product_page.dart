import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/favorite_provider.dart';
import 'package:flutter_application_1/screens/home.dart';
import 'package:flutter_application_1/screens/mybag_provider.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatefulWidget {
  final ShoeItem product;

  ProductPage({required this.product});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  bool isFavorite = false;
  late String currentImage;
  late String selectedSize;

  @override
  void initState() {
    super.initState();
    currentImage = widget.product.urlImage;
    selectedSize = widget.product.availableSizes.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              currentImage, // Replace with actual image URL
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            buildThumbnailRow(widget.product),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.product.name,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Consumer<FavoriteProvider>(
                    builder: (context, favoriteProvider, _) {
                      return IconButton(
                        icon: widget.product.isFavorite
                            ? Icon(Icons.favorite, color: Colors.red)
                            : Icon(Icons.favorite_border),
                        onPressed: () {
                          favoriteProvider.toggleFavorite(widget.product);
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'Price: \$${widget.product.price.toString()}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'Description: ${widget.product.description}',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'Size',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            buildSizeSelection(widget.product),
            SizedBox(height: 20),
            SizedBox(
              width: 300,
              height: 40,
              child: ElevatedButton(
                  onPressed: () {
                    Provider.of<MyBagProvider>(context, listen: false)
                        .addToBag(widget.product);
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Add to Bag',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                      )
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildThumbnailRow(ShoeItem product) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: product.thumbnailUrls.map((thumbnailUrl) {
        return GestureDetector(
          onTap: () {
            setState(() {
              currentImage = thumbnailUrl;
            });
          },
          child: Container(
            width: 60,
            height: 60,
            child: Image.network(
              thumbnailUrl,
              fit: BoxFit.cover,
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget buildSizeSelection(ShoeItem product) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 8.0,
      children: product.availableSizes.map((size) {
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedSize = size;
            });
          },
          child: Container(
            width: 80,
            height: 40,
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(
                color: size == selectedSize ? Colors.blue : Colors.grey,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                size,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: size == selectedSize ? Colors.blue : Colors.black,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
