import 'dart:io';
import 'package:absolute_stay/owner/SuccessScreen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;
import '../about/cookie_policy.dart';
import '../about/privacy_policy.dart';
import '../about/terms_and_conditions.dart';
import '../home/homepage.dart';
import 'MyProperty.dart';
import 'Service.dart';
import 'TicketDetailsPage.dart';
import 'owner_profile.dart';
import 'payment_notification.dart';
import 'tenant_list.dart';
import 'vacant_list.dart';

class AddProperty extends StatefulWidget {
  const AddProperty({Key? key}) : super(key: key);

  @override
  _AddPropertyState createState() => _AddPropertyState();
}

class _AddPropertyState extends State<AddProperty> {
  Color defaultColor = Colors.grey.shade100;
  Color customColor = const Color.fromRGBO(33, 84, 115, 1.0);
  late Color selectedColor = customColor;

  final Map<String, IconData> menuIcons = {
    'Profile': Icons.account_circle,
    'adminServices': Icons.business,
    'Tenant List': Icons.people,
    'My Property': Icons.apartment,
    'Manage Payment': Icons.payment,
    'Vacant List': Icons.home,
    'Ticket list': Icons.receipt,
    'logout': Icons.exit_to_app,
  };

  void handleDrawerSelection(String value, BuildContext context) {
    switch (value) {
      case 'Tenant List':
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const TenantListPage(),
          ),
        );
        break;
      case 'Manage Payment':
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const PaymentNotificationPage(),
          ),
        );
        break;
      case 'adminServices':
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const AdminServicesPage(),
          ),
        );
        break;
      case 'Owner Profile':
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const OwnerProfileScreen(),
          ),
        );
        break;
      case 'My Property':
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) =>  MyPropertyApp(),
          ),
        );
        break;
      case 'Vacant List':
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) =>  VacantListPage(),
          ),
        );
        break;
      case 'Ticket list':
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const VendorTicketListPage(),
          ),
        );
        break;
      case 'logout':
        Navigator.pop(context); // Close the drawer if it's open
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
              (Route<dynamic> route) => false,
        );
        // Perform logout action
        break;
      default:
      // Handle other selections if needed
        break;
    }
  }


  String selectedPropertyType = '';
  List<File> imageFiles = [];
  List<File> roomImageFiles = [];

  int _currentImageIndex = 0;

  List<String> imagePaths = [
    'images/image1.png',
    'images/image2.png',
    'images/image3.png',
    // Add more image paths here
  ];

  TextEditingController propertyNameController = TextEditingController();
  TextEditingController streetAddressController = TextEditingController();
  TextEditingController unitAddressController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController zipcodeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController roomTypeNameController = TextEditingController();
  TextEditingController roomPriceController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Property'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      drawer: SafeArea(
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: customColor,
                ),
                child: const Center(
                  child: Text(
                    'Welcome Owner ! ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(menuIcons['Profile']),
                title: const Text('Profile'),
                onTap: () {
                  handleDrawerSelection('Owner Profile', context);
                },
              ),
              ListTile(
                leading: Icon(menuIcons['My Property']),
                title: const Text('My Property'),
                onTap: () {
                  handleDrawerSelection('My Property', context);
                },
              ),
              ListTile(
                leading: Icon(menuIcons['Tenant List']),
                title: const Text('List of the Tenants'),
                onTap: () {
                  handleDrawerSelection('Tenant List', context);
                },
              ),
              ListTile(
                leading: Icon(menuIcons['Manage Payment']),
                title: const Text('Manage Payment'),
                onTap: () {
                  handleDrawerSelection('Manage Payment', context);
                },
              ),
              ListTile(
                leading: Icon(menuIcons['Vacant List']),
                title: const Text('Vacant List'),
                onTap: () {
                  handleDrawerSelection('Vacant List', context);
                },
              ),
              ListTile(
                leading: Icon(menuIcons['Ticket list']),
                title: const Text('Tenant Raised Tickets'),
                onTap: () {
                  handleDrawerSelection('Ticket list', context);
                },
              ),
              ListTile(
                leading: Icon(menuIcons['adminServices']),
                title: const Text('Services Provided by Admin'),
                onTap: () {
                  handleDrawerSelection('adminServices', context);
                },
              ),
              ListTile(
                leading: Icon(menuIcons['logout']),
                title: const Text('Logout'),
                onTap: () {
                  handleDrawerSelection('logout', context);
                },
              ),
              const SizedBox(height: 50.0),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 20.0),
                color: Colors.grey[200],
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Instagram Icon with URL
                        GestureDetector(
                          onTap: () {
                            launcher.launchUrl(Uri.parse('https://www.instagram.com/absolute_stay_coporate_livings/')); // Open Instagram URL
                          },
                          child: const Icon(
                            FontAwesomeIcons.instagram,
                          ),
                        ),
                        // Facebook Icon with URL
                        GestureDetector(
                          onTap: () {
                            launcher.launchUrl(Uri.parse('https://www.facebook.com/absolutestaycorporate')); // Open Facebook URL
                          },
                          child: const Icon(
                            FontAwesomeIcons.facebook,
                          ),
                        ),
                        // Twitter Icon with URL
                        GestureDetector(
                          onTap: () {
                            launcher.launchUrl(Uri.parse('https://twitter.com/AbsoluteStay')); // Open Twitter URL
                          },
                          child: const Icon(
                            FontAwesomeIcons.twitter,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    ListTile(
                      title: const Text('Terms & Conditions'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TermsAndConditionsPage(),
                          ),
                        );
                      },
                    ),

                    ListTile(
                      title: const Text('Cookie Policy for App'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CookiePolicyPage(),
                          ),
                        );
                      },
                    ),

                    ListTile(
                      title: const Text('Privacy Policy'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PrivacyPolicyPage(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  _buildInputField(
                    title: 'Property Name',
                    controller: propertyNameController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  _buildPropertyTypeButtons(),
                  const SizedBox(
                    height: 20,
                  ),
                  _buildInputField(
                    title: 'Street Address',
                    controller: streetAddressController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  _buildInputField(
                    title: 'Unit Address',
                    controller: unitAddressController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  _buildInputField(
                    title: 'Country',
                    controller: countryController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  _buildInputField(
                    title: 'Zipcode',
                    controller: zipcodeController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Which Features Does Your Property Have?',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // Checkbox options for property features
                      for (int i = 0; i < checkboxNames.length; i++)
                        CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          title: Text(checkboxNames[i],style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),),
                          value: checkboxValues[i],
                          onChanged: (value) => _onCheckboxChanged(i, value!),
                          activeColor: customColor,
                        ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  _buildInputField(
                    title: 'Enter Description',
                    controller: descriptionController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Which Features Does Your Property Have? Max 5 image',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  if (imageFiles.isNotEmpty)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              for (int index = 0;
                              index < imageFiles.length;
                              index++)
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Stack(
                                    children: [
                                      Container(
                                        width: 100,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1,
                                          ),
                                        ),
                                        child: Image.file(imageFiles[index]),
                                      ),
                                      Positioned(
                                        top: 0,
                                        right: 0,
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              imageFiles.removeAt(index);
                                            });
                                          },
                                          child: Container(
                                            decoration: const BoxDecoration(
                                              color: Colors.transparent,
                                              shape: BoxShape.circle,
                                            ),
                                            padding: const EdgeInsets.all(4),
                                            child: const Icon(
                                              Icons.close,
                                              size: 20,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: () async {
                            final picker = ImagePicker();
                            final pickedImage = await picker.pickImage(
                              source: ImageSource.gallery,
                            );

                            if (pickedImage != null) {
                              setState(() {
                                imageFiles.add(File(pickedImage.path));
                              });
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed)) {
                                  return const Color.fromRGBO(33, 37, 41, 1.0);
                                }
                                return const Color.fromRGBO(33, 84, 115, 1.0);
                              },
                            ),
                          ),
                          icon: const Icon(Icons.add, color: Colors.white),
                          label: const Text(
                            "Add More",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton.icon(
                    onPressed: () async {
                      final picker = ImagePicker();
                      final pickedImage = await picker.pickImage(
                        source: ImageSource.gallery,
                      );

                      if (pickedImage != null) {
                        setState(() {
                          imageFiles.add(File(pickedImage.path));
                        });
                      }
                    },
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
                    icon: const Icon(Icons.image, color: Colors.white),
                    label: const Text(
                      "Upload Images",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  _buildInputField(
                    title: 'Room Type Name',
                    controller: roomTypeNameController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  _buildInputField(
                    title: 'Room Prize',
                    controller: roomPriceController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Room Images
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Room Images: Max 5 images',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  if (roomImageFiles.isNotEmpty)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              for (int index = 0;
                              index < roomImageFiles.length;
                              index++)
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Stack(
                                    children: [
                                      Container(
                                        width: 100,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1,
                                          ),
                                        ),
                                        child: Image.file(roomImageFiles[index]),
                                      ),
                                      Positioned(
                                        top: 0,
                                        right: 0,
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              roomImageFiles.removeAt(index);
                                            });
                                          },
                                          child: Container(
                                            decoration: const BoxDecoration(
                                              color: Colors.transparent,
                                              shape: BoxShape.circle,
                                            ),
                                            padding: const EdgeInsets.all(4),
                                            child: const Icon(
                                              Icons.close,
                                              size: 20,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: () async {
                            final picker = ImagePicker();
                            final pickedImage = await picker.pickImage(
                              source: ImageSource.gallery,
                            );

                            if (pickedImage != null) {
                              setState(() {
                                roomImageFiles.add(File(pickedImage.path));
                              });
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed)) {
                                  return const Color.fromRGBO(33, 37, 41, 1.0);
                                }
                                return const Color.fromRGBO(33, 84, 115, 1.0);
                              },
                            ),
                          ),
                          icon: const Icon(Icons.add, color: Colors.white),
                          label: const Text(
                            "Add More",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton.icon(
                    onPressed: () async {
                      final picker = ImagePicker();
                      final pickedImage = await picker.pickImage(
                        source: ImageSource.gallery,
                      );

                      if (pickedImage != null) {
                        setState(() {
                          roomImageFiles.add(File(pickedImage.path));
                        });
                      }
                    },
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
                    icon: const Icon(Icons.image, color: Colors.white),
                    label: const Text(
                      "Upload Room Images",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Divider(height: 5,),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "Preview",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Card(
                    elevation: 5,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: CarouselSlider(
                            items: imagePaths.map((imagePath) {
                              return Container(
                                margin: const EdgeInsets.all(5),
                                child: Image.asset(
                                  imagePath,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                ),
                              );
                            }).toList(),
                            options: CarouselOptions(
                              height: 200,
                              initialPage: 0,
                              enableInfiniteScroll: true,
                              autoPlay: true, // Enable automatic sliding
                              autoPlayInterval: const Duration(seconds: 2), // Set the interval (2 seconds in this example)
                              autoPlayAnimationDuration: const Duration(milliseconds: 800), // Animation duration
                              viewportFraction: 1.0,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  _currentImageIndex = index;
                                });
                              },
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: imagePaths.map((imagePath) {
                            int index = imagePaths.indexOf(imagePath);
                            return Container(
                              width: 8.0,
                              height: 8.0,
                              margin: const EdgeInsets.symmetric(horizontal: 2.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _currentImageIndex == index
                                    ? customColor
                                    : Colors.grey,
                              ),
                            );
                          }).toList(),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "₹2,800 / Day",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5,),
                              Text(
                                "3 Bedroom Apartment in Salwa",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5,),
                              Text(
                                "You can easily book your according to your budget hotel by our website.",
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed)) {
                                return const Color.fromRGBO(33, 84, 115, 1.0);
                              }
                              return const Color.fromRGBO(33, 37, 41, 1.0);
                            },
                          ),
                        ),
                        child: const Text(
                          'Save and Exit',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const SuccessScreen()),
                          );
                        },
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
                        child: const Text(
                          'Add Property',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  const Divider(height: 5,)

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onCheckboxChanged(int index, bool value) {
    setState(() {
      checkboxValues[index] = value;
    });
  }

  Widget _buildInputField({
    required String title,
    required TextEditingController controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        const SizedBox(
          height: 5,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.transparent, width: 0),
            color: const Color.fromARGB(255, 241, 241, 241),
          ),
          child: TextFormField(
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
            controller: controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: title,
              hintStyle: const TextStyle(color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }

  List<bool> checkboxValues = List.generate(6, (_) => false);
  List<String> checkboxNames = [
    'Swimming pool',
    'Furnished',
    'Heater',
    'Parking',
    'Heater',
    'Kitchen',
  ];

  Widget _buildPropertyTypeButtons() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Property Type'),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () => _changePropertyType('Apartment'),
              style: ElevatedButton.styleFrom(
                backgroundColor: selectedPropertyType == 'Apartment'
                    ? selectedColor
                    : defaultColor,
              ),
              child: Text(
                'Apartment',
                style: TextStyle(
                  color: selectedPropertyType == 'Apartment'
                      ? Colors.white
                      : Colors.black,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () => _changePropertyType('Villa'),
              style: ElevatedButton.styleFrom(
                backgroundColor: selectedPropertyType == 'Villa'
                    ? selectedColor
                    : defaultColor,
              ),
              child: Text(
                'Villa',
                style: TextStyle(
                  color: selectedPropertyType == 'Villa'
                      ? Colors.white
                      : Colors.black,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () => _changePropertyType('Resort'),
              style: ElevatedButton.styleFrom(
                backgroundColor: selectedPropertyType == 'Resort'
                    ? selectedColor
                    : defaultColor,
              ),
              child: Text(
                'Resort',
                style: TextStyle(
                  color: selectedPropertyType == 'Resort'
                      ? Colors.white
                      : Colors.black,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () => _changePropertyType('PG'),
              style: ElevatedButton.styleFrom(
                backgroundColor: selectedPropertyType == 'PG'
                    ? selectedColor
                    : defaultColor,
              ),
              child: Text(
                'PG',
                style: TextStyle(
                  color: selectedPropertyType == 'PG'
                      ? Colors.white
                      : Colors.black,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _changePropertyType(String type) {
    setState(() {
      selectedPropertyType = type;
    });
  }
}


