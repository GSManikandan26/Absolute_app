import 'package:absolute_stay/animatedbox/LocationDateDialog.dart';
import 'package:flutter/material.dart';


class PropertyListingPage extends StatefulWidget {


  const PropertyListingPage({super.key});

  @override
  State<PropertyListingPage> createState() => _PropertyListingPageState();
}

class _PropertyListingPageState extends State<PropertyListingPage> {
  String? selectedValue1;
  String? selectedValue2;

  Color customColor = const Color.fromRGBO(33, 84, 115, 1.0);

  void _showAnimatedDialog(BuildContext context, var val) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: val,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Property List'),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: () {
                _showAnimatedDialog(context, const LocationDateDialog());
              },
              icon: Image.asset(
                'images/filter.png',  // Replace 'your_image.png' with the actual image path
                width: 30,  // Set the desired width for the image
                height: 30, // Set the desired height for the image
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          Center(
            child: Text(
              "300+ Places to Stay",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: customColor
              ),
            ),
          ),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 10),
            child: DropdownButtonFormField<String>(
              value: selectedValue1,
              onChanged: (String? newValue) {
                setState(() {
                  selectedValue1 = newValue;
                });
              },
              items: <String>['Relevance', 'Popularity']
                  .map<DropdownMenuItem<String>>(
                    (String value) => DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                ),
              )
                  .toList(),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(color: customColor), // Initial border color
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(color: customColor), // Border color when focused
                ),
                labelText: 'Sort By',
                labelStyle: TextStyle(color: customColor),
                hintText: 'Sort By',
                hintStyle: const TextStyle(color: Colors.black),
              ),
            ),
          ),
          const SizedBox(height: 30,),
          const PropertyCard(
            image: 'images/image1.png',
            title: 'Hilton Vienna Park',
            price: '₹2,800 / Day',
            distance: '2.5km from central',
            description:
            'You can easily book your according to your budget hotel by our website.',
          ),
          const SizedBox(height: 25,),
          const PropertyCard(
            image: 'images/image1.png',
            title: 'Hotel XYZ',
            price: '₹2,500 / Day',
            distance: '3.0km from central',
            description:
            'Enjoy your stay at Hotel XYZ with affordable prices and great amenities.',
          ),
          const SizedBox(height: 25,),
          const PropertyCard(
            image: 'images/image1.png',
            title: 'Sunset Resorts',
            price: '₹3,500 / Day',
            distance: '1.0km from central',
            description:
            'Experience a luxurious stay at Sunset Resorts with stunning views.',
          ),
          const SizedBox(height: 25,),
          const PropertyCard(
            image: 'images/image1.png',
            title: 'City Suites',
            price: '₹2,200 / Day',
            distance: '2.2km from central',
            description:
            'City Suites offers comfortable accommodation for your trip.',
          ),
        ],
      ),
    );
  }
}

class PropertyCard extends StatelessWidget {
  final String image;
  final String title;
  final String price;
  final String distance;
  final String description;

  const PropertyCard({super.key,
    required this.image,
    required this.title,
    required this.price,
    required this.distance,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity, // Set the width to match the card's width
            height: 200, // Set a fixed height for the image
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
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
                const SizedBox(height: 8,),
                Text(price,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(height: 8,),
                Text(distance,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(height: 8,),
                Text(description),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
