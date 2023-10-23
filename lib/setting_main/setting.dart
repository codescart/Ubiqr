import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ubiqr/Constant/base_url.dart';
import 'package:ubiqr/SelectingChild/Selecting.dart';
import 'package:ubiqr/setting_main/detailpro.dart';
import 'package:ubiqr/login_main/login_page.dart';
import 'package:ubiqr/setting_main/profile_setting/policy.dart';
import 'package:ubiqr/setting_main/profile_setting/report.dart';
import 'package:ubiqr/setting_main/profile_setting/terms_conditions.dart';

import 'package:url_launcher/url_launcher.dart';

import '../Constant/colors.dart';


class Setting extends StatefulWidget {
  const Setting({
    Key? key,
  }) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  void initState() {
    Profil();
    // TODO: implement initState
    super.initState();
  }

  var map;

  Profil() async {
    final prefs = await SharedPreferences.getInstance();
    final vals = prefs.getString('id') ?? "0";
    final mobile = prefs.getString('mobile') ?? "0";
    print(vals);
    final response = await http.post(
      Uri.parse(
          Apiconst.baseurl+"getprofile"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "name": vals,
        "mobile": mobile,
        // "year": ids ?? '0',
      }),
    );
    var jsond = json.decode(response.body);
    setState(() {
      map = jsond["country"];
    });
    print('dddddddddddddddd');
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
                        Image.asset(
                          'assets/pics/logomain.png',
                          height: 45,
                        ),
                        Image.asset(
                          'assets/pics/textlogo.png',
                          width: 120,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.notifications,
                              size: 30,
                              color: Colors.black,
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            ),
            body: SingleChildScrollView(
                child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                          top: 5, left: 5, right: 5, bottom: 5),
                      // height:150,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        color: colorB,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(50),
                          bottomLeft: Radius.circular(50),
                        ),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          map == null?Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                              image: new DecorationImage(
                                image:    AssetImage('assets/pics/eye.png'),
                                fit: BoxFit.fill,
                              ),
                              color: Colors.white,

                              borderRadius: const BorderRadius.all(
                                  Radius.circular(
                                    100.0,
                                  )
                              ),
                            ),

                          )
                              :Container(
                            height: 70,
                            width: 70,

                            decoration: BoxDecoration(
                              image: new DecorationImage(
                                image:    NetworkImage(
                                    map[0]['images'].toString(),),
                                fit: BoxFit.fill,
                              ),
                              color: Colors.white,

                              borderRadius: const BorderRadius.all(
                                  Radius.circular(
                                    100.0,
                                  )
                              ),
                            ),

                          ),

                          Container(
                            padding: const EdgeInsets.only(left: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  map == null
                                      ? 'Your Name'
                                      : map[0]['name'].toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  map == null
                                      ? 'Your Name'
                                      : map[0]['class_name'].toString()+"-"+ map[0]['section'].toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),

                                Container(
                                  width: MediaQuery.of(context).size.width*0.66,
                                  child: Text(
                                    map == null
                                        ? 'Your Name'
                                        : map[0]['school_name'].toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                    ),
                                    maxLines: 2,
                                  ),
                                ),

                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                SizedBox(
                  height: 60,
                  width: 300,
                  child: Container(
                    decoration: const BoxDecoration(),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: appb,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            20,
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const Data_Fulls(),
                          ),
                        );
                      },
                      child: const Text(
                        'Detailed Profile',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const Problem(),
                      ),
                    );
                  },
                  child: InkWell(
                    onTap: (){Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Select()));},
                    child: Container(
                      margin: const EdgeInsets.only(
                        top: 10,
                        left: 20,
                        right: 20,
                      ),
                      padding: const EdgeInsets.only(
                        left: 25,
                        right: 25,
                      ),
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: colorA,
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Change Your Children',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2),
                            child: Image.asset('assets/pics/report.png'),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    _ContactUs();
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: colorA, borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Contact US',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold)),
                        Padding(
                          padding: const EdgeInsets.all(6),
                          child: Image.asset('assets/pics/cont.png'),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: ()  {
                    _AboutUs();
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: colorA, borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('About US',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold)),
                        Padding(
                          padding: const EdgeInsets.all(6),
                          child: Image.asset('assets/pics/pincode.png'),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const TermCondition()));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: colorA, borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Privacy policy',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold)),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Image.asset('assets/pics/privacy.png',
                              color: const Color(0xffBA68C8)),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Privacy()));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: colorA, borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Terms & Conditions',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold)),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Image.asset('assets/pics/term.png',
                              color: const Color(0xffBA68C8)),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                    height: 50,
                    width: 480,
                    child: Container(
                      margin: const EdgeInsets.only(left: 20, right: 20),
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
                              backgroundColor: const Color(0xffBA68C8),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          onPressed: ()async {
                            final prefs1 = await SharedPreferences.getInstance();
                            final key1 = 'mobile';
                            final mobile = '0';
                            prefs1.setString(key1, mobile);
                            prefs1.setString('id', '0');
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const login(),
                            ));
                          },
                          child: const Text('LOGOUT',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20))),
                    )),
                const SizedBox(height: 40),
              ],
            ))));
  }
}


_ContactUs() async {
  const url = 'https://ubiqcure.in/contact-us.php';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_AboutUs() async {
  const url = 'https://ubiqcure.in/about-us.php';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}