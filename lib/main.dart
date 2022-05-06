import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:untitled/sample.dart';
import 'package:untitled/screens/sign_up.dart';

import 'screens/log_in.dart';
import 'screens/otp_verify.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: SignUp()
    );
  }
}
// class GlassMorphism extends StatelessWidget {
//   final Widget child;
//   final double start;
//   final double end;
//   const GlassMorphism({Key? key,required this.child,required this.start,required this.end}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ClipRect(
//       child: BackdropFilter(
//         filter: ImageFilter.blur(sigmaX: 3,sigmaY: 3),
//         child: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               colors: [
//                 Colors.white.withOpacity(start),
//                 Colors.white.withOpacity(end),
//               ],
//               begin: AlignmentDirectional.topStart,
//               end: AlignmentDirectional.bottomEnd,
//             ),
//             borderRadius: BorderRadius.all(Radius.circular(10)),
//             border: Border.all(width: 1.5,color: Colors.white.withOpacity(0.2)),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
