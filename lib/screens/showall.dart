import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home.dart';

class ShowAll extends StatefulWidget {
  final List<ShoeItem> shoes;

  const ShowAll({super.key, required this.shoes});

  @override
  State<ShowAll> createState() => _ShowAllState();
}

class _ShowAllState extends State<ShowAll> {
  // ... (unchanged)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 55,
            child: Container(
              // ... (unchanged)
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('SneakerX'),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                      IconButton(
                          onPressed: () {}, icon: Icon(Icons.notifications)),
                    ],
                  ),
                ],
              ),
              // ... (unchanged)
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              physics: AlwaysScrollableScrollPhysics(),
              shrinkWrap: true,
              children: widget.shoes.map((shoe) {
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
