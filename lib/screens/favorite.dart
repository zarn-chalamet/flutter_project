import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/custom_scaffold.dart';
import 'package:flutter_application_1/screens/home.dart';

String? getCurrentUserId() {
  User? user = FirebaseAuth.instance.currentUser;
  return user?.uid;
}

class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  late Future<List<ShoeItem>> favoriteShoes;

  @override
  void initState() {
    super.initState();
    favoriteShoes = getFavoriteShoes();
  }

  Future<List<ShoeItem>> getFavoriteShoes() async {
    // Fetch favorite shoes data from Firestore
    String? userId = getCurrentUserId();
    if (userId == null) {
      // Handle the case where the user is not authenticated
      return [];
    }
    List<ShoeItem> favoriteProducts = [];

    try {
      var snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('favorites')
          .doc('products')
          .get();

      if (snapshot.exists) {
        print("products exist ---------------------------------------");
        var data = snapshot.data() as Map<String, dynamic>;
        data.forEach((key, value) {
          // Use the factory method to create ShoeItem instances
          ShoeItem shoeItem = ShoeItem.fromMap(value);
          favoriteProducts.add(shoeItem);
        });
      }
    } catch (e) {
      print("Error fetching favorite shoes: $e");
    }
    print("-----------------------------------------");
    print(favoriteProducts);
    return favoriteProducts;
  }

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
            child: FutureBuilder<List<ShoeItem>>(
              future: favoriteShoes,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else {
                  // Display the favorite shoes in a GridView
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                    ),
                    itemCount: snapshot.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          // Toggle the favorite status when tapped
                          setState(() {
                            snapshot.data![index].isFavorite =
                                !snapshot.data![index].isFavorite;
                          });
                        },
                        child: ShoeBox(
                          shoe: snapshot.data![index],
                          context: context,
                        ),
                      );
                    },
                  );
                }
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
