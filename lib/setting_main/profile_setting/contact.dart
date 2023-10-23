import 'package:flutter/material.dart';
class Contactus extends StatefulWidget {
  const Contactus({Key? key}) : super(key: key);

  @override
  State<Contactus> createState() => _ContactusState();
}

class _ContactusState extends State<Contactus> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar:AppBar(
        backgroundColor:Colors.white,
        toolbarHeight: 55,
        flexibleSpace: Container(
          padding: EdgeInsets.only(top: 5, left: 8,right:8),
          child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(onPressed: (){
                Navigator.of(context).pop();
              }, icon: Icon(Icons.arrow_back_ios, size: 26,color: Colors.black,)),
              Text('Contact Us',style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
              Image.asset('assets/pics/logomain.png',height:45,),
            ],
          ),

        ),
      )  ,
    ));
  }
}
