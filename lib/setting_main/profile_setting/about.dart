import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


final Uri _url = Uri.parse('https://flutter.dev');
class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
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
              }, icon: Icon(Icons.arrow_back_ios, size: 26,
               // color: Colors.black,
              )),
              Text('About Us',style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
              Image.asset('assets/pics/logomain.png',height:45,),
            ],
          ),

        ),
      ) ,
    ));
    
    
      }
}
Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw 'Could not launch $_url';
  }
}
