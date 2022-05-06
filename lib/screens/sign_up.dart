import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class SignUp extends StatefulWidget {
  // final String? mobileNo;
  // final String?
  SignUp({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();

  void signup(String name, email, password, phone) async {
    try {
      Response response = await post(
          Uri.parse('http://18.209.12.144/auth/api/v1/auth/register'),
          body: {
            'name': name,
            'email': email,
            'password': password,
            'phone': phone,
          });
      if (response.statusCode == 201) {
        var data = jsonDecode(response.body.toString());
        print(data["token"]);
        print("Account created successful");
      } else {
        print('failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: [
              const Text(
                "SignUp",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Icon(
                      Icons.facebook,
                      size: 60,
                    ),
                    Icon(
                      Icons.apple,
                      size: 60,
                    ),
                    Icon(
                      Icons.phone,
                      size: 60,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                  child: Text(
                "Or,register with email..",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
              )),
              SizedBox(
                height: 15,
              ),
              Text(
                "Name",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.verified_user),
                    labelText: "Enter Name"),
              ),
              Text(
                "Email",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.email),
                    labelText: "Enter Email ID"),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Password",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.password),
                  labelText: "Enter Password",
                ),
              ),
              Text(
                "Phone",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: phoneController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.phone_bluetooth_speaker_outlined),
                    labelText: "Enter Phone"),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 50,
                child: ElevatedButton(
                  child: Text("Submit"),
                  onPressed: () {
                    signup(
                        nameController.toString(),
                        emailController.toString(),
                        passwordController.toString(),
                        phoneController.toString());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
