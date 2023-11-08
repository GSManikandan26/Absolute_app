import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';



import 'package:absolute_stay/model/propertyModel.dart';
import 'package:absolute_stay/model/usermodel.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ApprovedContent extends StatefulWidget {
  const ApprovedContent({Key? key}) : super(key: key);

  @override
  State<ApprovedContent> createState() => _ApprovedContentState();
}

Color customColor = const Color.fromRGBO(33, 84, 115, 1.0);

class _ApprovedContentState extends State<ApprovedContent> {

  @override
  void initState() {
    super.initState();
  }
// PropertyModel? _property; 
bool _isfetching=false;
List<PropertyModel>_fetchedProperty=[];

 void showToast(String message, var color) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: color,
      textColor:Colors.black,
    );
  }





  void togglePublishStatus(int index) {
    setState(() {
      // propertyData[index].isPublished = !propertyData[index].isPublished;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children:[
              _isfetching? Container(
                padding: const EdgeInsets.all(16.0),
                child:  Expanded(
                  child: Flex(
                   direction: Axis.vertical,
                    children: [
                                ListView.builder(
                                  shrinkWrap: true,
                                    // physics: const NeverScrollableScrollPhysics(),
                                  itemCount: _fetchedProperty.length,
                                  itemBuilder: (BuildContext context,int index) {
                                    var item=_fetchedProperty[index];
                                    print(item.roomImages[0]);
                    
                                    return SizedBox(
                                      child: Card(
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
                                                     
                                                        child: Image.memory(Uint8List.fromList(base64Decode(item.roomImages[0])))
                                                        ),
                                                        Container(
                                                        padding: const EdgeInsets.all(8.0),
                                                        color: item.status=="true" ? Colors.green : Colors.red,
                                                        child: Text(
                                                          item.status=="true" ? "Published" : "Unpublished",
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
                                                          child: const Row(
                                                            mainAxisSize: MainAxisSize.min,
                                                            children: [
                                                         Icon(Icons.star, color: Colors.orange),
                                                         Text(
                                                           // starRating.toStringAsFixed(1),
                                                           "starRating",
                                                           style: TextStyle(
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
                                                          item.propertyName.toString(),
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
                                                         item.streetAddress.toString(),
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
                                                         item.propertyType.toString(),
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
                                                         onPressed: (){},
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
                                                         child: Text(item.status=="true" ? "Unpublish" : "Publish", style: const TextStyle(color: Colors.white)),
                                                            ),
                                                          ],
                                                        ),
                                                        ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                    );
                  
                                  
                                 }),
                     
                                const SizedBox(height: 25.0),
                              ],
                  ),
                ),
              ):const Center(child:Text("No data")),
            ]
          ),
        ),
      ),
    );
  }
}

// class PropertyCardData {
//   final List<String> image;
//   final String title;
//   final double price;
//   final String type;
//   final String location;
//   bool isPublished;
//   final double starRating;

//   PropertyCardData({
//     required this.image,
//     required this.title,
//     required this.price,
//     required this.type,
//     required this.location,
//     required this.isPublished,
//     required this.starRating,
//   });
// }

class PropertyCard extends StatelessWidget {
  final Uint8List image;
  final String title;
  final String price;
  final String type;
  final String location;
  final String isPublished;
  final String starRating;
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
                child: Image.memory(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                color: isPublished=="true" ? Colors.green : Colors.red,
                child: Text(
                  isPublished=="true" ? "Published" : "Unpublished",
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
                        // starRating.toStringAsFixed(1),
                        starRating,
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
                      child: Text(isPublished=="true" ? "Unpublish" : "Publish", style: const TextStyle(color: Colors.white)),
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
