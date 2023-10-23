import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ubiqr/SelectingChild/Selecting.dart';
import 'package:ubiqr/login_main/login_page.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _loginState();
}

class _loginState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    raja();

  }

  raja() async{
   final harshita= await SharedPreferences.getInstance();
   final ak=harshita.getString('mobile') ?? '0';

   ak=='0'?
    Timer(
        const Duration(seconds: 5),
            () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const login()))):
    Timer(
    const Duration(seconds: 5),
    () => Navigator.pushReplacement(
    context, MaterialPageRoute(builder: (context) =>  Select())));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SizedBox(
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(height: MediaQuery.of(context).size.height*0.15,),

          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 20),
            child: Image.asset('assets/pics/logomain.png', height: 220),
          ),
          const SizedBox(height: 20),
          Container(
              alignment: Alignment.center,
              child: const Text('UBIQR',
                  style: TextStyle(fontSize: 50, color: Colors.black,fontWeight: FontWeight.bold))),
          SizedBox(height: 60),
          Center(
                child: SizedBox(
                  height: 110,
                  width: 110,
                  child: Image.asset("assets/pics/load.gif", ),
                ),
              ),

           SizedBox(
            height: 140,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text(
                    'Made in India',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 30,
                    width: 30,
                    child: Image.asset("assets/pics/heart.gif", color:Colors.red),
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    )));
  }
}
