import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../Constant/colors.dart';

class Detailed_Medical extends StatefulWidget {
  final String? id;
  final String? name;
  final String? fname;
  final String? school_name;
  final String? dob;
  final String? age;
  final String? class_name;
  final String? section;
  final String? email;
  final String? phone;
  final String? gender;
  final String? locality;
  final String? city;
  final String? state;
  final String? height;
  final String? weight;
  final String? bmi;
  final String? oral_hygiene;
  final String? gen_ebuilt;
  final String? gen_enourishment;
  final String? gen_epallor;
  final String? gen_eicterus;
  final String? gen_ecyanosis;
  final String? gen_epedol;
  final String? gen_elymph;
  final String? eye_dv_rt;
  final String? eye_dv_lt;
  final String? eye_nv_rt;
  final String? eye_nv_lt;
  final String? eye_color_vision;
  final String? eye_referr_rt;
  final String? eye_referr_lt;
  final String? hearing_lt_ear;
  final String? hearing_rt_ear;
  final String? canal_rt_ear;
  final String? canal_lt_ear;
  final String? drum_rt_ear;
  final String? drum_lt_ear;
  final String? nose_dns;
  final String? nose_polyp;
  final String? nose_rhinorrhoea;
  final String? throat_tonsils;
  final String? throat_uvula;
  final String? throat_pharynx;
  final String? dental_noteeth;
  final String? dental_caries;
  final String? dental_gums;
  final String? resp_chest;
  final String? resp_rate;
  final String? resp_sound;
  final String? cvs_precordium;
  final String? cvs_heart_rate;
  final String? cvs_heart_sound;
  final String? abdomen_deformity;
  final String? abdomen_umbillicus;
  final String? blood_test_hb;
  final String? blood_test_tlc;
  final String? blood_test_dlc_p;
  final String? blood_test_dlc_l;
  final String? blood_test_dlc_m;
  final String? blood_test_dlc_e;
  final String? blood_test_dlc_b;
  final String? blood_test_sugar_f;
  final String? blood_test_sugar_pp;
  final String? blood_test_sugar_r;
  final String? kidney_test_urea;
  final String? kedney_test_creatine;
  final String? liver_test_bilirubin;
  final String? liver_test_sgot;
  final String? liver_test_sgpt;
  final String? thyroid_tsh;
  final String? thyroid_t3;
  final String? thyroid_t4;
  final String? blood_groop;
  final String? history_of_alergy;
  final String? historyof_illness;
  final String? diagnosis;
  final String? year;
  final String? vaccitation;
  final String? images;
  final String? refer;

  const Detailed_Medical({
    required this.id,
    required this.name,
    required this.fname,
    required this.school_name,
    required this.dob,
    required this.age,
    required this.class_name,
    required this.section,
    required this.email,
    required this.phone,
    required this.gender,
    required this.locality,
    required this.city,
    required this.state,
    required this.height,
    required this.weight,
    required this.bmi,
    required this.oral_hygiene,
    required this.gen_ebuilt,
    required this.gen_enourishment,
    required this.gen_epallor,
    required this.gen_eicterus,
    required this.gen_ecyanosis,
    required this.gen_epedol,
    required this.gen_elymph,
    required this.eye_dv_rt,
    required this.eye_dv_lt,
    required this.eye_nv_rt,
    required this.eye_nv_lt,
    required this.eye_color_vision,
    required this.eye_referr_rt,
    required this.eye_referr_lt,
    required this.hearing_rt_ear,
    required this.hearing_lt_ear,
    required this.canal_rt_ear,
    required this.canal_lt_ear,
    required this.drum_rt_ear,
    required this.drum_lt_ear,
    required this.nose_dns,
    required this.nose_polyp,
    required this.nose_rhinorrhoea,
    required this.throat_tonsils,
    required this.throat_uvula,
    required this.throat_pharynx,
    required this.dental_noteeth,
    required this.dental_caries,
    required this.dental_gums,
    required this.resp_chest,
    required this.resp_rate,
    required this.resp_sound,
    required this.cvs_precordium,
    required this.cvs_heart_rate,
    required this.cvs_heart_sound,
    required this.abdomen_deformity,
    required this.abdomen_umbillicus,
    required this.blood_test_hb,
    required this.blood_test_tlc,
    required this.blood_test_dlc_p,
    required this.blood_test_dlc_l,
    required this.blood_test_dlc_m,
    required this.blood_test_dlc_e,
    required this.blood_test_dlc_b,
    required this.blood_test_sugar_f,
    required this.blood_test_sugar_pp,
    required this.blood_test_sugar_r,
    required this.kidney_test_urea,
    required this.kedney_test_creatine,
    required this.liver_test_bilirubin,
    required this.liver_test_sgot,
    required this.liver_test_sgpt,
    required this.thyroid_tsh,
    required this.thyroid_t3,
    required this.thyroid_t4,
    required this.blood_groop,
    required this.history_of_alergy,
    required this.historyof_illness,
    required this.diagnosis,
    required this.year,
    required this.vaccitation,
    required this.images,
    required this.refer,
  });

  @override
  State<Detailed_Medical> createState() => _Detailed_Medicaltate();
}

