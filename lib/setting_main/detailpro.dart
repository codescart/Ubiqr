import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ubiqr/Constant/base_url.dart';
import 'package:ubiqr/Constant/colors.dart';
import 'package:http/http.dart' as http;

class Data_Fulls extends StatefulWidget {
  const Data_Fulls({Key? key}) : super(key: key);

  @override
  State<Data_Fulls> createState() => _Data_FullState();
}

class _Data_FullState extends State<Data_Fulls> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(

          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 12.0,top:8,bottom:5),
              child: Image.asset(
                'assets/pics/logomain.png',
                height: 45,
              ),
            ),
          ],
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.purple.shade100,
          title: const Text(
            "Profile",
            style: TextStyle(color: Colors.black),
          ),
        ),

        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                child: FutureBuilder<List<Profile>>(
                  future: Profil(),
                  builder: (context, snapshot) {
                    return snapshot.hasData
                        ? ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: ((context, index) {
                              return SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top:10,left:15,right:15,bottom:10),
                                      child: Container(

                                        padding: EdgeInsets.only(top:10,bottom:10),
                                        decoration: BoxDecoration(

                                          borderRadius: BorderRadius.only(
                                            //bottomLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(20),
                                            //topRight: Radius.circular(20),
                                            topLeft: Radius.circular(20),

                                          ),
                                          //color: appb,
                                          gradient: LinearGradient(
                                            colors: [appb, colorC],
                                            begin: Alignment.bottomLeft,
                                            end: Alignment.topRight,
                                          ),
                                        ),



                                        alignment: Alignment.center,
                                        height:50,
                                        width: MediaQuery.of(context).size.width,
                                        child: Container(
                                          padding: EdgeInsets.only(left: 10),
                                          width: MediaQuery.of(context).size.width*0.90,
                                          child: Text(
                                            '${snapshot.data![index].school_name}',
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                            ),
                                            maxLines: 1,
                                          ),
                                        ),
                                      ),
                                    ),

                                    SizedBox(
                                      height: 30,
                                    ),
                                    SizedBox(
                                      height: 130,
                                      width: 130,
                                      child: CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            "${snapshot.data![index].images}"),
                                        backgroundColor: Colors.blue,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 70,
                                    ),


                                    Container(
                                        height:MediaQuery.of(context).size.height*0.593,
                                        decoration: BoxDecoration(borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(90),
                                          topRight: Radius.circular(90),),
                                          color:Colors.purple.shade100,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black,
                                              offset: Offset(5.0, 5.0),
                                              blurRadius: 15.0,
                                              spreadRadius: 0.0,
                                            ),
                                          ],
                                        ),
                                        alignment: Alignment.bottomCenter,
                                        child:Column(
                                            children: [
                                          SizedBox(height:60),
                                          Container(
                                            padding: EdgeInsets.only(left:30),
                                            child: Row(
                                             // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:CrossAxisAlignment.start,

                                                  children: [
                                                  Icon(Icons.account_circle,size:25),
                                                  SizedBox(height:8),
                                                  Icon(Icons.man_sharp,size:25,),
                                                    SizedBox(height:8),

                                                    Icon(Icons.phone,size:25),
                                                    SizedBox(height:8),

                                                    Icon(Icons.school,size:25),
                                                    SizedBox(height:8),

                                                    Icon(Icons.note_alt_rounded,size:25),
                                                    SizedBox(height:8),

                                                    Icon(Icons.location_city_outlined,size:25),
                                                    SizedBox(height:8),

                                                    Icon(Icons.location_city,size:25),
                                                    SizedBox(height:8),

                                                    Icon(Icons.ev_station_outlined,size:25),

                                                ],),
                                              SizedBox(width:13),
                                                Column(
                                                  crossAxisAlignment:CrossAxisAlignment.start,
                                                  children: [
                                                  Text('Name:  ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                                    SizedBox(height:15),

                                                    Text('Father Name:  ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                                    SizedBox(height:15),

                                                    Text('Mobile:  ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                                    SizedBox(height:15),

                                                    Text('Class:  ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),

                                                    SizedBox(height:15),

                                                    Text('Section:  ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),

                                                    SizedBox(height:15),

                                                    Text('Locality:  ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),

                                                    SizedBox(height:15),

                                                    Text('City:  ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                                    SizedBox(height:15),

                                                    Text('State:  ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),

                                                  ],),
                                                SizedBox(width:10),

                                                Column(
                                                  crossAxisAlignment:CrossAxisAlignment.start,

                                                  children: [
                                                  Text(
                                                    '${snapshot.data![index].name}',
                                                    style: const TextStyle(
                                                    fontSize: 14

                                                    ),
                                                  ),
                                                    SizedBox(height: 20),

                                                    Text(
                                                      '${snapshot.data![index].fname}',
                                                      style: const TextStyle(
                                                          fontSize: 14

                                                      ),
                                                    ),
                                                    SizedBox(height: 20),

                                                    Text(
                                                      '${snapshot.data![index].phone}',
                                                      style: const TextStyle(
                                                          fontSize: 14
                                                      ),
                                                    ),
                                                    SizedBox(height: 25),

                                                    Text(
                                                      '${snapshot.data![index].class_name}',
                                                      style: const TextStyle(
                                                          fontSize: 14
                                                      ),
                                                    ),
                                                    SizedBox(height: 15,),

                                                    Text(
                                                      '${snapshot.data![index].section}',
                                                      style: const TextStyle(
                                                          fontSize: 14
                                                      ),
                                                    ),
                                                    SizedBox(height: 15,),

                                                    Text(
                                                      '${snapshot.data![index].locality}',
                                                      style: const TextStyle(
                                                          fontSize: 14
                                                      ),
                                                    ),
                                                    SizedBox(height: 15,),

                                                    Text(
                                                      '${snapshot.data![index].city}',
                                                      style: const TextStyle(
                                                          fontSize: 14
                                                      ),
                                                    ),
                                                    SizedBox(height: 15,),
                                                    Text(
                                                      '${snapshot.data![index].state}',
                                                      style: const TextStyle(
                                                          fontSize: 14
                                                      ),
                                                    ),
                                                ],),

                                              ],
                                            ),
                                          ),

                                        ]
                                        )
                                    ),
                                  ],
                                ),
                              );
                            }),
                          )
                        : Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 220.0),
                              child: Column(
                                children: [

                                  SizedBox(
                                    height: 110,
                                    width: 110,
                                    child: Image.asset("assets/pics/load.gif"),
                                  ),
                                  Text('Your profile is empty')
                                ],
                              ),
                            ),
                          );
                  },
                ),
              )
            ],
          ),
        ),

      ),
    );
  }

  Future<List<Profile>> Profil() async {
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
    var jsond = json.decode(response.body)["country"];
    print(response.body);
    List<Profile> allround = [];
    for (var o in jsond) {
      Profile al = Profile(
        o["id"],
        o["name"],
        o["fname"],
        o["school_name"],
        o["dob"],
        o["age"],
        o["class_name"],
        o["section"],
        o["email"],
        o["phone"],
        o["gender"],
        o["locality"],
        o["city"],
        o["state"],
        o["images"],
      );
      allround.add(al);
    }
    return allround;
  }
}

class Profile {
  String? id;
  String? name;
  String? fname;
  String? school_name;
  String? dob;
  String? age;
  String? class_name;
  String? section;
  String? email;
  String? phone;
  String? gender;
  String? locality;
  String? city;
  String? state;
  String? images;

  Profile(
    this.id,
    this.name,
    this.fname,
    this.school_name,
    this.dob,
    this.age,
    this.class_name,
    this.section,
    this.email,
    this.phone,
    this.gender,
    this.locality,
    this.city,
    this.state,
    this.images,
  );
}
