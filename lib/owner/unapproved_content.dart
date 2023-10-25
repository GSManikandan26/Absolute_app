import 'package:flutter/material.dart';

class UnapprovedContent extends StatefulWidget {
  const UnapprovedContent({Key? key}) : super(key: key);

  @override
  State<UnapprovedContent> createState() => _UnapprovedContentState();
}

Color customColor = const Color.fromRGBO(33, 84, 115, 1.0);

class _UnapprovedContentState extends State<UnapprovedContent> {
  List<PropertyCardData> propertyData = [
    PropertyCardData(
      image: 'images/image1.png',
      title: 'Hilton Vienna Park',
      price: '₹2,800 / Day',
      type: 'Hotel',
      location: 'Chennai',
      isPublished: true,
      starRating: 4.5,
    ),
    PropertyCardData(
      image: 'images/image2.png',
      title: 'Hotel XYZ',
      price: '₹2,500 / Day',
      type: 'Hotel',
      location: 'Chennai',
      isPublished: false,
      starRating: 3.8,
    ),
    PropertyCardData(
      image: 'images/image3.png',
      title: 'Sunset Resorts',
      price: '₹3,500 / Day',
      type: 'Commercial Space',
      location: 'Chennai',
      isPublished: true,
      starRating: 4.2,
    ),
    PropertyCardData(
      image: 'images/image4.png',
      title: 'City Suites',
      price: '₹2,200 / Day',
      type: 'Resort',
      location: 'Chennai',
      isPublished: true,
      starRating: 4.0,
    ),
  ];

  void togglePublishStatus(int index) {
    setState(() {
      propertyData[index].isPublished = !propertyData[index].isPublished;
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
                  title: data.title,
                  price: data.price,
                  type: data.type,
                  location: data.location,
                  isPublished: data.isPublished,
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
  final String title;
  final String price;
  final String type;
  final String location;
  bool isPublished;
  final double starRating;

  PropertyCardData({
    required this.image,
    required this.title,
    required this.price,
    required this.type,
    required this.location,
    required this.isPublished,
    required this.starRating,
  });
}

class PropertyCard extends StatelessWidget {
  final String image;
  final String title;
  final String price;
  final String type;
  final String location;
  final bool isPublished;
  final double starRating;
  final VoidCallback onPressed;

  const PropertyCard({
    Key? key,
    required this.image,
    required this.title,
    required this.price,
    required this.type,
    required this.location,
    required this.isPublished,
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
                color: isPublished ? Colors.green : Colors.red,
                child: Text(
                  isPublished ? "Published" : "Unpublished",
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
                  title,
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: customColor, // Set the custom color here
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
                    Icon(
                      Icons.home,
                      color: customColor, // Set the custom color here
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
                    Card(
                      elevation: 3,
                      color: Colors.grey.shade100, // Change the color as needed
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Verification Pending',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
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
