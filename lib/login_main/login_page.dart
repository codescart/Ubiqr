
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ubiqr/Constant/base_url.dart';
import 'package:ubiqr/Constant/colors.dart';
import 'package:ubiqr/login_main/bottom_nav_bar.dart';
import 'package:ubiqr/login_main/register_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'otpverify.dart';



class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final _formkey=GlobalKey<FormState>();
  bool _loading = false;
  TextEditingController mobileController = TextEditingController();


  login(String mobile) async {
    setState(() {
      _loading = true;
    });
   final response = await http.post(
     Uri.parse(Apiconst.baseurl+Apiconst.login),

     headers: <String, String>{
       'Content-Type': 'application/json; charset=UTF-8',
     },
     body: jsonEncode(<String, String>{
       'mobile' : mobile,
     }),
   );
   final data = jsonDecode(response.body);

   print(data);
   if(data['error']== '200'){
     setState(() {
       _loading = false;
     });
     // print(data);
     // print('Login successfully');
     Navigator.of(context).pushReplacement(
         MaterialPageRoute(
           builder:(context)=>OTPScreens(
             phone: mobileController.text,
           ),
         )
     );
   }else {
     setState(() {
       _loading = false;
     });
     Fluttertoast.showToast(
       msg: 'Please Register',
       backgroundColor: Colors.grey,
     );
     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> Register_page(phone: mobileController.text)));
   }
  }

  @override
  void dispose() {
    mobileController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        SystemNavigator.pop();
        return true;
      },
      child: SafeArea(
          child: Scaffold(
            body:Container(
            color:const Color(0xffFBE9E7),
            height:MediaQuery.of(context).size.height,
            width:MediaQuery.of(context).size.width,
            child:SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.all(30),
                child: Column(
                  children: [
                    SizedBox(height:MediaQuery.of(context).size.height*0.05),
                    Image.asset('assets/pics/logomain.png',height:150),
                    SizedBox(height:MediaQuery.of(context).size.height*0.16),
                    // SizedBox(height:40),
                    Container(
                        alignment: Alignment.topLeft,
                        child: const Text('Enter Mobile No',
                            style:TextStyle(fontSize:15,fontWeight: FontWeight.bold))),
                    const SizedBox(height:12),
                    SizedBox(
                      height:60,
                      child: Container(
                        decoration: const BoxDecoration(
                            boxShadow: [BoxShadow(
                                color: Colors.grey,
                                blurRadius: 14.0,
                                spreadRadius: 0.0
                            ),]
                        ),
                        child: Form(
                          key: _formkey,
                          child: TextFormField(
                            controller: mobileController,
                            keyboardType: TextInputType.number,
                            maxLength: 10,
                            decoration: InputDecoration(
                              counter: const Offstage(),
                              //contentPadding: EdgeInsets.all(20),
                              // labelText: 'Mobile Number',
                              hintText: 'Mobile Number',
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Image.asset(
                                  'assets/pics/ff.png',
                                  width: 20,
                                  height: 20,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              filled:true,
                              fillColor:Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:BorderSide.none,
                              ),
                            ),

                        // validator: (value){if(value!.isEmpty ||!RegExp().hasMatch(input))},
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height:30),
                    SizedBox(
                        height:50,
                        width:480,
                        child:Container(
                          decoration: const BoxDecoration(
                              boxShadow: [BoxShadow(
                                color: Colors.black,
                                offset: Offset(5.0, 5.0),
                                blurRadius: 15.0,
                                spreadRadius: 0.0,

                              ),]
                          ),
                          child: TextButton(
                              onPressed: (){
                                if (_formkey.currentState!.validate()) {
                                  login(
                                    mobileController.text,
                                  );
                                }
                              },
                              style: TextButton.styleFrom(backgroundColor:appb,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                               child:const Text('SUBMIT',style:TextStyle(color:Colors.white,fontSize:20))),
                        )
                    ),
                    const SizedBox(height:80),
                    SizedBox(height: 20,),
                    Text(
                      'To Contact with?',
                        style:TextStyle(fontSize:15,fontWeight: FontWeight.bold)
                    ),
                    SizedBox(height: 30,),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: (){
                              _launchCaller();
                            },
                            child: Container(
                              height: 50,width: 50,
                              // color: Colors.orange,
                              decoration: BoxDecoration(

                                border: Border.all(
                                  color: colorA,
                                  width: 8,
                                ), //Border.all

                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black,
                                    offset: const Offset(
                                      5.0,
                                      5.0,
                                    ), //Offset
                                    blurRadius: 5.0,
                                    spreadRadius: 2.0,
                                  ), //BoxShadow
                                  BoxShadow(
                                    color: Colors.white,
                                    offset: const Offset(0.0, 0.0),
                                    blurRadius: 0.0,
                                    spreadRadius: 0.0,
                                  ), //BoxShadow
                                ],
                              ),
                              child: Image.asset('assets/pics/phone.gif',
                                height: 20,width: 20,),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              _launchEmail();
                            },
                            child: Container(
                              height: 50,width: 50,
                              // color: Colors.orange,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: colorA,
                                  width: 8,
                                ), //Border.all
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black,
                                    offset: const Offset(
                                      5.0,
                                      5.0,
                                    ), //Offset
                                    blurRadius: 5.0,
                                    spreadRadius: 2.0,
                                  ), //BoxShadow
                                  BoxShadow(
                                    color: Colors.white,
                                    offset: const Offset(0.0, 0.0),
                                    blurRadius: 0.0,
                                    spreadRadius: 0.0,
                                  ), //BoxShadow
                                ],
                              ),
                              child: Image.asset('assets/pics/mail.gif',
                                height: 20,width: 20,),
                            ),
                          ),
                          InkWell(
                            onTap: (){


                              openwhatsapp();
                            },
                            child: Container(
                              height: 50,width: 50,
                              // color: Colors.orange,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: colorA,
                                  width: 8,
                                ), //Border.all
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black,
                                    offset: const Offset(
                                      5.0,
                                      5.0,
                                    ), //Offset
                                    blurRadius: 5.0,
                                    spreadRadius: 2.0,
                                  ), //BoxShadow
                                  BoxShadow(
                                    color: Colors.white,
                                    offset: const Offset(0.0, 0.0),
                                    blurRadius: 0.0,
                                    spreadRadius: 0.0,
                                  ), //BoxShadow
                                ],
                              ),
                              child: Image.asset('assets/pics/whatsapp.gif',
                                height: 20,width: 20,),
                            ),
                          ),
                        ] ),
                    SizedBox(height: 30,),

                  ],
                ),
              ),
            )
        ),
      )),
    ); 
  }
  openwhatsapp() async{
    var whatsapp ="+9151033905";
    var whatsappURl_android = "whatsapp://send?phone="+whatsapp+"&text=hello";
    var whatappURL_ios ="https://wa.me/$whatsapp?text=${Uri.parse("hello")}";

    if( await canLaunch(whatsappURl_android)){
      await launch(whatsappURl_android);
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: new Text("whatsapp not installed")));

    }


  }
  _launchCaller() async {
    const url = "tel:9151033905";
    if (await canLaunch(url)) {
      await launch(url);
    } else    {
      throw 'Could not launch $url';
    }
  }

  String email="info@ubiqcure.in";
  _launchEmail() async {
    if (await canLaunch("mailto:$email")) {
      await launch("mailto:$email");
    } else {
      throw 'Could not launch';
    }
  }
}




