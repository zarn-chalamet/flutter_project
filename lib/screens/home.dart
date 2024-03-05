import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/custom_scaffold.dart';
import 'package:flutter_application_1/screens/notification.dart';
import 'package:flutter_application_1/screens/product_page.dart';
import 'package:flutter_application_1/screens/firestoreservice.dart';
import 'package:flutter_application_1/screens/showall.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// void addShoesToFirestore(List<ShoeItem> shoes) async {
//   CollectionReference shoeCollection =
//       FirebaseFirestore.instance.collection('shoes');

//   for (ShoeItem shoe in shoes) {
//     await shoeCollection.add({
//       'name': shoe.name,
//       'urlImage': shoe.urlImage,
//       'price': shoe.price,
//       'brand': shoe.brand,
//       'description': shoe.description,
//       'isFavorite': shoe.isFavorite,
//       'quantity': shoe.quantity,
//       'thumbnailUrls': shoe.thumbnailUrls,
//       'availableSizes': shoe.availableSizes,
//     });
//   }
// }

// List<ShoeItem> shoes = [
//   ShoeItem(
//       isFavorite: true,
//       name: 'AirForce1',
//       urlImage: 'assets/shoes/airforce.png',
//       price: 4500,
//       brand: 'NIKE',
//       description: "NIKE product -------",
//       thumbnailUrls: [
//         'assets/shoes/airforce.png',
//         'assets/shoes/blazer77.jpg',
//         'assets/shoes/nb550.jpg',
//       ],
//       availableSizes: [
//         'US 7',
//         'US 7.5',
//         'US 8',
//         'US 9',
//         'US 10',
//       ]),
//   ShoeItem(
//       isFavorite: true,
//       name: 'Balzer77 Mid',
//       urlImage: 'assets/shoes/blazer77.jpg',
//       price: 4000,
//       brand: 'NIKE',
//       description: "NIKE product -------",
//       thumbnailUrls: [
//         'assets/shoes/airforce.png',
//         'assets/shoes/blazer77.jpg',
//         'assets/shoes/nb550.jpg',
//       ],
//       availableSizes: [
//         'US 7',
//         'US 7.5',
//         'US 8',
//         'US 9',
//         'US 10',
//       ]),
//   ShoeItem(
//       name: 'New Balance 550',
//       urlImage: 'assets/shoes/nb550.jpg',
//       price: 6500,
//       brand: 'New Balance',
//       description: "NIKE product -------",
//       thumbnailUrls: [
//         'assets/shoes/airforce.png',
//         'assets/shoes/blazer77.jpg',
//         'assets/shoes/nb550.jpg',
//       ],
//       availableSizes: [
//         'US 7',
//         'US 7.5',
//         'US 8',
//         'US 9',
//         'US 10',
//       ]),
//   ShoeItem(
//       name: 'Yeezy',
//       urlImage: 'assets/shoes/yeezy350.jpg',
//       price: 4500,
//       brand: 'Adidas',
//       description: "Adidas product -------",
//       thumbnailUrls: [
//         'assets/shoes/airforce.png',
//         'assets/shoes/blazer77.jpg',
//         'assets/shoes/nb550.jpg',
//       ],
//       availableSizes: [
//         'US 7',
//         'US 7.5',
//         'US 8',
//         'US 9',
//         'US 10',
//       ]),
//   ShoeItem(
//       name: 'New Balance',
//       urlImage: 'assets/shoes/nbalance.jpg',
//       price: 4500,
//       brand: 'New Balance',
//       description: "New balance product -------",
//       thumbnailUrls: [
//         'assets/shoes/airforce.png',
//         'assets/shoes/blazer77.jpg',
//         'assets/shoes/nb550.jpg',
//       ],
//       availableSizes: [
//         'US 7',
//         'US 7.5',
//         'US 8',
//         'US 9',
//         'US 10',
//       ]),
//   ShoeItem(
//       name: 'Adidas Samba',
//       urlImage: 'assets/shoes/samba.jpg',
//       price: 4500,
//       brand: 'Adidas',
//       description: "NIKE product -------",
//       thumbnailUrls: [
//         'assets/shoes/airforce.png',
//         'assets/shoes/blazer77.jpg',
//         'assets/shoes/nb550.jpg',
//       ],
//       availableSizes: [
//         'US 7',
//         'US 7.5',
//         'US 8',
//         'US 9',
//         'US 10',
//       ]),
//   ShoeItem(
//       name: 'Puma',
//       urlImage: 'assets/shoes/airforce.png',
//       price: 4500,
//       brand: 'Puma',
//       description: "Puma product -------",
//       thumbnailUrls: [
//         'assets/shoes/airforce.png',
//         'assets/shoes/blazer77.jpg',
//         'assets/shoes/nb550.jpg',
//       ],
//       availableSizes: [
//         'US 7',
//         'US 7.5',
//         'US 8',
//         'US 9',
//         'US 10',
//       ]),
//   ShoeItem(
//       name: 'Sketcher',
//       urlImage: 'assets/shoes/airforce.png',
//       price: 4500,
//       brand: 'Sketcher',
//       description: "Sketcher product -------",
//       thumbnailUrls: [
//         'assets/shoes/airforce.png',
//         'assets/shoes/blazer77.jpg',
//         'assets/shoes/nb550.jpg',
//       ],
//       availableSizes: [
//         'US 7',
//         'US 7.5',
//         'US 8',
//         'US 9',
//         'US 10',
//       ]),
//   ShoeItem(
//       name: 'Puma',
//       urlImage: 'assets/shoes/airforce.png',
//       price: 4500,
//       brand: 'Puma',
//       description: "Puma product -------",
//       thumbnailUrls: [
//         'assets/shoes/airforce.png',
//         'assets/shoes/blazer77.jpg',
//         'assets/shoes/nb550.jpg',
//       ],
//       availableSizes: [
//         'US 7',
//         'US 7.5',
//         'US 8',
//         'US 9',
//         'US 10',
//       ]),
// ];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<ShoeItem> shoes;

  @override
  void initState() {
    super.initState();
    // Fetch shoe data from Firestore when the widget is created
    fetchShoesFromFirestore();
  }

  void fetchShoesFromFirestore() async {
    shoes = await FirestoreService.getShoesFromFirestore();
    setState(() {
      // Update the state with the fetched shoes
      shoes = shoes;
    });
  }

  int selectedCardIndex = -1;
  String searchQuery = '';
  TextEditingController _searchController = TextEditingController();

  void handleSearch(String query) {
    setState(() {
      searchQuery = query;
    });
  }

  List<CardItem> items = [
    CardItem(
      urlImage: 'assets/logos/nike.png',
      title: 'Nike',
    ),
    CardItem(
      urlImage: 'assets/logos/adidas.png',
      title: 'Adidas',
    ),
    CardItem(
      urlImage: 'assets/logos/puma.png',
      title: 'Puma',
    ),
    CardItem(
      urlImage: 'assets/logos/sketcher.png',
      title: 'Sketcher',
    ),
    CardItem(
      urlImage: 'assets/logos/nb.png',
      title: 'New Balance',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SafeArea(
        child: Container(
          color: Colors.grey[300],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 55,
                child: Container(
                  color: Colors.blue[100],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text('SneakerX'),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {
                                showSearch(
                                  context: context,
                                  delegate: CustomSearchDelegate(shoes),
                                );
                              },
                              icon: Icon(Icons.search)),
                          IconButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => NotificationPage()));
                              },
                              icon: Icon(Icons.notifications))
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: items.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          // Update the selectedCardIndex when a card is tapped
                          selectedCardIndex = index;
                        });

                        // Get the selected brand
                        String selectedBrand = items[selectedCardIndex].title;

                        // Filter the shoes based on the selected brand
                        List<ShoeItem> filteredShoes = shoes
                            .where((shoe) =>
                                shoe.brand.toLowerCase() ==
                                selectedBrand.toLowerCase())
                            .toList();

                        // Navigate to the ShowAll screen with the filtered shoes
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ShowAll(shoes: filteredShoes),
                          ),
                        );
                      },
                      child: buildCard(item: items[index]),
                    ),
                  ),
                ),
              ),
              Container(
                height: 180,
                child: PageView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Advertise(),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text('Best Sellers'),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ShowAll(
                                    shoes: filteredShoes,
                                  )));
                        },
                        child: Text('View All'),
                      ))
                ],
              ),
              Container(
                height: 170,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: shoes.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(6.0),
                    child:
                        ShoeBox(shoe: filteredShoes[index], context: context),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text('New Arrivals'),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ShowAll(
                                    shoes: filteredShoes,
                                  )));
                        },
                        child: Text('View All'),
                      ))
                ],
              ),
              Container(
                height: 170,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: shoes.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: ShoeBox(shoe: shoes[index], context: context),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      showBottomNavBar: true,
      initialIndex: 0,
    );
  }

  List<ShoeItem> get filteredShoes {
    return shoes
        .where((shoe) =>
            shoe.name.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();
  }
}

