import 'package:flutter/material.dart';
class Problem extends StatefulWidget {
  const Problem({Key? key}) : super(key: key);

  @override
  State<Problem> createState() => _ProblemState();
}

class _ProblemState extends State<Problem> {
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
              Text('Report A Porblem',style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
              Image.asset('assets/pics/logomain.png',height:45,),
            ],
          ),

        ),
      )  ,
    ));
  }
}
