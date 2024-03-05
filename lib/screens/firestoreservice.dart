import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/screens/home.dart';

class FirestoreService {
  static Future<List<ShoeItem>> getShoesFromFirestore() async {
    try {
      CollectionReference shoeCollection =
          FirebaseFirestore.instance.collection('shoes');

      QuerySnapshot querySnapshot = await shoeCollection.get();

      List<ShoeItem> shoes = querySnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

        return ShoeItem(
          name: data['name'],
          urlImage: data['urlImage'],
          price: data['price'].toDouble(),
          brand: data['brand'],
          description: data['description'],
          isFavorite: data['isFavorite'],
          quantity: data['quantity'],
          thumbnailUrls: List<String>.from(data['thumbnailUrls']),
          availableSizes: List<String>.from(data['availableSizes']),
        );
      }).toList();

      return shoes;
    } catch (e) {
      print('Error fetching shoes: $e');
      return [];
    }
  }

  static Future<List<ShoeItem>> getFavoriteShoesFromFirebase() async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
          .instance
          .collection('shoes')
          .where('isFavorite', isEqualTo: true)
          .get();

      List<ShoeItem> favoriteShoes = snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

        return ShoeItem(
          name: data['name'],
          urlImage: data['urlImage'],
          price: data['price'],
          brand: data['brand'],
          description: data['description'],
          isFavorite: data['isFavorite'],
          quantity: data['quantity'],
          thumbnailUrls: List<String>.from(data['thumbnailUrls']),
          availableSizes: List<String>.from(data['availableSizes']),
        );
      }).toList();

      return favoriteShoes;
    } catch (e) {
      print('Error fetching favorite shoes: $e');
      return [];
    }
  }
}
