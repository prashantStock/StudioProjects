import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Sample extends StatelessWidget {
  final myList=List<int>.generate(100, (i) => i);
  Sample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 260,
      color: Colors.blueGrey,
      alignment: Alignment.center,
      transform: Matrix4.rotationY(-0.25),
      child: Text("Containers",style: TextStyle(color: Colors.white,fontSize: 25),),
    );
  }
}
