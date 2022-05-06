// import 'package:flutter/cupertino.dart';
// import 'dart:ui';
//
// import 'package:flutter/material.dart';
// import 'package:snippet_coder_utils/FormHelper.dart';
// import 'package:snippet_coder_utils/ProgressHUD.dart';
// import 'package:untitled/api_service.dart';
// import 'package:untitled/screens/otp_verify.dart';
//
// class LogIn extends StatefulWidget {
//   String mobileNo='';
//   bool isAPICallprocess=false;
//
//   LogIn({Key? key}) : super(key: key);
//
//   @override
//   State<LogIn> createState() => _LogInState();
// }
//
// class _LogInState extends State<LogIn> {
//   // final emailController=TextEditingController();
//   // final passwordController=TextEditingController();
//   final phoneController = TextEditingController();
//
//   bool isAPICallProcess=false;
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//           // appBar: AppBar(
//           //   title: Text("Login"),
//           // ),
//             body: ProgressHUD(child: loginUI(),
//               inAsyncCall: isAPICallProcess,
//               opacity: 3,
//               key: UniqueKey(),
//             )
//         )
//     );
//   }
//
//   loginUI() {
//     return Padding(padding: EdgeInsets.all(10),
//       child: ListView(
//           children: [
//             Container(height: 250, width: double.infinity,
//                 child: Image.asset("assets/images/images.png")),
//             Text(
//               "Login",
//               style: TextStyle(
//                   fontSize: 30,
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 20,),
//             Text("Phone"),
//             SizedBox(height: 10,),
//             TextFormField(
//               controller: phoneController,
//               decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   icon: Icon(Icons.email),
//                   labelText: "Enter mobile Number"
//               ),
//             ),
//             // SizedBox(height: 15,),
//             // Text("Password"),
//             // SizedBox(height: 15,),
//             // TextFormField(
//             //   controller: passwordController,
//             //   decoration: InputDecoration(
//             //     border: OutlineInputBorder(),
//             //     icon: Icon(Icons.lock),
//             //     labelText: "Password"
//             //   ),
//             // ),
//             SizedBox(height: 20,),
//             Center(
//               child: FormHelper.submitButton("Continue", (){
//                 var mobileNo;
//                 if(mobileNo.length>9){
//                   setState(() {
//                     isAPICallProcess=true;
//                   });
//                   APIService.otpLogin(mobileNo).then((response) async{
//                     isAPICallProcess=false;
//                   });
//                   if(response.data!=null){
//                     Navigator.pushNamedAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>OTPVerify(
//                       otpHash: response.data,
//                       mobileNo: mobileNo,
//                     )), (route) => false)),
//                 (route)=>false
//                 ),
//                   }
//                 }
//               }
//             SizedBox(height: 30,),
//             Center(child: Text("Or, login with...")),
//             SizedBox(height: 40,),
//             Expanded(
//               child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     Center(child: Icon(Icons.facebook, size: 60,),),
//                     Center(child: Icon(Icons.apple, size: 60,),),
//                     Center(child: Icon(Icons.phone_android, size: 60,),)
//                   ]
//               ),
//             ),
//             SizedBox(height: 40,),
//             Center(
//               child: RichText(text: TextSpan(text: "New to StockDaddy? ",
//                   style: TextStyle(fontSize: 15, color: Colors.black),
//                   children: <TextSpan>[
//                     TextSpan(text: "Register",
//                       style: TextStyle(color: Colors.blue, fontSize: 15),)
//                   ])),
//             ),
//           ]),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:snippet_coder_utils/hex_color.dart';
import 'package:untitled/api_service.dart';
import 'package:untitled/screens/otp_verify.dart';

class LoginOTPPage extends StatefulWidget {
  const LoginOTPPage({Key? key}) : super(key: key);

  @override
  State<LoginOTPPage> createState() => _LoginOTPPageState();
}

class _LoginOTPPageState extends State<LoginOTPPage> {
  String mobileNo = '';
  bool isAPICallProcess = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ProgressHUD(
        child: loginUI(),
        inAsyncCall: isAPICallProcess,
        opacity: 0.3,
        key: UniqueKey(),
      ),
    ));
  }

  loginUI() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/images.png",
          height: 250,
          fit: BoxFit.contain,
        ),
        Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "Login with a Mobile Number",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
        SizedBox(
          height: 10,
        ),
        Text(
          "Enter your Mobile Number We Will Send You OTP to verify",
          style: TextStyle(fontSize: 14),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Container(
                  height: 47,
                  width: 50,
                  margin: EdgeInsets.fromLTRB(0, 10, 3, 30),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: Colors.grey,
                      )),
                        child: const Center(
                          child: Text(
                      "+91",
                      style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black,),
                    ),
                        )),
                  ),
                  Flexible(
                      flex: 5,
                      child: TextFormField(
                          maxLines: 1,
                          maxLength: 10,
                          decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(6),
                              hintText: "Mobile Number",
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.grey, width: 1)),
                              border: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.grey, width: 1)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.grey, width: 1))),
                          keyboardType: TextInputType.number,
                          onChanged: (String value) {
                            if (value.length > 9) {
                              mobileNo = value;
                            }
                          })),
            ],
          ),
        ),
        Center(
          child: FormHelper.submitButton("Continue", () {
            if (mobileNo.length > 9) {
              setState(() {
                isAPICallProcess = true;
              });
              APIService.otpLogin(mobileNo).then(
                (response) async {
                  setState(() {
                    isAPICallProcess = false;
                  });
                  print(response.message);
                  print(response.data);
                  if (response.data != null) {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OTPVerify(
                                  otpHash: response.data,
                                  mobileNo: mobileNo,
                                )),
                        (route) => false);
                  }
                },
              );
            }
          },
              borderColor: HexColor("#78D0B1"),
              btnColor: HexColor("#78D0B1"),
              txtColor: HexColor("#000000"),
              borderRadius: 20),
        )
      ],
    );
  }
}
