

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:snippet_coder_utils/hex_color.dart';
import 'package:untitled/api_service.dart';

class OTPVerify extends StatefulWidget {
  final String? mobileNo;
  final String? otpHash;

  const OTPVerify({Key? key, this.mobileNo, this.otpHash}) : super(key: key);

  @override
  State<OTPVerify> createState() => _OTPVerifyState();
}

class _OTPVerifyState extends State<OTPVerify> {
  String _otpCode="";
  final int _otpCodeLength=6;
  bool isApiCallProcess=false;
  late FocusNode myFocusNode;

  @override
  void initState(){
    super.initState();
    myFocusNode=FocusNode();
    myFocusNode.requestFocus();
    SmsAutoFill().listenForCode.call();
  }
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text("Verify OTP"),
            ),
            body: ProgressHUD(child: VerifyOtpUI(),
              inAsyncCall: isApiCallProcess,
              opacity: 3,
              key: UniqueKey(),)
        ),
    );
  }
  @override
  void dispose(){
    SmsAutoFill().unregisterListener();
    myFocusNode.dispose();
    super.dispose();
  }
  VerifyOtpUI(){ return Column(mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment:CrossAxisAlignment.center,children: [
      Image.asset("assets/images/images.png"),
          Center(
            child: (Text(
              "Verification Code",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            )),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "Please Enter the otp to send your mobile \n+91-${widget.mobileNo}",
            maxLines: 2,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          PinFieldAutoFill(
            decoration: UnderlineDecoration(
              textStyle: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
              colorBuilder: FixedColorBuilder(Colors.black.withOpacity(0.3)),
            ),
            currentCode: _otpCode,
            codeLength: _otpCodeLength,
            onCodeChanged: (code) {
              if (code!.length == _otpCodeLength) {
                _otpCode = code;
                FocusScope.of(context).requestFocus(FocusNode());
              }
            }),
        SizedBox(height: 30,),
        Center(
          child: FormHelper.submitButton("Verify", (){
            setState(() {
              isApiCallProcess=true;
            });
            APIService.verifyOtp(widget.mobileNo!, widget.otpHash!, _otpCode).then((response)async
            {
              setState(() {
                isApiCallProcess = false;
              });
              print(response.message);
              print(response.data);

              if (response.data != null) {
                FormHelper.showSimpleAlertDialog(
                  context,
                  "Shopping App",
                  response.message,
                  "Ok",
                      () {
                    Navigator.pop(context);
                  },
                );
                //     Navigator.pushAndRemoveUntil(
                //       context, MaterialPageRoute(
                //       builder:(context)=>OTPVerify(
                //         otpHash:response.data,
                //         mobileNo:mobileNo
                //       ),
                //     ),
                // (route)=>false,
              }
            }
  );

          },
              borderColor: HexColor("#78D0B1"),
              btnColor:HexColor("#78D0B1"),
              txtColor: HexColor("#000000"),
              borderRadius: 20),
        )
        ]);
  }
}
