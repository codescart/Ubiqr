import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ubiqr/SelectingChild/Selecting.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:ubiqr/Constant/base_url.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class Register_page extends StatefulWidget {
  final String? phone;
  const Register_page({Key? key,this.phone}) : super(key: key);
  @override
  State<Register_page> createState() => _Register_pageState();
}

class _Register_pageState extends State<Register_page> {


  void initState() {
    super.initState();
    mobileController.text=widget.phone!;
    // dobController.text =
    // "${selectedDate.toLocal()}".split(' ')[0];
  }

  DateTime selectedDate = DateTime.now();
  final _formkey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController localityController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();


  @override
  void dispose() {
    nameController.dispose();
    mobileController.dispose();
    dobController.dispose();
    stateController.dispose();
    stateController.dispose();
    super.dispose();
  }

  Registered(String name, String mobile, String dob,
      String locality, String city,String state) async {
    print(mobile);

    final response = await http.post(
      Uri.parse(
          Apiconst.baseurl+"register_user"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': name,
        'phone': mobile,
        'dob': dob,
        'locality': locality,
        'city': city,
        'state': state,
      }),
    );
    final data = jsonDecode(response.body);
    print(data);
    if (data['error'] == '200') {
      Fluttertoast.showToast(
        msg: 'Registered Successfully',
        backgroundColor: Colors.grey,
      );
      final prefs1 = await SharedPreferences.getInstance();
      prefs1.setString('mobile', '1234567890');

      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => Select()));
      // _launchURL();
    } else {
      Fluttertoast.showToast(
        msg: data['msg'],
        backgroundColor: Colors.grey,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              toolbarHeight: 55,
              flexibleSpace: Container(
                padding: const EdgeInsets.only(top: 5, left: 8),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                       IconButton(onPressed: (){
                         Navigator.of(context).pop();
                       }, icon: Icon(Icons.arrow_back_ios_new_rounded)),
                        Image.asset(
                          'assets/pics/textlogo.png',
                          width: 120,
                        ),
                        Image.asset(
                          'assets/pics/logomain.png',
                          height: 45,
                        ),

                      ],
                    ),
                  ],
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Container(
                  margin: const EdgeInsets.all(20),
                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      // SizedBox(height:10),
                      Image.asset('assets/pics/logomain.png', height: 150),
                      const SizedBox(height: 10),
                      const Text('REGISTRATION',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold)),

                      const SizedBox(height: 20),

                      Form(
                        key: _formkey,
                        child: Column(children: [
                          SizedBox(
                            height: 60,
                            child: TextFormField(
                              controller: nameController,
                              decoration: InputDecoration(
                                counter: const Offstage(),
                                hintText: 'Full Name',
                                filled: true,
                                fillColor: const Color(0xffFBE9E7),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            height: 60,
                            child: TextFormField(
                              controller: mobileController,
                              keyboardType: TextInputType.number,
                              maxLength: 10,
                              decoration: InputDecoration(
                                counter: const Offstage(),
                                hintText: 'Mobile Number',
                                filled: true,
                                fillColor: const Color(0xffFBE9E7),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            height: 60,
                            child:  TextFormField(
                              readOnly: true,
                              onTap: () async {
                                 await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1947),
                                    lastDate: DateTime(2101))
                                    .then((pickeddate) {
                                  if (pickeddate != null) {
                                    setState(() {
                                      selectedDate = pickeddate;
                                      dobController.text =
                                      "${selectedDate.toLocal()}".split(' ')[0];
                                    });
                                  }
                                  return null;
                                });
                              },
                              controller: dobController,
                              // keyboardType: TextInputType.number,
                              style: const TextStyle(fontSize: 14),
                              decoration: InputDecoration(
                                counter: const Offstage(),
                                hintText: 'D-O-B',
                                filled: true,
                                fillColor: const Color(0xffFBE9E7),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 10),
                          SizedBox(
                            height: 60,
                            child: TextFormField(
                              controller: localityController,
                              decoration: InputDecoration(
                                counter: const Offstage(),
                                hintText: 'Locality',
                                filled: true,
                                fillColor: const Color(0xffFBE9E7),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            height: 60,
                            child: TextFormField(
                              controller: cityController,
                              decoration: InputDecoration(
                                counter: const Offstage(),
                                hintText: 'City',
                                filled: true,
                                fillColor: const Color(0xffFBE9E7),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            height: 60,
                            child: TextFormField(
                              controller: stateController,
                              decoration: InputDecoration(
                                counter: const Offstage(),
                                hintText: 'State',
                                filled: true,
                                fillColor: const Color(0xffFBE9E7),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                        ]),
                      ),
                      const SizedBox(height: 10),

                      SizedBox(
                          height: 50,
                          width: 480,
                          child: Container(
                            decoration: const BoxDecoration(boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                offset: Offset(5.0, 5.0),
                                blurRadius: 15.0,
                                spreadRadius: 0.0,
                              ),
                            ]),
                            child: TextButton(
                                style: TextButton.styleFrom(
                                    backgroundColor: Colors.lightGreen,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                onPressed: () {
                                  if (_formkey.currentState!.validate()) {
                                    Registered(
                                      nameController.text,
                                      mobileController.text,
                                      dobController.text,
                                      localityController.text,
                                      cityController.text,
                                      stateController.text,
                                    );

                                  }
                                },
                                child: const Text('REGISTER HERE',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20))),
                          )),
                    ],
                  )),
            )));
  }
  _launchURL() async {
    const url = 'https://ubiqcure.in/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
