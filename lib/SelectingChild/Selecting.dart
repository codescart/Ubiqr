import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ubiqr/Constant/base_url.dart';
import 'package:ubiqr/Constant/colors.dart';
import 'package:ubiqr/SelectingChild/paint.dart';
import 'package:ubiqr/login_main/bottom_nav_bar.dart';
import 'package:ubiqr/login_main/login_page.dart';

class Select extends StatefulWidget {
  const Select({super.key});

  @override
  State<Select> createState() => _SelectState();
}

class _SelectState extends State<Select> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
Padding(
  padding: const EdgeInsets.only(top:60.0),
  child:   Container(child:Image.asset('assets/pics/logomain.png',height:200,width:200)),
),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text('Your account is linked with these children '
              ,style: TextStyle(fontSize: 16),
              ),
            ),

          ),
         Center(
            child: Text(' And you can see their data.'
              ,style: TextStyle(fontSize: 16),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              height:MediaQuery.of(context).size.height*0.57,
              child: FutureBuilder<List<Selecct>>(
                future: Selectss(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) print(snapshot.error);
                  return snapshot.hasData
                      ? ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (BuildContext context, int index) {
                            //final prefs= await SharedPreferences.getInstance();

                            return  snapshot.data!.length ==1 ?
                              rajas(snapshot.data![0].name):
                            snapshot.data!.length ==0?
                                without()
                              :GestureDetector(
                              onTap: () async {

                                final prefs =
                                    await SharedPreferences.getInstance();
                                prefs.setString(
                                    'id', snapshot.data![index].name);
                                prefs.setInt("childcount", snapshot.data!.length);


                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            BottomNavBar()));
                              },
                              child: Column(
                                children: [
                                  //  SizedBox(
                                  //    height:20
                                  // ),


                                    Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Container(

                                        height: 150,
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey,
                                              offset: Offset(2.0, 2.0),
                                              blurRadius: 10.0,
                                              spreadRadius: 0.0,
                                            ),
                                          ],
                                          border: Border.all(
                                            width: 1.0,
                                          ),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(
                                            20.0,
                                          ) //                 <--- border radius here
                                              ),
                                          gradient: LinearGradient(
                                            colors: [
                                              Colors.white,
                                              colorA
                                            ],
                                            // begin: Alignment.bottomLeft,
                                            // end: Alignment.topRight,
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.all(20),
                                              child: Container(
                                                height: 91,
                                                width: 91,

                                                decoration: BoxDecoration(
                                                  color: Colors.black,
                                                  border: Border.all(
                                                    width: 1.0,
                                                  ),
                                                  borderRadius: const BorderRadius.all(
                                                      Radius.circular(
                                                        20.0,
                                                      )
                                                ),
                                              ),
                                         child:snapshot.data![index].images==null?Container(
                                           height: 91,
                                           width: 91,
                                           decoration: BoxDecoration(
                                               image: new DecorationImage(
                                                 image:    AssetImage('assets/pics/eye.png'),
                                                 fit: BoxFit.fill,
                                               ),
                                               color: Colors.white,
                                               border: Border.all(
                                                 width: 1.0,
                                               ),
                                               borderRadius: const BorderRadius.all(
                                                   Radius.circular(
                                                     20.0,
                                                   )
                                               ),
                                           ),

                                         )
                                               :Container(
                                           height: 140,
                                           width: 90,

                                           decoration: BoxDecoration(
                                               image: new DecorationImage(
                                                 image:    NetworkImage(
                                                   snapshot.data![index].images.toString(),),
                                                 fit: BoxFit.fill,
                                               ),
                                               color: Colors.white,
                                               border: Border.all(
                                                 width: 1.0,
                                               ),
                                               borderRadius: const BorderRadius.all(
                                                   Radius.circular(
                                                     20.0,
                                                   )
                                               ),
                                           ),

                                         ),

                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(top: 30, bottom: 30,left: 20),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                  Text(snapshot.data![index].name.toString().toUpperCase(),

                                                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                                                  ),
                                                  Row(

                                                    children: [
                                                      Text(snapshot.data![index].class_name.toString(),
                                                        style: TextStyle(fontSize:16,fontWeight: FontWeight.bold),
                                                      ),
                                                      SizedBox(width: 30,),

                                                      Text(snapshot.data![index].section.toString().toUpperCase(),
                                                        style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                                                    ],
                                                  ),
                                                  Container(
                                                    width: MediaQuery.of(context).size.width*0.45,
                                                    child: Text(snapshot.data![index].school_name.toString(),
                                                      maxLines: 2,
                                                      style: TextStyle(fontSize: 15,
                                                          fontWeight: FontWeight.bold),
                                                    ),
                                                  ),
                                                  // Text(snapshot.data![index].name.toString().toUpperCase(),),

                                                ],
                                                      ),
                                            ),
                                                  ],
                                        ),
                                      ),
                                    ),

                                ],
                              ),
                            );
                          },
                        )
                      : Center(
                          child: SizedBox(
                            height: 110,
                            width: 110,
                            child: Image.asset("assets/pics/load.gif"),
                          ),
                        );
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  rajas(String name) async{
    final prefs =
    await SharedPreferences.getInstance();
    prefs.setString(
        'id',name);

    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                BottomNavBar()));
  }

  without() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            content: Stack(

              children: <Widget>[

                Container(
                  height: 120,
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                      Text("Our team will contact you soon"),

                      SizedBox(height: 10,),
                      Container(
                        child: Center(
                          child: Container(
                            child: ButtonTheme(
                              height: 40,
                              minWidth: 80,
                              child: ElevatedButton(
                                child: Text('LOGOUT'),
                                style: ElevatedButton.styleFrom(
                                  primary: colorB,
                                  side: BorderSide(color: Colors.black45, width: 3),
                                  textStyle: const TextStyle(
                                      color: Colors.white, fontSize: 25, fontStyle: FontStyle.normal),
                                ),
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              login()));
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}

Future<List<Selecct>> Selectss() async {
  final prefs = await SharedPreferences.getInstance();
  final vals = prefs.getString('id') ?? "0";
  final mobile = prefs.getString('mobile') ?? "0";
  final response = await http.post(
    Uri.parse(
      Apiconst.baseurl+Apiconst.selecting_child),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      "mobile": mobile,
      // "year": "2022"
    }),
  );
  var jsond = json.decode(response.body)["country"];
  print(response.body);
  List<Selecct> allround = [];
  for (var o in jsond) {
    Selecct al = Selecct(
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
      o["height"],
      o["weight"],
      o["bmi"],
      o["oral_hygiene"],
      o["gen_ebuilt"],
      o["gen_enourishment"],
      o["gen_epallor"],
      o["gen_eicterus"],
      o["gen_ecyanosis"],
      o["gen_epedol"],
      o["gen_elymph"],
      o["eye_dv_rt"],
      o["eye_dv_lt"],
      o["eye_nv_rt"],
      o["eye_nv_lt"],
      o["eye_color_vision"],
      o["eye_referr_rt"],
      o["eye_referr_lt"],
      o["hearing_rt_ear"],
      o["hearing_lt_ear"],
      o["canal_rt_ear"],
      o["canal_lt_ear"],
      o["drum_rt_ear"],
      o["drum_lt_ear"],
      o["nose_dns"],
      o["nose_polyp"],
      o["nose_rhinorrhoea"],
      o["throat_tonsils"],
      o["throat_uvula"],
      o["throat_pharynx"],
      o["dental_noteeth"],
      o["dental_caries"],
      o["dental_gums"],
      o["resp_chest"],
      o["resp_rate"],
      o["resp_sound"],
      o["cvs_precordium"],
      o["cvs_heart_rate"],
      o["cvs_heart_sound"],
      o["abdomen_deformity"],
      o["abdomen_umbillicus"],
      o["blood_test_hb"],
      o["blood_test_tlc"],
      o["blood_test_dlc_p"],
      o["blood_test_dlc_l"],
      o["blood_test_dlc_m"],
      o["blood_test_dlc_e"],
      o["blood_test_dlc_b"],
      o["blood_test_sugar_f"],
      o["blood_test_sugar_pp"],
      o["blood_test_sugar_r"],
      o["kidney_test_urea"],
      o["kedney_test_creatine"],
      o["liver_test_bilirubin"],
      o["liver_test_sgot"],
      o["liver_test_sgpt"],
      o["thyroid_tsh"],
      o["thyroid_t3"],
      o["thyroid_t4"],
      o["blood_groop"],
      o["history_of_alergy"],
      o["historyof_illness"],
      o["diagnosis"],
      o["date"],
      o["year"],
      o["vaccitation"],
      o["images"],
      o["hospital_name"],
      o["doctor_name"],
      o["subject"],
      o["pdf"],
    );
    allround.add(al);
  }
  return allround;
}

class Selecct {
  String? id;
  String name;
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
  String? height;
  String? weight;
  String? bmi;
  String? oral_hygiene;
  String? gen_ebuilt;
  String? gen_enourishment;
  String? gen_epallor;
  String? gen_eicterus;
  String? gen_ecyanosis;
  String? gen_epedol;
  String? gen_elymph;
  String? eye_dv_rt;
  String? eye_dv_lt;
  String? eye_nv_rt;
  String? eye_nv_lt;
  String? eye_color_vision;
  String? eye_referr_rt;
  String? eye_referr_lt;
  String? hearing_lt_ear;
  String? hearing_rt_ear;
  String? canal_rt_ear;
  String? canal_lt_ear;
  String? drum_rt_ear;
  String? drum_lt_ear;
  String? nose_dns;
  String? nose_polyp;
  String? nose_rhinorrhoea;
  String? throat_tonsils;
  String? throat_uvula;
  String? throat_pharynx;
  String? dental_noteeth;
  String? dental_caries;
  String? dental_gums;
  String? resp_chest;
  String? resp_rate;
  String? resp_sound;
  String? cvs_precordium;
  String? cvs_heart_rate;
  String? cvs_heart_sound;
  String? abdomen_deformity;
  String? abdomen_umbillicus;
  String? blood_test_hb;
  String? blood_test_tlc;
  String? blood_test_dlc_p;
  String? blood_test_dlc_l;
  String? blood_test_dlc_m;
  String? blood_test_dlc_e;
  String? blood_test_dlc_b;
  String? blood_test_sugar_f;
  String? blood_test_sugar_pp;
  String? blood_test_sugar_r;
  String? kidney_test_urea;
  String? kedney_test_creatine;
  String? liver_test_bilirubin;
  String? liver_test_sgot;
  String? liver_test_sgpt;
  String? thyroid_tsh;
  String? thyroid_t3;
  String? thyroid_t4;
  String? blood_groop;
  String? history_of_alergy;
  String? historyof_illness;
  String? diagnosis;
  String? date;
  String? year;
  String? vaccitation;
  String? images;
  String? hospital_name;
  String? doctor_name;
  String? subject;
  String? pdf;

  Selecct(
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
    this.height,
    this.weight,
    this.bmi,
    this.oral_hygiene,
    this.gen_ebuilt,
    this.gen_enourishment,
    this.gen_epallor,
    this.gen_eicterus,
    this.gen_ecyanosis,
    this.gen_epedol,
    this.gen_elymph,
    this.eye_dv_rt,
    this.eye_dv_lt,
    this.eye_nv_rt,
    this.eye_nv_lt,
    this.eye_color_vision,
    this.eye_referr_rt,
    this.eye_referr_lt,
    this.hearing_rt_ear,
    this.hearing_lt_ear,
    this.canal_rt_ear,
    this.canal_lt_ear,
    this.drum_rt_ear,
    this.drum_lt_ear,
    this.nose_dns,
    this.nose_polyp,
    this.nose_rhinorrhoea,
    this.throat_tonsils,
    this.throat_uvula,
    this.throat_pharynx,
    this.dental_noteeth,
    this.dental_caries,
    this.dental_gums,
    this.resp_chest,
    this.resp_rate,
    this.resp_sound,
    this.cvs_precordium,
    this.cvs_heart_rate,
    this.cvs_heart_sound,
    this.abdomen_deformity,
    this.abdomen_umbillicus,
    this.blood_test_hb,
    this.blood_test_tlc,
    this.blood_test_dlc_p,
    this.blood_test_dlc_l,
    this.blood_test_dlc_m,
    this.blood_test_dlc_e,
    this.blood_test_dlc_b,
    this.blood_test_sugar_f,
    this.blood_test_sugar_pp,
    this.blood_test_sugar_r,
    this.kidney_test_urea,
    this.kedney_test_creatine,
    this.liver_test_bilirubin,
    this.liver_test_sgot,
    this.liver_test_sgpt,
    this.thyroid_tsh,
    this.thyroid_t3,
    this.thyroid_t4,
    this.blood_groop,
    this.history_of_alergy,
    this.historyof_illness,
    this.diagnosis,
    this.date,
    this.year,
    this.vaccitation,
    this.images,
    this.hospital_name,
    this.doctor_name,
    this.subject,
    this.pdf,
  );
}
