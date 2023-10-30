import 'package:absolute_stay/server/server_client.dart';
import 'package:absolute_stay/server/server_url.dart';
import 'package:absolute_stay/usable/TextField.dart';
import 'package:absolute_stay/usable/input_field.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key});

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  double _dialogHeight = 0.0;
  final double _dialogWidth = 350;
  Color customColor = const Color.fromRGBO(33, 84, 115, 1.0);
  bool isOtpsend=false;
  bool isOtpverified=false;
  final TextEditingController _emailController = TextEditingController();
    final TextEditingController _otpcontroller = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    final TextEditingController _reEnterPasswordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    isOtpsend=false;
    isOtpverified=false;
    Future.delayed(const Duration(milliseconds: 50), () {
      setState(() {
        _dialogHeight = 450; // Set your preferred height
      });
    });
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    if (!value.contains('@') || !value.contains('.')) {
      return 'Enter a valid email address';
    }
    return null;
  }

  void forgototp(){

  }

  Widget buildEditableField({
    required String title,
    required TextEditingController controller,
    String? Function(String?)? validator,
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
            validator: validator,
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

// change password 
Future<void>changePassword()async{
final params={
  "email": _emailController.text,
  "newPassword": _passwordController.text
 
};
try{
   final data= await serverClint.postData(params, serverUrl().geturl(RequestType.reset_password));
       if (data['status'] == 'success') {
             Fluttertoast.showToast(
         msg: 'password Changed Successfully',
         toastLength: Toast.LENGTH_SHORT,
         gravity: ToastGravity.BOTTOM,
         backgroundColor: Colors.black,
         textColor: Colors.white,
       );
        setState(() {
      isOtpsend=false;
      isOtpverified=true;
    });
    Navigator.pop(context);
       }else{
           Fluttertoast.showToast(
                              msg: 'Somthing went wrong!',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.black,
                              textColor: Colors.white,
                            );
      print('Request failed: ${data['message']}');
       }

   
   
}catch(e){
  print("Exception occured: $e");

}

}


//verify otp  
Future<void>verifyotp()async{
final params={
    "email": _emailController.text,
    "otp"  : _otpcontroller.text

};
try{
   final data= await serverClint.postData(params, serverUrl().geturl(RequestType.verify_otp));
       if (data['status'] == 'success') {
             Fluttertoast.showToast(
         msg: 'OTP verified Successfully',
         toastLength: Toast.LENGTH_SHORT,
         gravity: ToastGravity.BOTTOM,
         backgroundColor: Colors.black,
         textColor: Colors.white,
       );
        setState(() {
      isOtpsend=false;
      isOtpverified=true;
    });
       }else{
           Fluttertoast.showToast(
                              msg: 'Invalid OTP!',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.black,
                              textColor: Colors.white,
                            );
      print('Request failed: ${data['message']}');
       }

   
   
}catch(e){
  print("Exception occured: $e");

}

}

//forgot password
Future<void>forgotPassword()async{
final params={
  "email" : _emailController.text
};
try{
   final data= await serverClint.postData(params, serverUrl().geturl(RequestType.forgot_password));
       if (data['status'] == 'success') {
             Fluttertoast.showToast(
         msg: 'Mail Sent Successfully',
         toastLength: Toast.LENGTH_SHORT,
         gravity: ToastGravity.BOTTOM,
         backgroundColor: Colors.black,
         textColor: Colors.white,
       );
        setState(() {
      isOtpsend=true;
    });
       }else{
           Fluttertoast.showToast(
                              msg: 'Mail Sent Failed!',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.black,
                              textColor: Colors.white,
                            );
      print('Request failed: ${data['message']}');
       }

   
   
}catch(e){
  print("Exception occured: $e");

}

}

  @override
  Widget build(BuildContext context) {
    const Color customColor = Color.fromRGBO(33, 84, 115, 1.0);


    return AnimatedContainer(
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
      height: _dialogHeight+35,
      width: _dialogWidth,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0, right: 10, left: 10),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  actions: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.close, color: customColor),
                    ),
                  ],
                ),
                const Column(
                  children: [
                    Text(
                      'Password Recovery',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: customColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30.0,
                ),
                ClipOval(
                  child: Lottie.asset(
                    'images/resetpassword.json', // Replace with your animation file path
                    width: 80,
                    height: 80,
                  ),
                ),
                const SizedBox(
                  height: 25.0,
                ),
                isOtpverified?
                 InputField(
                  title: 'Password',
                  isSecured: true,
                  controller: _passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password is required';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ):
                buildEditableField(
                  title: 'Email',
                  controller: _emailController,
                  validator: _validateEmail, // Set the email validator
                ),
                const SizedBox(
                  height: 30,
                ), 
                isOtpverified?
                 InputField(
                  title: 'Re-Enter Password',
                  isSecured: true,
                  controller: _reEnterPasswordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Re-enter your password';
                    }
                    if (value != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ):
                isOtpsend?
                 CustomTextField(
                  maxlength: 6,
                  title: 'OTP',
                  controller: _otpcontroller,
                  
                  isSecured: false,
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length != 6) {
                      return 'Enter a valid 6-digit OTP';
                    }
                    return null;
                  }, 
                  keyboardType: TextInputType.phone,
                  errorTextStyle: const TextStyle(color: Colors.red),
                               ):SizedBox(),
                SizedBox(height: 15,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed:isOtpsend?(){
                          Fluttertoast.showToast(
                            msg: 'Verifying OTP...',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.black,
                            textColor: Colors.white,
                          );
                        verifyotp();
                      }:isOtpverified?(){
                        changePassword();
                      } : () {
                        if (_formKey.currentState!.validate()) {


                          // Show a toast message
                          Fluttertoast.showToast(
                            msg: 'Sending Mail...',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.black,
                            textColor: Colors.white,
                          );
                          forgotPassword();

                        
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
                      child:isOtpverified?Text(
                        'Change',
                        style: TextStyle(color: Colors.white),
                      ): isOtpsend?Text(
                        'Submit',
                        style: TextStyle(color: Colors.white),
                      ): Text(
                        'Send Mail',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
