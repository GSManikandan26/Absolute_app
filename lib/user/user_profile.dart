import 'dart:convert';
import 'package:absolute_stay/server/model/profile_model.dart';
import 'package:absolute_stay/server/server_client.dart';
import 'package:absolute_stay/server/server_url.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart'as http;

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final TextEditingController _userIdController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
   profileModel? _profile;


  bool _isEditing = false;
  bool isfetching = false;
  Color customColor = const Color.fromRGBO(33, 84, 115, 1.0);

  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black,
      textColor: Colors.white,
    );
  }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchprofile();
    
  }





// profileModel? data;

  Future<void>fetchprofile()async{
     final params = {
        "user_id": "82ef6ad9-1a82-4803-a0b3-dca184a366b6",
      };
    try{
final data = await serverClint.postData(params, serverUrl().geturl(RequestType.getUserData));
    _profile=profileModel.fromJson(data);

     setState(() {
        // Update your UI with the profile data
        _nameController.text = _profile!.name;
        _emailController.text = _profile!.email;
        _mobileController.text = _profile!.type;
        _addressController.text = _profile!.address;
        _cityController.text = _profile!.city; // You can set a default value
        _pincodeController.text = _profile!.pincode;
        isfetching=true; // You can set a default value
      });
    }catch(e){
            print('Failed to fetch profile: $e');

    }

  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Profile',style: TextStyle(color: customColor,fontSize: 25),),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body:!isfetching
            ? Center(child: SizedBox(child: const CircularProgressIndicator()))
            : SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipOval(
              child: Lottie.asset(
                'images/profile.json', // Replace with your animation file path
                width: 80,
                height: 80,
              ),
            ),
            const SizedBox(height: 30.0),
            // buildEditableField(
            //   title: 'User ID',
            //   controller: _userIdController,
            // ),
            const SizedBox(height: 15.0),
            buildEditableField(
              title: 'Name',
              controller: _nameController,
            ),
            const SizedBox(height: 15.0),
            buildEditableField(
              title:  'Email',
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
                  child: Text(_isEditing ? 'Cancel' : 'Edit', style: const TextStyle(color: Colors.white)),
                ),
                ElevatedButton(
                  onPressed: _isEditing
                      ? () async {
                    showToast('Profile Updated Successfully');
                    /* Perform save operation here */

                    // Disable editing mode after saving
                    setState(() {
                      _isEditing = false;
                    });
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
            const SizedBox(height: 80.0),
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
