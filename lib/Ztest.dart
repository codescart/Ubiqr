import 'package:flutter/material.dart';

class Ztest extends StatefulWidget {
  final String type;
   Ztest({ required this.type});

  @override
  State<Ztest> createState() => _ZtestState();
}

class _ZtestState extends State<Ztest> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: const Color(0xffBA68C8),
        //   title: Image.asset(
        //     'assets/pics/textlogo.png',
        //     width: 120,
        //   ),
        //   centerTitle: true,
        // ),
        body: SingleChildScrollView(
          child: Column(
            children: [

              TextField(),

              TextField(),

              TextField(),

              TextField(),

              TextField(),


            ],
          ),
        ),
      ),
    );
  }
}
