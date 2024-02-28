import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home.dart';

class MyBagProvider with ChangeNotifier {
  List<ShoeItem> _bagItems = [];

  List<ShoeItem> get bagItems => _bagItems;

  void addToBag(ShoeItem product) {
    final existingItemIndex =
        _bagItems.indexWhere((item) => item.name == product.name);

    if (existingItemIndex != -1) {
      // Increment quantity if item is already in the bag
      _bagItems[existingItemIndex].quantity++;
    } else {
      // Add new item to the bag
      _bagItems.add(ShoeItem(
        name: product.name,
        urlImage: product.urlImage,
        price: product.price,
        brand: product.brand,
        description: product.description,
        quantity: 1,
      ));
    }

    notifyListeners();
  }

  void adjustQuantity(ShoeItem item, int change) {
    final existingItemIndex = _bagItems.indexWhere((i) => i.name == item.name);

    if (existingItemIndex != -1) {
      _bagItems[existingItemIndex].quantity += change;

      if (_bagItems[existingItemIndex].quantity <= 0) {
        // Remove item from the bag if quantity becomes zero or negative
        _bagItems.removeAt(existingItemIndex);
      }

      notifyListeners();
    }
  }

  // Add other methods as needed, e.g., removeItemFromBag, clearBag, etc.
}
