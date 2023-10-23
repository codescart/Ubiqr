import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ubiqr/Constant/base_url.dart';
import 'package:ubiqr/Constant/colors.dart';
import "package:http/http.dart" as http;
import 'package:ubiqr/Ztest.dart';
import 'package:ubiqr/prescriptionView/prescription/hospitalview.dart';
import 'package:ubiqr/prescriptionView/prescription/form.dart';

class Detail extends StatefulWidget {
  final String type;
   Detail({Key? key, required this.type}) : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 30,
          ),
          Container(
            height: 50,
            width: 300,
            decoration: const BoxDecoration(
                boxShadow: [
               BoxShadow(
                color: Colors.black,
                offset: Offset(5.0, 5.0),
                blurRadius: 15.0,
                spreadRadius: 0.0,
              ),
            ]),
            child:
          ElevatedButton(
            style: TextButton.styleFrom(
              backgroundColor: const Color(0xffBA68C8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  10,
                ),
              ),
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => UpdateProfile(type: widget.type),
                ),
              );
            },
            child: const Text(
              'Upload Prescription',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
           ),
          SizedBox(
            height: 30,
          ),
          RefreshIndicator(
            onRefresh: () async  {

              setState(() {
                doctors();
                //error
              });
            },
            child: Container(
              height: 480,
              child: FutureBuilder<List<Doctor>>(
                future: doctors(),
                builder: (context, snapshot) {
                  return snapshot.hasData
                      ? ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: ((context, index) {
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, right: 10),
                                  height: 100,

                                  decoration: BoxDecoration(color: colorA
                                    , borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceAround,

                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(

                                          child: Text('${snapshot.data![index]
                                              .hospital_name}',
                                            maxLines: 2,
                                            style: TextStyle(fontSize: 15,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceAround,

                                        children: [
                                          Text(
                                              'Dr.${snapshot.data![index]
                                                  .doctor_name}',
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                              )),
                                          Spacer(),
                                          Text(
                                            "Date :"'${snapshot.data![index].date}',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey, fontSize: 10,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                              '${snapshot.data![index].subject}',
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                              )),
                                          Spacer(),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            child: Column(
                                              children: [
                                                TextButton(
                                                  style: TextButton.styleFrom(
                                                      backgroundColor: appb,
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              10))),
                                                  child: const Text('view',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 15)),
                                                  onPressed: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                View(raja: snapshot
                                                                    .data![index])));
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),

                                    ],
                                  )
                              ),
                            )
                          ],
                        );
                      }))
                      : Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 150.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 120,
                            width: 120,
                            child: Image.asset("assets/pics/load.gif"),
                          ),
                          Text('Please Upload Your Prescription',
                              style: TextStyle(fontSize: 10))
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<List<Doctor>> doctors() async {
    final prefs = await SharedPreferences.getInstance();
    final vals = prefs.getString('id');
    final mobile = prefs.getString('mobile') ?? "0";
    print('ak');

    print(vals);

    print('ak');
    final response = await http.post(
      Uri.parse(
          Apiconst.baseurl + "hospital_get"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "id": vals!,
        "phone": mobile,
        "type": widget.type,
      }),
    );
    var jsond = json.decode(response.body)["country"];

    print("fhfhfhf");
    print(response.body);
    print(jsond);
    List<Doctor> allround = [];
    for (var o in jsond) {
      Doctor al = Doctor(
        o["id"],
        o["hospital_name"],
        o["doctor_name"],
        o["date"],
        o["images"],
        o["subject"],
        o["phone"],
        o["s_id"],
      );
      allround.add(al);
    }
    return allround;
  }
}


class Doctor {
  String? id;
  String? hospital_name;
  String? doctor_name;
  String? date;
  String images;
  String? subject;
  String? phone;
  String? s_id;

  Doctor(
    this.id,
    this.hospital_name,
    this.doctor_name,
    this.date,
    this.images,
    this.subject,
    this.phone,
    this.s_id,
  );
}
