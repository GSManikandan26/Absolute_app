import 'package:absolute_stay/home/PropertyDetailPage.dart';
import 'package:flutter/material.dart';


class PropertyListingPage extends StatefulWidget {


  const PropertyListingPage({super.key});

  @override
  State<PropertyListingPage> createState() => _PropertyListingPageState();
}

class _PropertyListingPageState extends State<PropertyListingPage> {
  String? selectedValue1;
  String? selectedValue2;
  TextEditingController _location =TextEditingController();

  Color customColor = const Color.fromRGBO(33, 84, 115, 1.0);

  @override
  Widget build(BuildContext context) {
    return 
       Scaffold(
        appBar: AppBar(
          title:  const Text(
            "300+ Places to Stay",
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: ListView(
             padding: const EdgeInsets.all(20.0),
          children: [
            Container(
               padding: const EdgeInsets.symmetric(horizontal: 16.0),
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(20.0),
                 color: const Color.fromARGB(255, 241, 241, 241),
               ),
               child: TextField(
                 controller: _location,
                 decoration: InputDecoration(
                   border: InputBorder.none,
                   hintText: 'Location',
                   hintStyle: const TextStyle(
                     color: Colors.grey,
                   ),
                   suffixIcon: GestureDetector(
                     onTap: (){},
                     child:  Icon(
                       Icons.search,
                       color: customColor,
                     ),
                   ),
                 ),
               ),
             ),
             SizedBox(height: 15,),
            
            Stack(
              children: [
               
                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    height: 55,
                    width: 150,
                    child: DropdownButtonFormField<String>(
                      value: selectedValue1,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedValue1 = newValue;
                        });
                      },
                      items: <String>['Relevance', 'Popularity','Low', 'Medium', 'High']
                          .map<DropdownMenuItem<String>>(
                            (String value) => DropdownMenuItem<String>(
                          value: value,
                          child: Text(value,style: TextStyle(fontSize: 15),),
                        ),
                      )
                          .toList(),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(color: customColor), // Initial border color
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(color: customColor), // Border color when focused
                        ),
                        labelText: 'Sort By',
                        labelStyle: TextStyle(color: customColor),
                        hintText: 'Sort By',
                        hintStyle: const TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20,),
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

  const PropertyCard({
    Key? key,
    required this.image,
    required this.title,
    required this.price,
    required this.distance,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the property detail page here
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const PropertyDetailPage(
            ),
          ),
        );
      },
      child: Card(
        elevation: 5,
        margin: const EdgeInsets.only(bottom: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: 200,
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
                  Text(
                    price,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: 8,),
                  Text(
                    distance,
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
      ),
    );
  }
}

