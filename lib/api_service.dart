import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:untitled/config.dart';
import 'package:untitled/model/otp_login_response_model.dart';

class APIService {
  static var client=http.Client();

  static Future<OtpLoginResponseModel> otpLogin(String mobileNo)async{
    Map<String,String>requestHeaders={'Content-Type':"Application/json"};

    var url=Uri.https(Config().apiURL.toString(), Config.otpLoginAPI);
    var response=await client.post(url,headers: requestHeaders,
    body: jsonEncode({"phone":mobileNo},),);
    
    return otpLoginResponse(response.body);
  }
  static Future<OtpLoginResponseModel> verifyOtp(String mobileNo,
      String otpHash,
      String otpCode)async{
    Map<String,String>requestHeaders={'Content-Type':"Application/json"};

    var url=Uri.https(Config().apiURL.toString(), Config.otpVerifyAPI);
    var response=await client.post(url,headers: requestHeaders,
        body: jsonEncode({"phone":mobileNo,
          "otp":otpCode,"hash":otpHash}));
    return otpLoginResponse(response.body);
}
}