class _Detailed_Medicaltate extends State<Detailed_Medical> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0, top: 8, bottom: 8),
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
          backgroundColor: Colors.white,
          title: const Text(
            "Detailed Medical Report",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: ListView(
          // scrollDirection: Axis.vertical,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              const SizedBox(
                height: 15,
              ),
              widget.images == null
                  ? Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            offset: const Offset(
                              1.0,
                              1.0,
                            ), //Offset
                            blurRadius: 2.0,
                            spreadRadius: 1.0,
                          ), //BoxShadow
                          BoxShadow(
                            color: Colors.white,
                            offset: const Offset(0.0, 0.0),
                            blurRadius: 0.0,
                            spreadRadius: 0.0,
                          ), //BoxShadow
                        ],
                        image: new DecorationImage(
                          image: AssetImage('assets/pics/eye.png'),
                          fit: BoxFit.fill,
                        ),
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(Radius.circular(
                          100.0,
                        )),
                      ),
                    )
                  : Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            offset: const Offset(
                              1.0,
                              1.0,
                            ), //Offset
                            blurRadius: 2.0,
                            spreadRadius: 1.0,
                          ), //BoxShadow
                          BoxShadow(
                            color: Colors.white,
                            offset: const Offset(0.0, 0.0),
                            blurRadius: 0.0,
                            spreadRadius: 0.0,
                          ), //BoxShadow
                        ],
                        image: new DecorationImage(
                          image: NetworkImage(widget.images.toString()),
                          fit: BoxFit.fill,
                        ),
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(Radius.circular(
                          100.0,
                        )),
                      ),
                    ),
              SizedBox(height: 20),
              Container(
                  padding: EdgeInsets.only(left: 0),
                  child: Column(
                    children: [
                      Container(
                          height: 45,
                          width: double.infinity,
                          padding: EdgeInsets.only(left: 0),
                          alignment: Alignment.centerLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // crossAxisAlignment:CrossAxisAlignment.start ,
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(20)),
                                      color: appb,
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xffb429f9),
                                          colorA,
                                        ],
                                        begin: Alignment.bottomLeft,
                                        end: Alignment.topRight,
                                      ),
                                    ),
                                    height: 40,
                                    width: 250,
                                    child: Text('Personal Details: ',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold))),
                              ),
                              const SizedBox(width: 15),
                              // const Icon(Icons.person),
                              Image.asset('assets/pics/acc.gif',
                                  color: Colors.purple),

                              const SizedBox(width: 15),
                            ],
                          )),
                      const SizedBox(height: 5),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              offset: const Offset(
                                1.0,
                                1.0,
                              ), //Offset
                              blurRadius: 2.0,
                              spreadRadius: 1.0,
                            ), //BoxShadow
                            BoxShadow(
                              color: Colors.white,
                              offset: const Offset(0.0, 0.0),
                              blurRadius: 0.0,
                              spreadRadius: 0.0,
                            ), //BoxShadow
                          ],
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(20),
                          ),
                          color: appb,
                          gradient: LinearGradient(
                            colors: [Colors.white24, colorA],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                          ),
                        ),
                        margin: EdgeInsets.all(20),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.account_circle_rounded,
                                  color: Colors.black45,
                                ),
                                SizedBox(height: 5),
                                Icon(
                                  Icons.man,
                                  color: Colors.black45,
                                ),
                                SizedBox(height: 5),
                                Icon(
                                  Icons.school,
                                  color: Colors.black45,
                                ),
                                SizedBox(height: 5),
                                Icon(
                                  Icons.note_alt_sharp,
                                  color: Colors.black45,
                                ),
                              ],
                            ),
                            SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Name: ',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(height: 5),
                                Text('Father Name: ',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(height: 5),
                                Text('Class: ',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(height: 5),
                                Text('Section: ',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(widget.name.toString(),
                                    style: const TextStyle(
                                        fontSize: 17, color: Colors.red)),
                                SizedBox(height: 5),
                                Text(widget.fname.toString(),
                                    style: const TextStyle(
                                        fontSize: 17, color: Colors.red)),
                                SizedBox(height: 5),
                                Text(widget.class_name.toString(),
                                    style: const TextStyle(
                                        fontSize: 17, color: Colors.red)),
                                SizedBox(height: 5),
                                Text(widget.section.toString(),
                                    style: const TextStyle(
                                        fontSize: 17, color: Colors.red)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                      Container(
                          height: 45,
                          width: double.infinity,
                          padding: const EdgeInsets.only(left: 0, right: 20),
                          alignment: Alignment.centerLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //const Icon(Icons.medical_services_rounded),

                              Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                    alignment: Alignment.center,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(20)),
                                      color: appb,
                                      gradient: LinearGradient(
                                        colors: [appb, colorA],
                                        begin: Alignment.bottomLeft,
                                        end: Alignment.topRight,
                                      ),
                                    ),
                                    height: 40,
                                    width: 250,
                                    child: const Text('Medical Details ',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold))),
                              ),
                              const SizedBox(width: 15),
                              Image.asset('assets/pics/med.gif'),
                            ],
                          )),
                      const SizedBox(height: 5),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              offset: const Offset(
                                1.0,
                                1.0,
                              ), //Offset
                              blurRadius: 2.0,
                              spreadRadius: 1.0,
                            ), //BoxShadow
                            BoxShadow(
                              color: Colors.white,
                              offset: const Offset(0.0, 0.0),
                              blurRadius: 0.0,
                              spreadRadius: 0.0,
                            ), //BoxShadow
                          ],
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(20),
                          ),
                          color: appb,
                          gradient: LinearGradient(
                            colors: [Colors.white24, colorA],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                          ),
                        ),
                        margin: EdgeInsets.all(20),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //  SizedBox(height:8),

                                Icon(Icons.height,
                                    size: 20, color: Colors.black45),
                                SizedBox(height: 5),
                                Icon(Icons.monitor_weight_outlined,
                                    size: 20, color: Colors.black45),
                                SizedBox(height: 5),
                                Icon(
                                  Icons.remove_red_eye,
                                  size: 20,
                                  color: Colors.black45,
                                ),
                                SizedBox(height: 5),
                                Icon(
                                  Icons.severe_cold,
                                  size: 20,
                                  color: Colors.black45,
                                ),
                                SizedBox(height: 5),
                                Icon(
                                  Icons.vaccines_outlined,
                                  size: 20,
                                  color: Colors.black45,
                                ),

                                SizedBox(height: 5),
                                Icon(
                                  Icons.medical_information_outlined,
                                  size: 20,
                                  color: Colors.black45,
                                ),
                                SizedBox(height: 5),
                                Icon(
                                  Icons.vaccines_sharp,
                                  size: 20,
                                  color: Colors.black45,
                                ),
                                SizedBox(height: 5),
                                Icon(
                                  Icons.local_hospital_outlined,
                                  size: 20,
                                  color: Colors.black45,
                                ),
                                SizedBox(height: 5),

                                Icon(
                                  Icons.face_retouching_natural,
                                  size: 20,
                                  color: Colors.black45,
                                ),
                              ],
                            ),
                            SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Height: ',
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(height: 5),
                                Text('Weight: ',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(height: 5),
                                Text('EyeSight: ',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(height: 5),
                                Text('Allergy History: ',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(height: 5),
                                Text('Vaccination : ',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(height: 5),
                                Text('Oral Hygiene : ',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(height: 5),
                                Text('HO Vaccination : ',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(height: 5),
                                Text('HO Illness : ',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(height: 5),
                                Text('Teeth : ',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(widget.height.toString(),
                                    style: const TextStyle(
                                        fontSize: 17, color: Colors.red)),
                                SizedBox(height: 5),
                                Text(widget.weight.toString(),
                                    style: const TextStyle(
                                        fontSize: 17, color: Colors.red)),
                                SizedBox(height: 5),
                                Text(widget.eye_color_vision.toString(),
                                    style: const TextStyle(
                                        fontSize: 17, color: Colors.red)),
                                SizedBox(height: 5),
                                Text(widget.history_of_alergy.toString(),
                                    style: const TextStyle(
                                        fontSize: 17, color: Colors.red)),
                                SizedBox(height: 5),
                                Text(widget.vaccitation.toString(),
                                    style: const TextStyle(
                                        fontSize: 17, color: Colors.red)),
                                SizedBox(height: 5),
                                Text(widget.oral_hygiene.toString(),
                                    style: const TextStyle(
                                        fontSize: 17, color: Colors.red)),
                                SizedBox(height: 5),
                                Text(widget.vaccitation.toString(),
                                    style: const TextStyle(
                                        fontSize: 15, color: Colors.red)),
                                SizedBox(height: 5),
                                Text(widget.historyof_illness.toString(),
                                    style: const TextStyle(
                                        fontSize: 17, color: Colors.red)),
                                SizedBox(height: 5),
                                SizedBox(height: 5),
                                Text(widget.dental_noteeth.toString(),
                                    style: const TextStyle(
                                        fontSize: 17, color: Colors.red)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                      Container(
                          height: 35,
                          width: double.infinity,
                          padding: const EdgeInsets.only(left: 0),
                          alignment: Alignment.centerLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // crossAxisAlignment:CrossAxisAlignment.start ,
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                    alignment: Alignment.center,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(20),
                                          topRight: Radius.circular(20)),
                                      color: appb,
                                      gradient: LinearGradient(
                                        colors: [colorA, Colors.orangeAccent],
                                        begin: Alignment.bottomLeft,
                                        end: Alignment.topRight,
                                      ),
                                    ),
                                    height: 30,
                                    width: 250,
                                    child: const Text('Hearing: ',
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold))),
                              ),
                            ],
                          )),
                      const SizedBox(height: 5),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              offset: const Offset(
                                1.0,
                                1.0,
                              ), //Offset
                              blurRadius: 2.0,
                              spreadRadius: 1.0,
                            ), //BoxShadow
                            BoxShadow(
                              color: Colors.white,
                              offset: const Offset(0.0, 0.0),
                              blurRadius: 0.0,
                              spreadRadius: 0.0,
                            ), //BoxShadow
                          ],
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(20),
                          ),
                          color: appb,
                          gradient: LinearGradient(
                            colors: [Colors.white24, colorA],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                          ),
                        ),
                        margin: EdgeInsets.all(20),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.hearing,
                                  color: Colors.black45,
                                ),
                                SizedBox(height: 5),
                                Icon(
                                  Icons.hearing,
                                  color: Colors.black45,
                                ),
                              ],
                            ),
                            SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Right Ear: ',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(height: 5),
                                Text('Left Ear: ',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(widget.hearing_rt_ear.toString(),
                                    style: const TextStyle(
                                        fontSize: 17, color: Colors.red)),
                                SizedBox(height: 5),
                                Text(widget.hearing_lt_ear.toString(),
                                    style: const TextStyle(
                                        fontSize: 17, color: Colors.red)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                      Container(
                          height: 35,
                          width: double.infinity,
                          padding: const EdgeInsets.only(left: 0),
                          alignment: Alignment.centerLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // crossAxisAlignment:CrossAxisAlignment.start ,
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                    alignment: Alignment.center,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(20),
                                          topRight: Radius.circular(20)),
                                      color: appb,
                                      gradient: LinearGradient(
                                        colors: [colorA, Colors.orangeAccent],
                                        begin: Alignment.bottomLeft,
                                        end: Alignment.topRight,
                                      ),
                                    ),
                                    height: 30,
                                    width: 250,
                                    child: const Text('Ear Canal: ',
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold))),
                              ),
                            ],
                          )),
                      const SizedBox(height: 5),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              offset: const Offset(
                                1.0,
                                1.0,
                              ), //Offset
                              blurRadius: 2.0,
                              spreadRadius: 1.0,
                            ), //BoxShadow
                            BoxShadow(
                              color: Colors.white,
                              offset: const Offset(0.0, 0.0),
                              blurRadius: 0.0,
                              spreadRadius: 0.0,
                            ), //BoxShadow
                          ],
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(20),
                          ),
                          color: appb,
                          gradient: LinearGradient(
                            colors: [Colors.white24, colorA],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                          ),
                        ),
                        margin: EdgeInsets.all(20),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.hearing,
                                  color: Colors.black45,
                                ),
                                SizedBox(height: 5),
                                Icon(
                                  Icons.hearing,
                                  color: Colors.black45,
                                ),
                              ],
                            ),
                            SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Right Ear: ',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(height: 5),
                                Text('Left Ear: ',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(widget.canal_rt_ear.toString(),
                                    style: const TextStyle(
                                        fontSize: 17, color: Colors.red)),
                                SizedBox(height: 5),
                                Text(widget.canal_lt_ear.toString(),
                                    style: const TextStyle(
                                        fontSize: 17, color: Colors.red)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                      Container(
                          height: 35,
                          width: double.infinity,
                          padding: const EdgeInsets.only(left: 0),
                          alignment: Alignment.centerLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // crossAxisAlignment:CrossAxisAlignment.start ,
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                    alignment: Alignment.center,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(20),
                                          topRight: Radius.circular(20)),
                                      color: appb,
                                      gradient: LinearGradient(
                                        colors: [colorA, Colors.orangeAccent],
                                        begin: Alignment.bottomLeft,
                                        end: Alignment.topRight,
                                      ),
                                    ),
                                    height: 30,
                                    width: 250,
                                    child: const Text('Ear Drum: ',
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold))),
                              ),
                            ],
                          )),
                      const SizedBox(height: 5),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              offset: const Offset(
                                1.0,
                                1.0,
                              ), //Offset
                              blurRadius: 2.0,
                              spreadRadius: 1.0,
                            ), //BoxShadow
                            BoxShadow(
                              color: Colors.white,
                              offset: const Offset(0.0, 0.0),
                              blurRadius: 0.0,
                              spreadRadius: 0.0,
                            ), //BoxShadow
                          ],
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(20),
                          ),
                          color: appb,
                          gradient: LinearGradient(
                            colors: [Colors.white24, colorA],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                          ),
                        ),
                        margin: EdgeInsets.all(20),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.hearing,
                                  color: Colors.black45,
                                ),
                                SizedBox(height: 5),
                                Icon(
                                  Icons.hearing,
                                  color: Colors.black45,
                                ),
                              ],
                            ),
                            SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Right Ear: ',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(height: 5),
                                Text('Left Ear: ',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(widget.drum_rt_ear.toString(),
                                    style: const TextStyle(
                                        fontSize: 17, color: Colors.red)),
                                SizedBox(height: 5),
                                Text(widget.drum_lt_ear.toString(),
                                    style: const TextStyle(
                                        fontSize: 17, color: Colors.red)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                      Container(
                          height: 35,
                          width: double.infinity,
                          padding: const EdgeInsets.only(left: 0),
                          alignment: Alignment.centerLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // crossAxisAlignment:CrossAxisAlignment.start ,
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                    alignment: Alignment.center,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(20),
                                          topRight: Radius.circular(20)),
                                      color: appb,
                                      gradient: LinearGradient(
                                        colors: [colorA, Colors.orangeAccent],
                                        begin: Alignment.bottomLeft,
                                        end: Alignment.topRight,
                                      ),
                                    ),
                                    height: 30,
                                    width: 250,
                                    child: const Text('Nose: ',
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold))),
                              ),
                            ],
                          )),
                      const SizedBox(height: 5),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              offset: const Offset(
                                1.0,
                                1.0,
                              ), //Offset
                              blurRadius: 2.0,
                              spreadRadius: 1.0,
                            ), //BoxShadow
                            BoxShadow(
                              color: Colors.white,
                              offset: const Offset(0.0, 0.0),
                              blurRadius: 0.0,
                              spreadRadius: 0.0,
                            ), //BoxShadow
                          ],
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(20),
                          ),
                          color: appb,
                          gradient: LinearGradient(
                            colors: [Colors.white24, colorA],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                          ),
                        ),
                        margin: EdgeInsets.all(20),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.noise_aware,
                                  color: Colors.black45,
                                ),
                                SizedBox(height: 5),
                                Icon(
                                  Icons.noise_aware,
                                  color: Colors.black45,
                                ),
                                SizedBox(height: 5),
                                Icon(
                                  Icons.noise_aware,
                                  color: Colors.black45,
                                ),
                              ],
                            ),
                            SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('DNS: ',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(height: 5),
                                Text('Polyp: ',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(height: 5),
                                Text('Rhinorrhoea: ',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(widget.nose_dns.toString(),
                                    style: const TextStyle(
                                        fontSize: 17, color: Colors.red)),
                                SizedBox(height: 5),
                                Text(widget.nose_polyp.toString(),
                                    style: const TextStyle(
                                        fontSize: 17, color: Colors.red)),
                                SizedBox(height: 5),
                                Text(widget.nose_rhinorrhoea.toString(),
                                    style: const TextStyle(
                                        fontSize: 17, color: Colors.red)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
              const SizedBox(height: 5),
              Container(
                  height: 35,
                  width: double.infinity,
                  padding: const EdgeInsets.only(left: 0),
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment:CrossAxisAlignment.start ,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(20),
                                  topRight: Radius.circular(20)),
                              color: appb,
                              gradient: LinearGradient(
                                colors: [colorA, Colors.orangeAccent],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                              ),
                            ),
                            height: 30,
                            width: 250,
                            child: const Text('Gen_Exam: ',
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold))),
                      ),
                    ],
                  )),
              Container(
                padding: EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: const Offset(
                        1.0,
                        1.0,
                      ), //Offset
                      blurRadius: 2.0,
                      spreadRadius: 1.0,
                    ), //BoxShadow
                    BoxShadow(
                      color: Colors.white,
                      offset: const Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    ), //BoxShadow
                  ],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                  color: appb,
                  gradient: LinearGradient(
                    colors: [Colors.white24, colorA],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
                ),
                margin: EdgeInsets.all(20),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.note_add_outlined,
                          color: Colors.black45,
                          size: 20,
                        ),
                        SizedBox(height: 5),
                        Icon(
                          Icons.note_add_outlined,
                          color: Colors.black45,
                          size: 20,
                        ),
                        SizedBox(height: 5),
                        Icon(
                          Icons.note_add_outlined,
                          color: Colors.black45,
                          size: 20,
                        ),
                        SizedBox(height: 5),
                        Icon(
                          Icons.note_add_outlined,
                          color: Colors.black45,
                          size: 20,
                        ),
                        SizedBox(height: 5),
                        Icon(
                          Icons.note_add_outlined,
                          color: Colors.black45,
                          size: 20,
                        ),
                        SizedBox(height: 5),
                        Icon(
                          Icons.note_add_outlined,
                          color: Colors.black45,
                          size: 20,
                        ),
                        SizedBox(height: 5),
                        Icon(
                          Icons.note_add_outlined,
                          color: Colors.black45,
                          size: 20,
                        ),
                      ],
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Built: ',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(height: 5),
                        Text('Nourishment: ',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(height: 5),
                        Text('Pallor: ',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(height: 5),
                        Text('Icterus: ',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(height: 5),
                        Text('Cyanosis: ',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(height: 5),
                        Text('Pedal Oedema: ',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(height: 5),
                        Text('Gen Lymph Nodes: ',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.gen_ebuilt.toString(),
                            style: const TextStyle(
                                fontSize: 17, color: Colors.red)),
                        SizedBox(height: 5),
                        Text(widget.gen_enourishment.toString(),
                            style: const TextStyle(
                                fontSize: 17, color: Colors.red)),
                        SizedBox(height: 5),
                        Text(widget.gen_epallor.toString(),
                            style: const TextStyle(
                                fontSize: 17, color: Colors.red)),
                        SizedBox(height: 5),
                        Text(widget.gen_eicterus.toString(),
                            style: const TextStyle(
                                fontSize: 17, color: Colors.red)),
                        SizedBox(height: 5),
                        Text(widget.gen_ecyanosis.toString(),
                            style: const TextStyle(
                                fontSize: 17, color: Colors.red)),
                        SizedBox(height: 5),
                        Text(widget.gen_epedol.toString(),
                            style: const TextStyle(
                                fontSize: 17, color: Colors.red)),
                        SizedBox(height: 5),
                        Text(widget.gen_elymph.toString(),
                            style: const TextStyle(
                                fontSize: 17, color: Colors.red)),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Container(
                  height: 35,
                  width: double.infinity,
                  padding: const EdgeInsets.only(left: 0),
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment:CrossAxisAlignment.start ,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(20),
                                  topRight: Radius.circular(20)),
                              color: appb,
                              gradient: LinearGradient(
                                colors: [colorA, Colors.orangeAccent],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                              ),
                            ),
                            height: 30,
                            width: 250,
                            child: const Text('Eye: ',
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold))),
                      ),
                    ],
                  )),
              const SizedBox(height: 5),
              Container(
                padding: EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: const Offset(
                        1.0,
                        1.0,
                      ), //Offset
                      blurRadius: 2.0,
                      spreadRadius: 1.0,
                    ), //BoxShadow
                    BoxShadow(
                      color: Colors.white,
                      offset: const Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    ), //BoxShadow
                  ],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                  color: appb,
                  gradient: LinearGradient(
                    colors: [Colors.white24, colorA],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
                ),
                margin: EdgeInsets.all(20),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.remove_red_eye,
                          color: Colors.black45,
                          size: 20,
                        ),
                        SizedBox(height: 5),
                        Icon(
                          Icons.remove_red_eye,
                          color: Colors.black45,
                          size: 20,
                        ),
                        SizedBox(height: 5),
                        Icon(
                          Icons.remove_red_eye,
                          color: Colors.black45,
                          size: 20,
                        ),
                        SizedBox(height: 5),
                        Icon(
                          Icons.remove_red_eye,
                          color: Colors.black45,
                          size: 20,
                        ),
                        SizedBox(height: 5),
                        Icon(
                          Icons.remove_red_eye,
                          color: Colors.black45,
                          size: 20,
                        ),
                        SizedBox(height: 5),
                        Icon(
                          Icons.remove_red_eye,
                          color: Colors.black45,
                          size: 20,
                        ),
                        SizedBox(height: 5),
                        Icon(
                          Icons.remove_red_eye,
                          color: Colors.black45,
                          size: 20,
                        ),
                      ],
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('DV Right: ',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(height: 5),
                        Text('DV Left: ',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(height: 5),
                        Text('NV Right: ',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(height: 5),
                        Text('NV Left: ',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(height: 5),
                        Text('Colour Vision: ',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(height: 5),
                        Text('RE Right: ',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(height: 5),
                        Text('RE Left: ',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.eye_dv_rt.toString(),
                            style: const TextStyle(
                                fontSize: 17, color: Colors.red)),
                        SizedBox(height: 5),
                        Text(widget.eye_dv_lt.toString(),
                            style: const TextStyle(
                                fontSize: 17, color: Colors.red)),
                        SizedBox(height: 5),
                        Text(widget.eye_nv_rt.toString(),
                            style: const TextStyle(
                                fontSize: 17, color: Colors.red)),
                        SizedBox(height: 5),
                        Text(widget.eye_nv_lt.toString(),
                            style: const TextStyle(
                                fontSize: 17, color: Colors.red)),
                        SizedBox(height: 5),
                        Text(widget.eye_color_vision.toString(),
                            style: const TextStyle(
                                fontSize: 17, color: Colors.red)),
                        SizedBox(height: 5),
                        Text(widget.eye_referr_rt.toString(),
                            style: const TextStyle(
                                fontSize: 17, color: Colors.red)),
                        SizedBox(height: 5),
                        Text(widget.eye_referr_lt.toString(),
                            style: const TextStyle(
                                fontSize: 17, color: Colors.red)),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Container(
                  height: 35,
                  width: double.infinity,
                  padding: const EdgeInsets.only(left: 0),
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment:CrossAxisAlignment.start ,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(20),
                                  topRight: Radius.circular(20)),
                              color: appb,
                              gradient: LinearGradient(
                                colors: [colorA, Colors.orangeAccent],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                              ),
                            ),
                            height: 30,
                            width: 250,
                            child: const Text('Dental: ',
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold))),
                      ),
                    ],
                  )),
              const SizedBox(height: 5),
              Container(
                padding: EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: const Offset(
                        1.0,
                        1.0,
                      ), //Offset
                      blurRadius: 2.0,
                      spreadRadius: 1.0,
                    ), //BoxShadow
                    BoxShadow(
                      color: Colors.white,
                      offset: const Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    ), //BoxShadow
                  ],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                  color: appb,
                  gradient: LinearGradient(
                    colors: [Colors.white24, colorA],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
                ),
                margin: EdgeInsets.all(20),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.face,
                          color: Colors.black45,
                        ),
                        SizedBox(height: 5),
                        Icon(
                          Icons.face,
                          color: Colors.black45,
                        ),
                        SizedBox(height: 5),
                        Icon(
                          Icons.face,
                          color: Colors.black45,
                        ),
                      ],
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('No. of Teeth: ',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(height: 5),
                        Text('Caries: ',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(height: 5),
                        Text('Gums: ',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.dental_noteeth.toString(),
                            style: const TextStyle(
                                fontSize: 17, color: Colors.red)),
                        SizedBox(height: 5),
                        Text(widget.dental_caries.toString(),
                            style: const TextStyle(
                                fontSize: 17, color: Colors.red)),
                        SizedBox(height: 5),
                        Text(widget.dental_gums.toString(),
                            style: const TextStyle(
                                fontSize: 17, color: Colors.red)),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                  height: 35,
                  width: double.infinity,
                  padding: const EdgeInsets.only(left: 0),
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment:CrossAxisAlignment.start ,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(20),
                                  topRight: Radius.circular(20)),
                              color: appb,
                              gradient: LinearGradient(
                                colors: [colorA, Colors.orangeAccent],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                              ),
                            ),
                            height: 30,
                            width: 250,
                            child: const Text('Throat: ',
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold))),
                      ),
                    ],
                  )),
              const SizedBox(height: 5),
              Container(
                padding: EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: const Offset(
                        1.0,
                        1.0,
                      ), //Offset
                      blurRadius: 2.0,
                      spreadRadius: 1.0,
                    ), //BoxShadow
                    BoxShadow(
                      color: Colors.white,
                      offset: const Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    ), //BoxShadow
                  ],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                  color: appb,
                  gradient: LinearGradient(
                    colors: [Colors.white24, colorA],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
                ),
                margin: EdgeInsets.all(20),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.local_hospital,
                          color: Colors.black45,
                        ),
                        SizedBox(height: 5),
                        Icon(
                          Icons.local_hospital,
                          color: Colors.black45,
                        ),
                        SizedBox(height: 5),
                        Icon(
                          Icons.local_hospital,
                          color: Colors.black45,
                        ),
                      ],
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Tonsils: ',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(height: 5),
                        Text('Uvula: ',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(height: 5),
                        Text('Pharynx: ',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.throat_tonsils.toString(),
                            style: const TextStyle(
                                fontSize: 17, color: Colors.red)),
                        SizedBox(height: 5),
                        Text(widget.throat_uvula.toString(),
                            style: const TextStyle(
                                fontSize: 17, color: Colors.red)),
                        SizedBox(height: 5),
                        Text(widget.throat_pharynx.toString(),
                            style: const TextStyle(
                                fontSize: 17, color: Colors.red)),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Container(
                  height: 35,
                  width: double.infinity,
                  padding: const EdgeInsets.only(left: 0),
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment:CrossAxisAlignment.start ,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(20),
                                  topRight: Radius.circular(20)),
                              color: appb,
                              gradient: LinearGradient(
                                colors: [colorA, Colors.orangeAccent],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                              ),
                            ),
                            height: 30,
                            width: 250,
                            child: const Text('Resp Sys: ',
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold))),
                      ),
                    ],
                  )),
              const SizedBox(height: 5),
              Container(
                padding: EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: const Offset(
                        1.0,
                        1.0,
                      ), //Offset
                      blurRadius: 2.0,
                      spreadRadius: 1.0,
                    ), //BoxShadow
                    BoxShadow(
                      color: Colors.white,
                      offset: const Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    ), //BoxShadow
                  ],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                  color: appb,
                  gradient: LinearGradient(
                    colors: [Colors.white24, colorA],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
                ),
                margin: EdgeInsets.all(20),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.medical_services_outlined,
                          color: Colors.black45,
                        ),
                        SizedBox(height: 5),
                        Icon(
                          Icons.medical_services_outlined,
                          color: Colors.black45,
                        ),
                        SizedBox(height: 5),
                        Icon(
                          Icons.medical_services_outlined,
                          color: Colors.black45,
                        ),
                      ],
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Chest Deformity: ',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(height: 5),
                        Text('Resp Rate: ',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(height: 5),
                        Text('Resp Sound: ',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.resp_chest.toString(),
                            style: const TextStyle(
                                fontSize: 17, color: Colors.red)),
                        SizedBox(height: 5),
                        Text(widget.resp_rate.toString(),
                            style: const TextStyle(
                                fontSize: 17, color: Colors.red)),
                        SizedBox(height: 5),
                        Text(widget.resp_sound.toString(),
                            style: const TextStyle(
                                fontSize: 17, color: Colors.red)),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Container(
                  height: 35,
                  width: double.infinity,
                  padding: const EdgeInsets.only(left: 0),
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment:CrossAxisAlignment.start ,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(20),
                                  topRight: Radius.circular(20)),
                              color: appb,
                              gradient: LinearGradient(
                                colors: [colorA, Colors.orangeAccent],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                              ),
                            ),
                            height: 30,
                            width: 250,
                            child: const Text('CVS: ',
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold))),
                      ),
                    ],
                  )),
              const SizedBox(height: 5),
              Container(
                padding: EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: const Offset(
                        1.0,
                        1.0,
                      ), //Offset
                      blurRadius: 2.0,
                      spreadRadius: 1.0,
                    ), //BoxShadow
                    BoxShadow(
                      color: Colors.white,
                      offset: const Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    ), //BoxShadow
                  ],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                  color: appb,
                  gradient: LinearGradient(
                    colors: [Colors.white24, colorA],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
                ),
                margin: EdgeInsets.all(20),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.man,
                          color: Colors.black45,
                        ),
                        SizedBox(height: 5),
                        Icon(
                          Icons.man,
                          color: Colors.black45,
                        ),
                        SizedBox(height: 5),
                        Icon(
                          Icons.man,
                          color: Colors.black45,
                        ),
                      ],
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Precordium: ',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(height: 5),
                        Text('Heart Rate: ',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(height: 5),
                        Text('Heart Sound: ',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.cvs_precordium.toString(),
                            style: const TextStyle(
                                fontSize: 17, color: Colors.red)),
                        SizedBox(height: 5),
                        Text(widget.cvs_heart_rate.toString(),
                            style: const TextStyle(
                                fontSize: 17, color: Colors.red)),
                        SizedBox(height: 5),
                        Text(widget.cvs_heart_sound.toString(),
                            style: const TextStyle(
                                fontSize: 17, color: Colors.red)),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Container(
                  height: 35,
                  width: double.infinity,
                  padding: const EdgeInsets.only(left: 0),
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment:CrossAxisAlignment.start ,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(20),
                                  topRight: Radius.circular(20)),
                              color: appb,
                              gradient: LinearGradient(
                                colors: [colorA, Colors.orangeAccent],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                              ),
                            ),
                            height: 30,
                            width: 250,
                            child: const Text('Abdomen: ',
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold))),
                      ),
                    ],
                  )),
              const SizedBox(height: 5),
              Container(
                padding: EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: const Offset(
                        1.0,
                        1.0,
                      ), //Offset
                      blurRadius: 2.0,
                      spreadRadius: 1.0,
                    ), //BoxShadow
                    BoxShadow(
                      color: Colors.white,
                      offset: const Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    ), //BoxShadow
                  ],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                  color: appb,
                  gradient: LinearGradient(
                    colors: [Colors.white24, colorA],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
                ),
                margin: EdgeInsets.all(20),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.bloodtype_outlined,
                          color: Colors.black45,
                        ),
                        SizedBox(height: 5),
                        Icon(
                          Icons.bloodtype_outlined,
                          color: Colors.black45,
                        )
                      ],
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Deformity: ',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(height: 5),
                        Text('Umbilicus: ',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.abdomen_deformity.toString(),
                            style: const TextStyle(
                                fontSize: 17, color: Colors.red)),
                        SizedBox(height: 5),
                        Text(widget.abdomen_umbillicus.toString(),
                            style: const TextStyle(
                                fontSize: 17, color: Colors.red)),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              const SizedBox(height: 5),
              Container(
                  height: 45,
                  width: double.infinity,
                  padding: const EdgeInsets.only(left: 0),
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment:CrossAxisAlignment.start ,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(20)),
                              color: appb,
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xffb429f9),
                                  colorA,
                                ],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                              ),
                            ),
                            height: 40,
                            width: 250,
                            child: const Text('Pathological Details: ',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold))),
                      ),
                      const SizedBox(width: 15),
                      // const Icon(Icons.person),
                      Image.asset(
                        'assets/pics/pathalogy.png',
                      ),

                      const SizedBox(width: 15),
                    ],
                  )),
              const SizedBox(height: 15),
              Container(
                  height: 35,
                  width: double.infinity,
                  padding: const EdgeInsets.only(left: 0),
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment:CrossAxisAlignment.start ,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(20),
                                  topRight: Radius.circular(20)),
                              color: appb,
                              gradient: LinearGradient(
                                colors: [colorA, Colors.orangeAccent],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                              ),
                            ),
                            height: 30,
                            width: 250,
                            child: const Text('Blood Test: ',
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold))),
                      ),
                    ],
                  )),
              const SizedBox(height: 5),
              Container(
                padding: EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: const Offset(
                        1.0,
                        1.0,
                      ), //Offset
                      blurRadius: 2.0,
                      spreadRadius: 1.0,
                    ), //BoxShadow
                    BoxShadow(
                      color: Colors.white,
                      offset: const Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    ), //BoxShadow
                  ],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                  color: appb,
                  gradient: LinearGradient(
                    colors: [Colors.white24, colorA],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
                ),
                margin: EdgeInsets.all(20),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5),
                        Icon(
                          Icons.bloodtype,
                          size: 20,
                          color: Colors.black45,
                        ),
                        SizedBox(height: 5),
                        Icon(
                          Icons.bloodtype,
                          color: Colors.black45,
                        ),
                        SizedBox(height: 5),
                        Icon(
                          Icons.bloodtype,
                          color: Colors.black45,
                        ),
                      ],
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Blood Group : ',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        Text('HB: ',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(height: 5),
                        Text('TLC: ',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.blood_groop.toString(),
                            style: const TextStyle(
                                fontSize: 17, color: Colors.red)),
                        SizedBox(height: 5),
                        Text(widget.blood_test_hb.toString(),
                            style: const TextStyle(
                                fontSize: 17, color: Colors.red)),
                        SizedBox(height: 5),
                        Text(widget.blood_test_tlc.toString(),
                            style: const TextStyle(
                                fontSize: 17, color: Colors.red)),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                  height: 35,
                  width: double.infinity,
                  padding: const EdgeInsets.only(left: 0),
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment:CrossAxisAlignment.start ,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(20),
                                  topRight: Radius.circular(20)),
                              color: appb,
                              gradient: LinearGradient(
                                colors: [colorA, Colors.orangeAccent],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                              ),
                            ),
                            height: 30,
                            width: 250,
                            child: const Text('RFT: ',
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold))),
                      ),
                    ],
                  )),
              const SizedBox(height: 5),
              Container(
                padding: EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: const Offset(
                        1.0,
                        1.0,
                      ), //Offset
                      blurRadius: 2.0,
                      spreadRadius: 1.0,
                    ), //BoxShadow
                    BoxShadow(
                      color: Colors.white,
                      offset: const Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    ), //BoxShadow
                  ],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                  color: appb,
                  gradient: LinearGradient(
                    colors: [Colors.white24, colorA],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
                ),
                margin: EdgeInsets.all(20),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.bloodtype_outlined,
                          color: Colors.black45,
                        ),
                        SizedBox(height: 5),
                        Icon(
                          Icons.bloodtype_outlined,
                          color: Colors.black45,
                        )
                      ],
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Urea: ',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(height: 5),
                        Text('Creatininne: ',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.kidney_test_urea.toString(),
                            style: const TextStyle(
                                fontSize: 17, color: Colors.red)),
                        SizedBox(height: 5),
                        Text(widget.kedney_test_creatine.toString(),
                            style: const TextStyle(
                                fontSize: 17, color: Colors.red)),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Container(
                  height: 35,
                  width: double.infinity,
                  padding: const EdgeInsets.only(left: 0),
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment:CrossAxisAlignment.start ,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(20),
                                  topRight: Radius.circular(20)),
                              color: appb,
                              gradient: LinearGradient(
                                colors: [colorA, Colors.orangeAccent],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                              ),
                            ),
                            height: 30,
                            width: 250,
                            child: const Text('LFT: ',
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold))),
                      ),
                    ],
                  )),
              const SizedBox(height: 5),
              Container(
                padding: EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: const Offset(
                        1.0,
                        1.0,
                      ), //Offset
                      blurRadius: 2.0,
                      spreadRadius: 1.0,
                    ), //BoxShadow
                    BoxShadow(
                      color: Colors.white,
                      offset: const Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    ), //BoxShadow
                  ],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                  color: appb,
                  gradient: LinearGradient(
                    colors: [Colors.white24, colorA],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
                ),
                margin: EdgeInsets.all(20),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.medical_services_outlined,
                          color: Colors.black45,
                        ),
                        SizedBox(height: 5),
                        Icon(
                          Icons.medical_services_outlined,
                          color: Colors.black45,
                        ),
                        SizedBox(height: 5),
                        Icon(
                          Icons.medical_services_outlined,
                          color: Colors.black45,
                        )
                      ],
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('S. Bilirubin: ',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(height: 5),
                        Text('SGOT: ',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(height: 5),
                        Text('SGPT: ',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.liver_test_bilirubin.toString(),
                            style: const TextStyle(
                                fontSize: 17, color: Colors.red)),
                        SizedBox(height: 5),
                        Text(widget.liver_test_sgot.toString(),
                            style: const TextStyle(
                                fontSize: 17, color: Colors.red)),
                        SizedBox(height: 5),
                        Text(widget.liver_test_sgpt.toString(),
                            style: const TextStyle(
                                fontSize: 17, color: Colors.red)),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                  height: 35,
                  width: double.infinity,
                  padding: const EdgeInsets.only(left: 0),
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment:CrossAxisAlignment.start ,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(20),
                                  topRight: Radius.circular(20)),
                              color: appb,
                              gradient: LinearGradient(
                                colors: [colorA, Colors.orangeAccent],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                              ),
                            ),
                            height: 30,
                            width: 250,
                            child: const Text('Thyroid: ',
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold))),
                      ),
                    ],
                  )),
              const SizedBox(height: 5),
              Container(
                padding: EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: const Offset(
                        1.0,
                        1.0,
                      ), //Offset
                      blurRadius: 2.0,
                      spreadRadius: 1.0,
                    ), //BoxShadow
                    BoxShadow(
                      color: Colors.white,
                      offset: const Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    ), //BoxShadow
                  ],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                  color: appb,
                  gradient: LinearGradient(
                    colors: [Colors.white24, colorA],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
                ),
                margin: EdgeInsets.all(20),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.local_hospital_outlined,
                          color: Colors.black45,
                        ),
                        SizedBox(height: 5),
                        Icon(
                          Icons.local_hospital_outlined,
                          color: Colors.black45,
                        ),
                        SizedBox(height: 5),
                        Icon(
                          Icons.local_hospital_outlined,
                          color: Colors.black45,
                        )
                      ],
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('TSH: ',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(height: 5),
                        Text('T3: ',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(height: 5),
                        Text('T4: ',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.thyroid_tsh.toString(),
                            style: const TextStyle(
                                fontSize: 17, color: Colors.red)),
                        SizedBox(height: 5),
                        Text(widget.thyroid_t3.toString(),
                            style: const TextStyle(
                                fontSize: 17, color: Colors.red)),
                        SizedBox(height: 5),
                        Text(widget.thyroid_t4.toString(),
                            style: const TextStyle(
                                fontSize: 17, color: Colors.red)),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Container(
                  height: 35,
                  width: double.infinity,
                  padding: const EdgeInsets.only(left: 0),
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment:CrossAxisAlignment.start ,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(20),
                                  topRight: Radius.circular(20)),
                              color: appb,
                              gradient: LinearGradient(
                                colors: [colorA, Colors.blueGrey],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                              ),
                            ),
                            height: 30,
                            width: 100,
                            child: const Text('DLC: ',
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold))),
                      ),
                    ],
                  )),
              const SizedBox(height: 5),
              Container(
                padding: EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: const Offset(
                        1.0,
                        1.0,
                      ), //Offset
                      blurRadius: 2.0,
                      spreadRadius: 1.0,
                    ), //BoxShadow
                    BoxShadow(
                      color: Colors.white,
                      offset: const Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    ), //BoxShadow
                  ],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                  color: appb,
                  gradient: LinearGradient(
                    colors: [Colors.white24, colorA],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
                ),
                margin: EdgeInsets.all(20),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.bloodtype,
                          color: Colors.black45,
                        ),
                        SizedBox(height: 5),
                        Icon(
                          Icons.bloodtype,
                          color: Colors.black45,
                        ),
                        SizedBox(height: 5),
                        Icon(
                          Icons.bloodtype,
                          color: Colors.black45,
                        ),
                        SizedBox(height: 5),
                        Icon(
                          Icons.bloodtype,
                          color: Colors.black45,
                        ),
                        SizedBox(height: 5),
                        Icon(
                          Icons.bloodtype,
                          color: Colors.black45,
                        ),
                      ],
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('P: ',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(height: 5),
                        Text('L: ',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(height: 5),
                        Text('E: ',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(height: 5),
                        Text('B: ',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(height: 5),
                        Text('M: ',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.blood_test_dlc_p.toString(),
                            style: const TextStyle(
                                fontSize: 17, color: Colors.red)),
                        SizedBox(height: 5),
                        Text(widget.blood_test_dlc_l.toString(),
                            style: const TextStyle(
                                fontSize: 17, color: Colors.red)),
                        SizedBox(height: 5),
                        Text(widget.blood_test_dlc_e.toString(),
                            style: const TextStyle(
                                fontSize: 17, color: Colors.red)),
                        SizedBox(height: 5),
                        Text(widget.blood_test_dlc_b.toString(),
                            style: const TextStyle(
                                fontSize: 17, color: Colors.red)),
                        SizedBox(height: 5),
                        Text(widget.blood_test_dlc_m.toString(),
                            style: const TextStyle(
                                fontSize: 17, color: Colors.red)),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Container(
                  height: 35,
                  width: double.infinity,
                  padding: const EdgeInsets.only(left: 0),
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment:CrossAxisAlignment.start ,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(20),
                                  topRight: Radius.circular(20)),
                              color: appb,
                              gradient: LinearGradient(
                                colors: [colorA, Colors.blueGrey],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                              ),
                            ),
                            height: 30,
                            width: 100,
                            child: const Text('BLD Sugar: ',
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold))),
                      ),
                    ],
                  )),
              const SizedBox(height: 5),
              Container(
                padding: EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: const Offset(
                        1.0,
                        1.0,
                      ), //Offset
                      blurRadius: 2.0,
                      spreadRadius: 1.0,
                    ), //BoxShadow
                    BoxShadow(
                      color: Colors.white,
                      offset: const Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    ), //BoxShadow
                  ],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                  color: appb,
                  gradient: LinearGradient(
                    colors: [Colors.white24, colorA],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
                ),
                margin: EdgeInsets.all(20),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.bloodtype,
                          color: Colors.black45,
                        ),
                        SizedBox(height: 5),
                        Icon(
                          Icons.bloodtype,
                          color: Colors.black45,
                        ),
                        SizedBox(height: 5),
                        Icon(
                          Icons.bloodtype,
                          color: Colors.black45,
                        ),
                      ],
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Fasting: ',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(height: 5),
                        Text('PP: ',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(height: 5),
                        Text('Random: ',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.blood_test_sugar_f.toString(),
                            style: const TextStyle(
                                fontSize: 17, color: Colors.red)),
                        SizedBox(height: 5),
                        Text(widget.blood_test_sugar_pp.toString(),
                            style: const TextStyle(
                                fontSize: 17, color: Colors.red)),
                        SizedBox(height: 5),
                        Text(widget.blood_test_sugar_r.toString(),
                            style: const TextStyle(
                                fontSize: 17, color: Colors.red)),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                  height: 45,
                  width: double.infinity,
                  padding: const EdgeInsets.only(left: 0),
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment:CrossAxisAlignment.start ,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(20)),
                              color: colord,
                              gradient: LinearGradient(
                                colors: [
                                  colord,
                                  colorA,
                                ],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                              ),
                            ),
                            height: 40,
                            width: 250,
                            child: const Text(' Doctor Referral : ',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold))),
                      ),
                      const SizedBox(width: 15),
                      // const Icon(Icons.person),
                      Image.asset(
                        'assets/pics/doctord.png',
                      ),

                      const SizedBox(width: 15),
                    ],
                  )),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: const Offset(
                        1.0,
                        1.0,
                      ), //Offset
                      blurRadius: 2.0,
                      spreadRadius: 1.0,
                    ), //BoxShadow
                    BoxShadow(
                      color: Colors.white,
                      offset: const Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    ), //BoxShadow
                  ],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                  color: appb,
                  gradient: LinearGradient(
                    colors: [Colors.white24, colorA],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
                ),
                margin: EdgeInsets.all(20),
                child: HtmlWidget(
                  widget.refer.toString(),
                ),
              ),
              const SizedBox(
                height: 40,
              )
            ])
          ],
        ),
      ),
    );
  }
}
