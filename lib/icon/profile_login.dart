import 'package:absolute_stay/animatedbox/login_options.dart';
import 'package:absolute_stay/owner/addProperty.dart';
import 'package:absolute_stay/user/user_home.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import '../animatedbox/forgetpassword.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class ProfileLoginScreen extends StatefulWidget {
  const ProfileLoginScreen({Key? key});

  @override
  _ProfileLoginScreenState createState() => _ProfileLoginScreenState();
}

class _ProfileLoginScreenState extends State<ProfileLoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isPasswordVisible = false;


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
    const Color customColor = Color.fromRGBO(33, 84, 115, 1.0);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0, bottom: 20.0, left: 15.0, right: 15.0),
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
                      const Center(
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
                          'images/profile.json', // Replace with your animation file path
                          width: 80,
                          height: 80,
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      buildEditableField(
                        title: 'Email',
                        controller: _emailController,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              !value.contains('@') ||
                              !value.contains('.')) {
                            return 'Enter a valid email address';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15.0),
                      buildEditableField(
                        title: 'Password',
                        isPassword: true,
                        controller: _passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password is required';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: (){
                          _showAnimatedDialog(context, const ForgotPassword());
                        },
                        child: Container(
                          padding: const EdgeInsets.only(right: 24.0),
                          alignment: Alignment.bottomRight,
                          child: const Text(
                            "Forgot password?",
                            style: TextStyle(
                              color: customColor,fontSize: 16,
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
                              if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
                                showToast('Fill all fields');
                              } else {
                                _handleLogin(context);
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
                        child: const Text(
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
                    _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
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


  void _handleLogin(BuildContext context) async {
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
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