Widget Advertise() => Padding(
      padding: const EdgeInsets.all(25.0),
      child: Container(child: Image.asset("assets/logos/slide.png")),
    );

Widget ShoeBox({
  required ShoeItem shoe,
  required BuildContext context,
}) =>
    GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => ProductPage(product: shoe)),
        );
      },
      child: Container(
          width: 150,
          height: 100,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 100,
                child: Image.asset(
                  shoe.urlImage,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(shoe.name),
              Text(
                '${shoe.price} Baht',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          )),
    );

Widget buildCard({required CardItem item}) => Container(
      width: 100,
      child: Column(
        children: [
          Expanded(
            child: AspectRatio(
              aspectRatio: 4 / 3,
              child: CircleAvatar(
                backgroundImage: AssetImage(item.urlImage),
                radius: double.infinity,
                backgroundColor:
                    Colors.transparent, // Make the background transparent
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: const Color.fromARGB(255, 225, 95, 95),
                        width: 1.0), // Optional border
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 4),
          Text(item.title),
        ],
      ),
    );

class CardItem {
  final String urlImage;
  final String title;

  CardItem({required this.urlImage, required this.title});
}

class ShoeItem {
  final String name;
  final String urlImage;
  final double price;
  final String brand;
  final String description;
  bool isFavorite;
  int quantity;
  List<String> thumbnailUrls;
  List<String> availableSizes;

  ShoeItem({
    this.isFavorite = false,
    required this.name,
    required this.urlImage,
    required this.price,
    required this.brand,
    required this.description,
    this.quantity = 0,
    required this.thumbnailUrls,
    required this.availableSizes,
  });

  factory ShoeItem.fromMap(Map<String, dynamic> map) {
    return ShoeItem(
      isFavorite: map['isFavorite'] ?? false,
      name: map['name'] ?? '',
      urlImage: map['urlImage'] ?? '',
      price: map['price'] ?? 0.0,
      brand: map['brand'] ?? '',
      description: map['description'] ?? '',
      quantity: map['quantity'] ?? 0,
      thumbnailUrls: (map['thumbnailUrls'] as List<dynamic>?)
              ?.map((dynamic url) => url.toString())
              .toList() ??
          [],
      availableSizes: (map['availableSizes'] as List<dynamic>?)
              ?.map((dynamic size) => size.toString())
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'urlImage': urlImage,
      'price': price,
      'brand': brand,
      'description': description,
      'isFavorite': isFavorite,
      'quantity': quantity,
      'thumbnailUrls': thumbnailUrls,
      'availableSizes': availableSizes,
    };
  }
}

class CustomSearchDelegate extends SearchDelegate<String> {
  final List<ShoeItem> allShoes;

  CustomSearchDelegate(this.allShoes);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, '');
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Implement logic to filter the list based on the search query
    List<ShoeItem> searchResults = allShoes
        .where((shoe) =>
            shoe.name.toLowerCase().contains(query.toLowerCase()) ||
            shoe.brand.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ShowAll(shoes: searchResults);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // You can implement this method to show suggestions as the user types
    return Container();
  }
}
