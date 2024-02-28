import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/custom_scaffold.dart';
import 'package:flutter_application_1/screens/favorite.dart';
import 'package:flutter_application_1/screens/home.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    String userName = "John Doe"; // Replace with the actual user's name
    String profilePhotoUrl = 'assets/shoes/airforce.png';

    return CustomScaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(profilePhotoUrl),
              ),
              SizedBox(height: 16),
              Text(
                userName,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 32),
              Container(
                height: 40,
                width: double.infinity,
                color: Colors.grey[350],
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.note_alt_rounded),
                          SizedBox(
                            width: 5,
                          ),
                          Text('My orders')
                        ],
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => Text('order page')),
                            );
                          },
                          icon: Icon(Icons.arrow_forward_outlined))
                    ]),
              ),
              SizedBox(height: 16),
              Container(
                height: 40,
                width: double.infinity,
                color: Colors.grey[350],
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.favorite_border),
                          SizedBox(
                            width: 5,
                          ),
                          Text('My whishlist')
                        ],
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => Favorite(
                                      favoriteProducts: shoes
                                          .where(
                                              (product) => product.isFavorite)
                                          .toList())),
                            );
                          },
                          icon: Icon(Icons.arrow_forward_outlined))
                    ]),
              ),
              SizedBox(height: 16),
              Container(
                height: 40,
                width: double.infinity,
                color: Colors.grey[350],
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.settings),
                          SizedBox(
                            width: 5,
                          ),
                          Text('Profile Setting')
                        ],
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.arrow_forward_outlined))
                    ]),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                height: 40,
                width: double.infinity,
                color: Colors.grey[350],
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.info_outline),
                          SizedBox(
                            width: 5,
                          ),
                          Text('About Us')
                        ],
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.arrow_forward_outlined))
                    ]),
              ),
            ],
          ),
        ),
      ),
      showBottomNavBar: true,
      initialIndex: 3,
    );
  }
}
