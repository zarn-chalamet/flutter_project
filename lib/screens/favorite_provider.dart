import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/favorite.dart';
import 'package:flutter_application_1/screens/home.dart';

class FavoriteProvider with ChangeNotifier {
  List<ShoeItem> _favoriteProducts = [];

  List<ShoeItem> get favoriteProducts => _favoriteProducts;

  void toggleFavorite(ShoeItem product) async {
    product.isFavorite = !product.isFavorite;
    notifyListeners();

    String? userId = getCurrentUserId();
    if (userId != null) {
      try {
        // Reference to the favorite products document in Firestore
        DocumentReference favoriteProductsRef = FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .collection('favorites')
            .doc('products');

        // Fetch the existing favorites
        var snapshot = await favoriteProductsRef.get();
        var existingFavorites =
            snapshot.exists ? (snapshot.data() as Map<String, dynamic>) : {};

        // Update the favorites
        if (product.isFavorite) {
          // Add the product to favorites
          existingFavorites[product.name] = product.toMap();
        } else {
          // Remove the product from favorites
          existingFavorites.remove(product.name);
        }

        // Update the favorites document in Firestore
        await favoriteProductsRef.set(existingFavorites);
      } catch (e) {
        print("Error updating favorites: $e");
      }
    }
  }
}
