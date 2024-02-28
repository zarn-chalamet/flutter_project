import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home.dart';

class FavoriteProvider with ChangeNotifier {
  List<ShoeItem> _favoriteProducts = [];

  List<ShoeItem> get favoriteProducts => _favoriteProducts;

  void toggleFavorite(ShoeItem product) {
    product.isFavorite = !product.isFavorite;

    if (product.isFavorite) {
      _favoriteProducts.add(product);
    } else {
      _favoriteProducts.remove(product);
    }

    notifyListeners();
  }
}
