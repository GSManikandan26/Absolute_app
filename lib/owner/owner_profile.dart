import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart' as http;

class OwnerProfileScreen extends StatefulWidget {
  const OwnerProfileScreen({Key? key});

  @override
  _OwnerProfileScreenState createState() => _OwnerProfileScreenState();
}

class _OwnerProfileScreenState extends State<OwnerProfileScreen> {
  final TextEditingController _userIdController = TextEditingController(text: "Enter User ID");
  final TextEditingController _nameController = TextEditingController(text: "Enter Your Name");
  final TextEditingController _emailController = TextEditingController(text: "Enter Your Email");
  final TextEditingController _mobileController = TextEditingController(text: "Enter Your Email");
  final TextEditingController _addressController = TextEditingController(text: "Enter Your Address");
  final TextEditingController _cityController = TextEditingController(text: "Enter Your City");
  final TextEditingController _pincodeController = TextEditingController(text: "Enter Your Pincode");
  final TextEditingController _profileImageController = TextEditingController(text: "Enter Your Image URL");
  bool _isEditing = false;

  Color customColor = const Color.fromRGBO(33, 84, 115, 1.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Center(
              child: Text(
                'Profile',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: customColor,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            ClipOval(
              child: Lottie.asset(
                'images/profile.json', // Replace with your animation file path
                width: 80,
                height: 80,
              ),
            ),
            const SizedBox(height: 30.0),
            buildEditableField(
              title: 'User ID',
              controller: _userIdController,
            ),
            const SizedBox(height: 15.0),
            buildEditableField(
              title: 'Name',
              controller: _nameController,
            ),
            const SizedBox(height: 15.0),
            buildEditableField(
              title: 'Email',
              controller: _emailController,
            ),
            const SizedBox(height: 15.0),
            buildEditableField(
              title: 'Mobile',
              controller: _mobileController,
            ),
            const SizedBox(height: 15.0),
            buildEditableField(
              title: 'Address',
              controller: _addressController,
            ),
            const SizedBox(height: 15.0),
            buildEditableField(
              title: 'City',
              controller: _cityController,
            ),
            const SizedBox(height: 15.0),
            buildEditableField(
              title: 'Pincode',
              controller: _pincodeController,
            ),
            const SizedBox(height: 15.0),
            buildEditableField(
              title: 'Profile Image',
              controller: _profileImageController,
            ),
            const SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Toggle editing mode
                    setState(() {
                      _isEditing = !_isEditing;
                    });
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
                  child: Text(_isEditing ? 'Cancel' : 'Edit', style: TextStyle(color: Colors.white)),
                ),
                ElevatedButton(
                  onPressed: _isEditing
                      ? () async {
                    final response = await http.post(
                      Uri.parse('https://absolutestay.co.in/api/profile_update'),
                      body: {
                        'user_id': _userIdController.text,
                        'name': _nameController.text,
                        'email': _emailController.text,
                        'mobile': _mobileController.text,
                        'address': _addressController.text,
                        'city': _cityController.text,
                        'pincode': _pincodeController.text,
                        'profile_image': _profileImageController.text,
                      },
                    );

                    if (response.statusCode == 200) {
                      // Successful request
                      print('Profile updated successfully.');
                      setState(() {
                        _isEditing = false; // Disable editing mode after saving
                      });
                    } else {
                      // Handle errors
                      print('Failed to update profile. Status code: ${response.statusCode}');
                    }
                  }
                      : null, // Disable the button if not editing
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
                    'Save',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }

  Widget buildEditableField({
    required String title,
    required TextEditingController controller,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
        const SizedBox(height: 5),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.transparent, width: 0),
            color: const Color.fromARGB(255, 241, 241, 241),
          ),
          child: TextFormField(
            controller: controller,
            enabled: _isEditing, // Enable or disable the text field based on the editing mode
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
}

