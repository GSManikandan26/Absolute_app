import 'package:flutter/material.dart';

class OccupiedList extends StatefulWidget {
  const OccupiedList({super.key});

  @override
  State<OccupiedList> createState() => _OccupiedListState();
}

Color customColor = const Color.fromRGBO(33, 84, 115, 1.0);

class _OccupiedListState extends State<OccupiedList> {
  List<PropertyCardData> propertyData = [
    PropertyCardData(
      image: 'images/image1.png',
      roomNumber: '1 (2BHK)',
      price: '₹2,800 / Day',
      type: 'Apartment',
      location: 'Chennai',
      isOccupied: true,
      starRating: 4.5,
    ),
    PropertyCardData(
      image: 'images/image2.png',
      roomNumber: '2 (3BHK)',
      price: '₹2,500 / Day',
      type: 'Apartment',
      location: 'Chennai',
      isOccupied: false,
      starRating: 3.8,
    ),
    PropertyCardData(
      image: 'images/image3.png',
      roomNumber: '3 (2 Sharing)',
      price: '₹3,500 / Day',
      type: 'PG',
      location: 'Chennai',
      isOccupied: true,
      starRating: 4.2,
    ),
    PropertyCardData(
      image: 'images/image4.png',
      roomNumber: '4 (4 Sharing)',
      price: '₹2,200 / Day',
      type: 'PG',
      location: 'Chennai',
      isOccupied: true,
      starRating: 4.0,
    ),
  ];

  void togglePublishStatus(int index) {
    setState(() {
      propertyData[index].isOccupied = !propertyData[index].isOccupied;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: propertyData.asMap().entries.map((entry) {
            final index = entry.key;
            final data = entry.value;
            return Column(
              children: [
                PropertyCard(
                  image: data.image,
                  roomNumber: data.roomNumber,
                  price: data.price,
                  type: data.type,
                  location: data.location,
                  isOccupied: data.isOccupied,
                  starRating: data.starRating,
                  onPressed: () {
                    togglePublishStatus(index);
                  },
                ),
                const SizedBox(height: 25.0), // Add this SizedBox to create space between cards
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}

class PropertyCardData {
  final String image;
  final String roomNumber;
  final String price;
  final String type;
  final String location;
  bool isOccupied;
  final double starRating;

  PropertyCardData({
    required this.image,
    required this.roomNumber,
    required this.price,
    required this.type,
    required this.location,
    required this.isOccupied,
    required this.starRating,
  });
}

class PropertyCard extends StatelessWidget {
  final String image;
  final String roomNumber;
  final String price;
  final String type;
  final String location;
  final bool isOccupied;
  final double starRating;
  final VoidCallback onPressed;

  const PropertyCard({
    Key? key,
    required this.image,
    required this.roomNumber,
    required this.price,
    required this.type,
    required this.location,
    required this.isOccupied,
    required this.starRating,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              SizedBox(
                width: double.infinity,
                height: 200,
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                color: isOccupied ? Colors.green : Colors.red,
                child: Text(
                  isOccupied ? "Occupied" : "Unoccupied",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.bottomRight,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100, // Replace with your desired background color
                    // Optional: Add rounded corners
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.star, color: Colors.orange),
                      Text(
                        starRating.toStringAsFixed(1),
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  roomNumber,
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.location_on,
                      color: customColor,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      location,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Icon(Icons.home,
                      color: customColor,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      type,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Handle Edit button press
                      },
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                            if (states.contains(MaterialState.pressed)) {
                              return const Color.fromRGBO(33, 84, 115, 1.0);
                            }
                            return const Color.fromRGBO(33, 37, 41, 1.0);
                          },
                        ),
                      ),
                      child: const Text("Edit", style: TextStyle(color: Colors.white)),
                    ),
                    ElevatedButton(
                      onPressed: onPressed,
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                            if (states.contains(MaterialState.pressed)) {
                              return const Color.fromRGBO(33, 37, 41, 1.0);
                            }
                            return const Color.fromRGBO(33, 84, 115, 1.0);
                          },
                        ),
                      ),
                      child: Text(isOccupied ? "Unoccupied" : "Occupied", style: const TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
