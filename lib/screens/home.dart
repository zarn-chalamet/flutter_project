import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/custom_scaffold.dart';
import 'package:flutter_application_1/screens/product_page.dart';
import 'package:flutter_application_1/screens/showall.dart';

List<ShoeItem> shoes = [
  ShoeItem(
      isFavorite: true,
      name: 'AirForce1',
      urlImage: 'assets/shoes/airforce.png',
      price: 4500,
      brand: 'NIKE',
      description: "NIKE product -------"),
  ShoeItem(
      isFavorite: true,
      name: 'Balzer77 Mid',
      urlImage: 'assets/shoes/blazer77.jpg',
      price: 4000,
      brand: 'NIKE',
      description: "NIKE product -------"),
  ShoeItem(
      name: 'New Balance 550',
      urlImage: 'assets/shoes/nb550.jpg',
      price: 6500,
      brand: 'New Balance',
      description: "NIKE product -------"),
  ShoeItem(
      name: 'Yeezy',
      urlImage: 'assets/shoes/yeezy350.jpg',
      price: 4500,
      brand: 'Adidas',
      description: "Adidas product -------"),
  ShoeItem(
      name: 'New Balance',
      urlImage: 'assets/shoes/nbalance.jpg',
      price: 4500,
      brand: 'New Balance',
      description: "New balance product -------"),
  ShoeItem(
      name: 'Adidas Samba',
      urlImage: 'assets/shoes/samba.jpg',
      price: 4500,
      brand: 'Adidas',
      description: "NIKE product -------"),
  ShoeItem(
      name: 'AirForce1',
      urlImage: 'assets/shoes/airforce.png',
      price: 4500,
      brand: 'NIKE',
      description: "NIKE product -------"),
  ShoeItem(
      name: 'AirForce1',
      urlImage: 'assets/shoes/airforce.png',
      price: 4500,
      brand: 'NIKE',
      description: "NIKE product -------"),
  ShoeItem(
      name: 'AirForce1',
      urlImage: 'assets/shoes/airforce.png',
      price: 4500,
      brand: 'NIKE',
      description: "NIKE product -------"),
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                              onPressed: () {}, icon: Icon(Icons.search)),
                          IconButton(
                              onPressed: () {}, icon: Icon(Icons.notifications))
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
                  itemCount: 5,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: buildCard(item: items[index]),
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
                              builder: (context) => ShowAll()));
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
                              builder: (context) => ShowAll()));
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
}

Widget Advertise() => Padding(
      padding: const EdgeInsets.all(25.0),
      child: Container(child: Image.asset("assets/logos/slide.png")),
    );

Widget ShoeBox({required ShoeItem shoe, required BuildContext context}) =>
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

  ShoeItem(
      {this.isFavorite = false,
      required this.name,
      required this.urlImage,
      required this.price,
      required this.brand,
      required this.description,
      this.quantity = 0});
}
