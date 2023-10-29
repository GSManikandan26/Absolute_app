import 'package:get/get_connect/http/src/request/request.dart';

class serverUrl{
  static String baseUrl ="http://192.168.1.5:3000/api/";


geturl(RequestType RequestTypes){
  switch (RequestTypes){
    case RequestType.register:
        return baseUrl+RequestType.register.name;

    case RequestType.getUserData:
        return baseUrl+RequestType.getUserData.name;

    case RequestType.login:
         return baseUrl + RequestType.login.name;   
    case RequestType.forgot_password:
        return baseUrl+RequestType.forgot_password.name;
    case RequestType.verify_otp:
        return baseUrl+RequestType.verify_otp.name;
    case RequestType.reset_password:
        return baseUrl+RequestType.reset_password.name;
    case RequestType.updateUser:
        return baseUrl+RequestType.updateUser.name;
  }

}

}


enum RequestType{
  register,
  login,
  forgot_password,
  verify_otp,
  reset_password,
  getUserData,
  updateUser,

}
