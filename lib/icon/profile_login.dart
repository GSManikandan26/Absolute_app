import 'package:absolute_stay/animatedbox/login_options.dart';
import 'package:absolute_stay/owner/addProperty.dart';
import 'package:absolute_stay/server/server_url.dart';
import 'package:absolute_stay/server/serverstorage.dart';
import 'package:absolute_stay/sub_vendor/sub_vendor_homepage.dart';
import 'package:absolute_stay/user/user_home.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import '../animatedbox/forgetpassword.dart';
import 'package:absolute_stay/server/server_client.dart';

class ProfileLoginScreen extends StatefulWidget {
  const ProfileLoginScreen({Key? key});

  @override
  _ProfileLoginScreenState createState() => _ProfileLoginScreenState();
}

class _ProfileLoginScreenState extends State<ProfileLoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Color customColor = const Color.fromRGBO(33, 84, 115, 1.0);

  bool _isPasswordVisible = false;
  bool _isEmailValid = true;
  String UserType = '';

  Future<void> loginuser() async {
    final params = {
      "email": _emailController.text,
      "password": _passwordController.text,
    };
    try {
      final data = await serverClint.postData(
          params, serverUrl().geturl(RequestType.login));
      if (data['status'] == 'success') {
        File_server.setLDB("userID", data['data']['user_id']);

        showToast('Login Successfully');
        print("===============${data['data']}============");
        if ("${data['data']['type']}" == "User") {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) =>
                  const UserHomePage(), // Replace with your user page
            ),
          );
        } else if ("${data['data']['type']}" == "Owner") {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) =>
                  const AddProperty(), // Replace with your owner page
            ),
          );
        } else if ("${data['data']['type']}" == "Vendor") {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) =>
                  SubVendorHomePage(), // Replace with your vendor page
            ),
          );
        }
      } else {
        showToast('Somthing went wrong');

        print('Request failed: ${data['message']['type']}');
      }
    } catch (e) {
      print("Error in login $e");
    }
  }

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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
        ),
        child: Padding(
          padding: const EdgeInsets.only(
              top: 30.0, bottom: 20.0, left: 15.0, right: 15.0),
          child: Center(
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Center(
                        child: Text(
                          'Login',
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
                          'images/profile.json',
                          // Replace with your animation file path
                          width: 80,
                          height: 80,
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      TextField(
                        cursorColor: customColor,
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          // Title or label text
                          hintText: 'Email',
                          filled: true,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 20.0),
                          // Adjust padding as needed
                          errorText: _isEmailValid
                              ? null
                              : 'Enter a valid email address',
                          border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(
                              color: customColor,
                            ),
                          ),
                          labelStyle: const TextStyle(color: Colors.black),
                          // Change the label text color here
                          hintStyle: const TextStyle(
                              color: Colors
                                  .grey), // Change the hint text color here
                        ),
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) {
                          setState(() {
                            _isEmailValid = value.contains('@');
                          });
                        },
                      ),
                      const SizedBox(height: 20.0),
                      TextField(
                        cursorColor: customColor,
                        controller: _passwordController,
                        obscureText: !_isPasswordVisible,
                        // Control the visibility of the password
                        decoration: InputDecoration(
                          hintText: 'Password',
                          labelText: 'Password',
                          filled: true,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 20.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(
                              color: customColor,
                            ),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                                _isPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: customColor),
                            onPressed: () {
                              setState(() {
                                _isPasswordVisible =
                                    !_isPasswordVisible; // Toggle the visibility state
                              });
                            },
                          ),
                          labelStyle: const TextStyle(color: Colors.black),
                          hintStyle: const TextStyle(color: Colors.grey),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          _showAnimatedDialog(context, const ForgotPassword());
                        },
                        child: Container(
                          padding: const EdgeInsets.only(right: 24.0),
                          alignment: Alignment.bottomRight,
                          child: Text(
                            "Forgot password?",
                            style: TextStyle(
                              color: customColor,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              _handleLogin(context);
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.pressed)) {
                                    return const Color.fromRGBO(
                                        33, 37, 41, 1.0);
                                  }
                                  return const Color.fromRGBO(33, 84, 115, 1.0);
                                },
                              ),
                            ),
                            child: const Text(
                              'SignIn',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15.0),
                      TextButton(
                        onPressed: () async {
                          _showAnimatedDialog(context, const LoginOptions());
                        },
                        child: Text(
                          "New User? SignUp",
                          style: TextStyle(color: customColor, fontSize: 15),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildEditableField({
    required String title,
    required TextEditingController controller,
    bool isPassword = false,
    String? Function(String?)? validator, // Add the validator parameter
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
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller,
                  obscureText: isPassword && !_isPasswordVisible,
                  validator: validator,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: title,
                    hintStyle: const TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              if (isPassword)
                IconButton(
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

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

  void _handleLogin(BuildContext context) {
    /*if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Login Error'),
            content: const Text('Email and password fields cannot be empty.'),
            actions: <Widget>[
              TextButton(
                child: Text(
                  'OK',
                  style: TextStyle(
                    color: customColor,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else if (_emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      loginuser();
    }else */if (_emailController.text == 'user@gmail.com' &&
        _passwordController.text == 'user') {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) =>
              const UserHomePage(), // Replace with your user page
        ),
      );
    } else if (_emailController.text == 'owner@gmail.com' &&
        _passwordController.text == 'owner') {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) =>
              const AddProperty(), // Replace with your owner page
        ),
      );
    } else if (_emailController.text == 'vendor@gmail.com' &&
        _passwordController.text == 'vendor') {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) =>
              SubVendorHomePage(), // Replace with your vendor page
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Login Error'),
            content: const Text('Invalid email or password.'),
            actions: <Widget>[
              TextButton(
                child: Text(
                  'OK',
                  style: TextStyle(
                    color: customColor,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  /*void _handleLogin(BuildContext context) async {
    final String username = _emailController.text;
    final String password = _passwordController.text;

    final Map<String, String> requestBody = {
      'username': username,
      'password': password,
    };

    try {
      final response = await http.post(
        Uri.parse('https://absolutestay.co.in/api/login'),
        body: requestBody,
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);

        final String userType = responseData['login_type'];

        if (userType == 'user') {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const UserHomePage(),
            ),
          );
        } else if (userType == 'vendor') {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const AddProperty(),
            ),
          );
        }
      } else {
        if (response.statusCode == 401) {
          showToast('Invalid username or password');
        } else {
          // Handle other error status codes as needed
          // ...
        }
      }
    } catch (error) {
      showToast('Network error: $error');
    }
  }*/

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
