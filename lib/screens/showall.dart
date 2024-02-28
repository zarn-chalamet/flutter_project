import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home.dart';

class ShowAll extends StatefulWidget {
  const ShowAll({super.key});

  @override
  State<ShowAll> createState() => _ShowAllState();
}

class _ShowAllState extends State<ShowAll> {
  @override
  Widget build(BuildContext context) {
    // List<ShoeItem> shoes = [
    //   ShoeItem(
    //       name: 'AirForce1',
    //       urlImage: 'assets/shoes/airforce.png',
    //       price: 4500,
    //       brand: 'NIKE',
    //       description: "NIKE product -------"),
    //   ShoeItem(
    //       name: 'AirForce1',
    //       urlImage: 'assets/shoes/airforce.png',
    //       price: 4500,
    //       brand: 'NIKE',
    //       description: "NIKE product -------"),
    //   ShoeItem(
    //       name: 'AirForce1',
    //       urlImage: 'assets/shoes/airforce.png',
    //       price: 4500,
    //       brand: 'NIKE',
    //       description: "NIKE product -------"),
    //   ShoeItem(
    //       name: 'AirForce1',
    //       urlImage: 'assets/shoes/airforce.png',
    //       price: 4500,
    //       brand: 'NIKE',
    //       description: "NIKE product -------"),
    //   ShoeItem(
    //       name: 'AirForce1',
    //       urlImage: 'assets/shoes/airforce.png',
    //       price: 4500,
    //       brand: 'NIKE',
    //       description: "NIKE product -------"),
    //   ShoeItem(
    //       name: 'AirForce1',
    //       urlImage: 'assets/shoes/airforce.png',
    //       price: 4500,
    //       brand: 'NIKE',
    //       description: "NIKE product -------"),
    //   ShoeItem(
    //       name: 'AirForce1',
    //       urlImage: 'assets/shoes/airforce.png',
    //       price: 4500,
    //       brand: 'NIKE',
    //       description: "NIKE product -------"),
    //   ShoeItem(
    //       name: 'AirForce1',
    //       urlImage: 'assets/shoes/airforce.png',
    //       price: 4500,
    //       brand: 'NIKE',
    //       description: "NIKE product -------"),
    //   ShoeItem(
    //       name: 'AirForce1',
    //       urlImage: 'assets/shoes/airforce.png',
    //       price: 4500,
    //       brand: 'NIKE',
    //       description: "NIKE product -------"),
    // ];
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
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
                    child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('SneakerX')),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                      IconButton(
                          onPressed: () {}, icon: Icon(Icons.notifications))
                    ],
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              physics: AlwaysScrollableScrollPhysics(),
              shrinkWrap: true,
              children: shoes.map((shoe) {
                return Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: ShoeBox(shoe: shoe, context: context),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

// Widget ShoeBox({required ShoeItem shoe}) => Container(
//     width: 150,
//     height: 100,
//     color: Colors.grey[400],
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Container(
//           height: 100,
//           child: Image.asset(
//             shoe.urlImage,
//             fit: BoxFit.cover,
//           ),
//         ),
//         const SizedBox(
//           height: 4,
//         ),
//         Text(shoe.name),
//         Text('${shoe.price} Baht'),
//         const SizedBox(
//           height: 5,
//         )
//       ],
//     ));

// class ShoeItem {
//   final String name;
//   final String urlImage;
//   final double price;
//   final String brand;
//   final String description;

//   ShoeItem(
//       {required this.name,
//       required this.urlImage,
//       required this.price,
//       required this.brand,
//       required this.description});
// }
