import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movie_stream/screens/home_screen.dart';
import 'package:movie_stream/widgets/movies_section.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    var heights = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: heights * .25,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/wave.png"),
                )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hola, \nWelcome",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    customSizedBox(),
                    customSizedBox(),
                    TextField(
                      decoration: _customInputDecoration("Username"),
                    ),
                    customSizedBox(),
                    customSizedBox(),
                    TextField(
                      decoration: _customInputDecoration("Password"),
                    ),
                    customSizedBox(),
                    Center(
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Forgot password?",
                          style: TextStyle(
                              color: Colors.red.shade100,
                              fontStyle: FontStyle.italic,
                              fontSize: 14),
                        ),
                      ),
                    ),
                    customSizedBox(),
                    Center(
                      child: TextButton(
                        onPressed: () {},
                        child: Container(
                          height: 50,
                          width: 150,
                          margin: EdgeInsets.symmetric(horizontal: 60),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.purple.shade200,
                          ),
                          child: Center(
                            child: TextButton(
                              onPressed: () {},
                              // onPressed: () {
                              //   Navigator.push(
                              //       context,
                              //       MaterialPageRoute(
                              //         builder: (context) => MoviesSection(),
                              //       ));
                              // },
                              child: Text(
                                "Login in",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontStyle: FontStyle.italic),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    customSizedBox(),
                    Center(
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Create an account",
                          style: TextStyle(
                            color: Colors.red.shade100,
                            fontStyle: FontStyle.italic,
                            decoration: TextDecoration.underline,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget customSizedBox() => SizedBox(
        height: 20,
      );

  InputDecoration _customInputDecoration(String hintText) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey,
        ),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey,
        ),
      ),
    );
  }
}
