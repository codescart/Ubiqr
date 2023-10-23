import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ubiqr/Constant/base_url.dart';
import 'package:ubiqr/SelectingChild/Selecting.dart';
import 'package:ubiqr/home_main/Slider.dart';
import 'package:ubiqr/Constant/colors.dart';
import 'detailed_medical.dart';

class Home_page extends StatefulWidget {
  const Home_page({Key? key}) : super(key: key);

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  List country_data = [];
  var idsl;
  var ydsl = 'year';

  String? ids;
  var childcount;
  Future<String> country() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      childcount = prefs.getInt("childcount") ?? 0;
    });

    final vals = prefs.getString('id') ?? "0";
    final mobile = prefs.getString('mobile') ?? "0";
    print(vals);
    print("gggggggggggggggg");
    final response = await http.post(
      Uri.parse(Apiconst.baseurl + Apiconst.year),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "name": vals,
        "mobile": mobile,
      }),
    );
    final resBody = json.decode(response.body)['country'];
    print(resBody);
    setState(() {
      country_data = resBody;
      idsl = country_data[0]['id'];
      ydsl = country_data[0]['month'] + ' ' + country_data[0]['year'];
    });
    return "Sucess";
  }

  late PageController _pageController;
  // List<String> images = [
  // ];
  @override
  void initState() {
    // bow();
    super.initState();
    country();

    getCurrentDate();
    _pageController = PageController(
      viewportFraction: 0.8,
      initialPage: 1,
    );
  }

  String finaldte = '';
  getCurrentDate() {
    var date = new DateTime.now().toString();

    var dateParse = DateTime.parse(date);

    var formattedDate = "${dateParse.year}";

    setState(() {
      finaldte = formattedDate.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor:  colorB,
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
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width * 0.32,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 2,
                          ), //Border.all
                          borderRadius: BorderRadius.circular(
                            15,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              dropdownColor: Colors.white,
                              hint: Text(
                                ydsl.toUpperCase(),
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              items: country_data.map((item) {
                                return DropdownMenuItem(
                                    value: item['id'].toString(),
                                    child: Text(
                                      item['month'].toString().toUpperCase() +
                                          ' ' +
                                          item['year'].toString(),
                                      overflow: TextOverflow.clip,
                                      maxLines: 1,
                                      softWrap: false,
                                      style: const TextStyle(
                                          fontFamily: "Windsor",
                                          fontSize: 12,
                                          fontWeight: FontWeight.w800,
                                          color: Colors.black),
                                      textAlign: TextAlign.justify,
                                    ));
                              }).toList(),
                              onChanged: (value) async {
                                setState(() {
                                  ids = value as String;
                                });
                              },
                              value: ids,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            setState(() {
              bow();
              //error
            });
          },
          child: ListView(
            physics:  BouncingScrollPhysics(),
            shrinkWrap: true,
            // scrollDirection: Axis.vertical,
            children: [
              FutureBuilder<List<Album>>(
                  future: bow(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) print(snapshot.error);
                    return snapshot.hasData
                        ? ListView.builder(
                            physics:  NeverScrollableScrollPhysics(),
                           // scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data!.length,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: EdgeInsets.all(0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.only(
                                            top: 5,
                                            left: 10,
                                            right: 5,
                                            bottom: 5,
                                          ),
                                          width: MediaQuery.of(context)
                                              .size
                                              .width,
                                          decoration: const BoxDecoration(
                                            color: colorB,
                                            borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(
                                                50,
                                              ),
                                              bottomLeft: Radius.circular(
                                                50,
                                              ),
                                            ),
                                          ),
                                          child: Row(
                                            children: [
                                              //snapshot.data![index].images==0?
                                              snapshot.data![index].images ==
                                                      null
                                                  ? Container(
                                                      height: 70,
                                                      width: 70,
                                                      decoration:
                                                          BoxDecoration(
                                                        image:
                                                            new DecorationImage(
                                                          image: AssetImage(
                                                              'assets/pics/eye.png'),
                                                          fit: BoxFit.fill,
                                                        ),
                                                        color: Colors.white,
                                                        borderRadius:
                                                            const BorderRadius
                                                                    .all(
                                                                Radius
                                                                    .circular(
                                                          100.0,
                                                        )),
                                                      ),
                                                    )
                                                  : Container(
                                                      height: 70,
                                                      width: 70,
                                                      decoration:
                                                          BoxDecoration(
                                                        image:
                                                            new DecorationImage(
                                                          image: NetworkImage(
                                                            snapshot
                                                                .data![index]
                                                                .images
                                                                .toString(),
                                                          ),
                                                          fit: BoxFit.fill,
                                                        ),
                                                        color: Colors.white,
                                                        borderRadius:
                                                            const BorderRadius
                                                                    .all(
                                                                Radius
                                                                    .circular(
                                                          100.0,
                                                        )),
                                                      ),
                                                    ),


                                              Container(
                                                padding:
                                                    const EdgeInsets.only(
                                                        left: 20),
                                                child: Column(
                                                  //mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                  children: [
                                                    Container(
                                                      width: 250,
                                                      child: Row(
                                                        children: [
                                                          const SizedBox(
                                                              width: 5),
                                                          Text(
                                                            snapshot
                                                                .data![index]
                                                                .name
                                                                .toString()
                                                                .toUpperCase(),
                                                            style: const TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 15,
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                          Spacer(),
                                                          // const SizedBox(
                                                          //   width: 70,
                                                          // ),
                                                          Text(
                                                            snapshot
                                                                .data![index]
                                                                .age
                                                                .toString(),
                                                            style: const TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 14,
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                          SizedBox(width: 3),
                                                          Text('Year',
                                                              style: const TextStyle(
                                                                  fontSize:
                                                                      13,
                                                                  color: Colors
                                                                      .white)),
                                                        ],
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            const SizedBox(
                                                                width: 5),
                                                            Text(
                                                              "${snapshot.data![index].class_name.toString()}-" +
                                                                  "${snapshot.data![index].section.toString()}",
                                                              style: const TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize:
                                                                      15,
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    Container(
                                                      width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width *
                                                          0.70,
                                                      child: Text(
                                                        snapshot.data![index]
                                                            .school_name
                                                            .toString(),
                                                        maxLines: 2,
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            color:
                                                                Colors.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
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
                                    SizedBox(height: 12,),
                                    Slider_wer(),
                                    SizedBox(height: 12,),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      // crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 100,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.4,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: colorA,
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Image.asset(
                                                'assets/pics/height.png',
                                                height: 60,
                                              ),
                                              Container(
                                                  margin:
                                                      const EdgeInsets.only(
                                                    left: 5,
                                                    right: 5,
                                                  ),
                                                  height: 30,
                                                  width: 150,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      20,
                                                    ),
                                                    color: colorC,
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                        ' ${snapshot.data![index].height} cm',
                                                        style: const TextStyle(
                                                            color:
                                                                Colors.white,
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                  ))
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 15),
                                        Container(
                                          height: 100,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.4,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: colorA,
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Image.asset(
                                                'assets/pics/weight.png',
                                                height: 60,
                                              ),
                                              Container(
                                                height: 30,
                                                margin: const EdgeInsets.only(
                                                    left: 5, right: 5),
                                                width: 150,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20),
                                                  color: colorC,
                                                ),
                                                child: Center(
                                                  child: Text(
                                                      " ${snapshot.data![index].weight} kg",
                                                      style: const TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight
                                                                  .bold)),
                                                ),
                                                // child: Center(child:Text('Weight: 'snapshot.data![index].toString(),style:const TextStyle(color:Colors.white,fontSize: 15,fontWeight: FontWeight.bold)),
                                                // )
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 15),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          height: 100,
                                          width: MediaQuery.of(
                                                context,
                                              ).size.width *
                                              0.4,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: colorA,
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Image.asset(
                                                'assets/pics/sight.png',
                                                height: 60,
                                              ),
                                              Container(
                                                  margin:
                                                      const EdgeInsets.only(
                                                          left: 5, right: 5),
                                                  height: 30,
                                                  width: 150,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: colorC,
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                        ' ${snapshot.data![index].eye_color_vision}',
                                                        style: const TextStyle(
                                                            color:
                                                                Colors.white,
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                  ))
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 15),
                                        Container(
                                          height: 100,
                                          width: MediaQuery.of(
                                                context,
                                              ).size.width *
                                              0.4,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: colorA,
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Image.asset(
                                                'assets/pics/hhear.png',
                                                height: 60,
                                              ),
                                              Container(
                                                  margin:
                                                      const EdgeInsets.only(
                                                    left: 5,
                                                    right: 5,
                                                  ),
                                                  height: 30,
                                                  width: 150,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: colorC,
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                        ' ${snapshot.data![index].hearing_lt_ear}',
                                                        style: const TextStyle(
                                                            color:
                                                                Colors.white,
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                  ))
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 15),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          height: 100,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.4,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: colorA,
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Image.asset(
                                                'assets/pics/blood.png',
                                                height: 65,
                                              ),
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    left: 5,
                                                    right: 5,
                                                    bottom: 3),
                                                height: 30,
                                                width: 150,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20),
                                                  color: colorC,
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    ' ${snapshot.data![index].blood_groop}',
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white,
                                                        fontSize: 15),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 15),
                                        Container(
                                          height: 100,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.4,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: colorA,
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Image.asset(
                                                'assets/pics/allergy.png',
                                                height: 60,
                                              ),
                                              Container(
                                                  margin:
                                                      const EdgeInsets.only(
                                                    left: 5,
                                                    right: 5,
                                                  ),
                                                  height: 30,
                                                  width: 150,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      20,
                                                    ),
                                                    color: colorC,
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      '${snapshot.data![index].history_of_alergy}',
                                                      style: const TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight
                                                                  .bold),
                                                    ),
                                                  ))
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 15),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          height: 100,
                                          padding:
                                              const EdgeInsets.only(top: 10),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.4,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: colorA,
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Image.asset(
                                                'assets/pics/vacci.png',
                                                height: 50,
                                              ),
                                              Container(
                                                  height: 30,
                                                  width: 150,
                                                  margin:
                                                      const EdgeInsets.only(
                                                    right: 2,
                                                    left: 2,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: colorC,
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                        ' ${snapshot.data![index].vaccitation}',
                                                        style: const TextStyle(
                                                            color:
                                                                Colors.white,
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                  ))
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 15),
                                        Container(
                                          height: 100,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.4,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: colorA,
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Image.asset(
                                                'assets/pics/kid.png',
                                                height: 60,
                                              ),
                                              Container(
                                                  height: 30,
                                                  width: 150,
                                                  margin:
                                                      const EdgeInsets.only(
                                                          left: 2, right: 2),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: colorC,
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                        ' ${snapshot.data![index].dental_noteeth}',
                                                        style: const TextStyle(
                                                            color:
                                                                Colors.white,
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                  ))
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 15),
                                    Container(
                                      height: 39,
                                      width: 300,
                                      decoration: const BoxDecoration(),
                                      child: TextButton(
                                          style: TextButton.styleFrom(
                                              backgroundColor: appb,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10))),
                                          onPressed: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Detailed_Medical(
                                                          id: snapshot
                                                              .data![index].id
                                                              .toString(),
                                                          name: snapshot
                                                              .data![index]
                                                              .name
                                                              .toString(),
                                                          class_name: snapshot
                                                              .data![index]
                                                              .class_name
                                                              .toString(),
                                                          fname: snapshot
                                                              .data![index]
                                                              .fname
                                                              .toString(),
                                                          school_name:
                                                              snapshot
                                                                  .data![
                                                                      index]
                                                                  .school_name
                                                                  .toString(),
                                                          dob: snapshot
                                                              .data![index]
                                                              .dob
                                                              .toString(),
                                                          age: snapshot
                                                              .data![index]
                                                              .age
                                                              .toString(),
                                                          section: snapshot
                                                              .data![index]
                                                              .section
                                                              .toString(),
                                                          email: snapshot
                                                              .data![index]
                                                              .email
                                                              .toString(),
                                                          phone: snapshot
                                                              .data![index]
                                                              .phone
                                                              .toString(),
                                                          gender: snapshot
                                                              .data![index]
                                                              .gender
                                                              .toString(),
                                                          locality: snapshot
                                                              .data![index]
                                                              .locality
                                                              .toString(),
                                                          city: snapshot
                                                              .data![index]
                                                              .city
                                                              .toString(),
                                                          state: snapshot
                                                              .data![index]
                                                              .state
                                                              .toString(),
                                                          height: snapshot
                                                              .data![index]
                                                              .height
                                                              .toString(),
                                                          weight: snapshot
                                                              .data![index]
                                                              .weight
                                                              .toString(),
                                                          bmi: snapshot
                                                              .data![index]
                                                              .bmi
                                                              .toString(),
                                                          oral_hygiene:
                                                              snapshot
                                                                  .data![
                                                                      index]
                                                                  .oral_hygiene
                                                                  .toString(),
                                                          gen_ebuilt: snapshot
                                                              .data![index]
                                                              .gen_ebuilt
                                                              .toString(),
                                                          gen_enourishment:
                                                              snapshot
                                                                  .data![
                                                                      index]
                                                                  .gen_enourishment
                                                                  .toString(),
                                                          gen_epallor:
                                                              snapshot
                                                                  .data![
                                                                      index]
                                                                  .gen_epallor
                                                                  .toString(),
                                                          gen_eicterus:
                                                              snapshot
                                                                  .data![
                                                                      index]
                                                                  .gen_eicterus
                                                                  .toString(),
                                                          gen_ecyanosis:
                                                              snapshot
                                                                  .data![
                                                                      index]
                                                                  .gen_ecyanosis
                                                                  .toString(),
                                                          gen_epedol: snapshot
                                                              .data![index]
                                                              .gen_epedol
                                                              .toString(),
                                                          gen_elymph: snapshot
                                                              .data![index]
                                                              .gen_elymph
                                                              .toString(),
                                                          eye_dv_rt: snapshot
                                                              .data![index]
                                                              .eye_dv_rt
                                                              .toString(),
                                                          eye_dv_lt: snapshot
                                                              .data![index]
                                                              .eye_dv_lt
                                                              .toString(),
                                                          eye_nv_rt: snapshot
                                                              .data![index]
                                                              .eye_nv_rt
                                                              .toString(),
                                                          eye_nv_lt: snapshot
                                                              .data![index]
                                                              .eye_nv_lt
                                                              .toString(),
                                                          eye_color_vision:
                                                              snapshot
                                                                  .data![
                                                                      index]
                                                                  .eye_color_vision
                                                                  .toString(),
                                                          eye_referr_rt:
                                                              snapshot
                                                                  .data![
                                                                      index]
                                                                  .eye_referr_rt
                                                                  .toString(),
                                                          eye_referr_lt:
                                                              snapshot
                                                                  .data![
                                                                      index]
                                                                  .eye_referr_lt
                                                                  .toString(),
                                                          hearing_rt_ear:
                                                              snapshot
                                                                  .data![
                                                                      index]
                                                                  .hearing_rt_ear
                                                                  .toString(),
                                                          hearing_lt_ear:
                                                              snapshot
                                                                  .data![
                                                                      index]
                                                                  .hearing_lt_ear
                                                                  .toString(),
                                                          canal_rt_ear:
                                                              snapshot
                                                                  .data![
                                                                      index]
                                                                  .canal_rt_ear
                                                                  .toString(),
                                                          canal_lt_ear:
                                                              snapshot
                                                                  .data![
                                                                      index]
                                                                  .canal_lt_ear
                                                                  .toString(),
                                                          drum_rt_ear:
                                                              snapshot
                                                                  .data![
                                                                      index]
                                                                  .drum_rt_ear
                                                                  .toString(),
                                                          drum_lt_ear:
                                                              snapshot
                                                                  .data![
                                                                      index]
                                                                  .drum_lt_ear
                                                                  .toString(),
                                                          nose_dns: snapshot
                                                              .data![index]
                                                              .nose_dns
                                                              .toString(),
                                                          nose_polyp: snapshot
                                                              .data![index]
                                                              .nose_polyp
                                                              .toString(),
                                                          nose_rhinorrhoea:
                                                              snapshot
                                                                  .data![
                                                                      index]
                                                                  .nose_rhinorrhoea
                                                                  .toString(),
                                                          throat_tonsils:
                                                              snapshot
                                                                  .data![
                                                                      index]
                                                                  .throat_tonsils
                                                                  .toString(),
                                                          throat_uvula:
                                                              snapshot
                                                                  .data![
                                                                      index]
                                                                  .throat_uvula
                                                                  .toString(),
                                                          throat_pharynx:
                                                              snapshot
                                                                  .data![
                                                                      index]
                                                                  .throat_pharynx
                                                                  .toString(),
                                                          dental_noteeth:
                                                              snapshot
                                                                  .data![
                                                                      index]
                                                                  .dental_noteeth
                                                                  .toString(),
                                                          dental_caries:
                                                              snapshot
                                                                  .data![
                                                                      index]
                                                                  .dental_caries
                                                                  .toString(),
                                                          dental_gums:
                                                              snapshot
                                                                  .data![
                                                                      index]
                                                                  .dental_gums
                                                                  .toString(),
                                                          resp_chest: snapshot
                                                              .data![index]
                                                              .resp_chest
                                                              .toString(),
                                                          resp_rate: snapshot
                                                              .data![index]
                                                              .resp_rate
                                                              .toString(),
                                                          resp_sound: snapshot
                                                              .data![index]
                                                              .resp_sound
                                                              .toString(),
                                                          cvs_precordium:
                                                              snapshot
                                                                  .data![
                                                                      index]
                                                                  .cvs_precordium
                                                                  .toString(),
                                                          cvs_heart_rate:
                                                              snapshot
                                                                  .data![
                                                                      index]
                                                                  .cvs_heart_rate
                                                                  .toString(),
                                                          cvs_heart_sound:
                                                              snapshot
                                                                  .data![
                                                                      index]
                                                                  .cvs_heart_sound
                                                                  .toString(),
                                                          abdomen_deformity:
                                                              snapshot
                                                                  .data![
                                                                      index]
                                                                  .abdomen_deformity
                                                                  .toString(),
                                                          abdomen_umbillicus:
                                                              snapshot
                                                                  .data![
                                                                      index]
                                                                  .abdomen_umbillicus
                                                                  .toString(),
                                                          blood_test_hb:
                                                              snapshot
                                                                  .data![
                                                                      index]
                                                                  .blood_test_hb
                                                                  .toString(),
                                                          blood_test_tlc:
                                                              snapshot
                                                                  .data![
                                                                      index]
                                                                  .blood_test_tlc
                                                                  .toString(),
                                                          blood_test_dlc_p:
                                                              snapshot
                                                                  .data![
                                                                      index]
                                                                  .blood_test_dlc_p
                                                                  .toString(),
                                                          blood_test_dlc_l:
                                                              snapshot
                                                                  .data![
                                                                      index]
                                                                  .blood_test_dlc_l
                                                                  .toString(),
                                                          blood_test_dlc_m:
                                                              snapshot
                                                                  .data![
                                                                      index]
                                                                  .blood_test_dlc_m
                                                                  .toString(),
                                                          blood_test_dlc_e:
                                                              snapshot
                                                                  .data![
                                                                      index]
                                                                  .blood_test_dlc_e
                                                                  .toString(),
                                                          blood_test_dlc_b:
                                                              snapshot
                                                                  .data![
                                                                      index]
                                                                  .blood_test_dlc_b
                                                                  .toString(),
                                                          blood_test_sugar_f:
                                                              snapshot
                                                                  .data![
                                                                      index]
                                                                  .blood_test_sugar_f
                                                                  .toString(),
                                                          blood_test_sugar_pp:
                                                              snapshot
                                                                  .data![
                                                                      index]
                                                                  .blood_test_sugar_pp
                                                                  .toString(),
                                                          blood_test_sugar_r:
                                                              snapshot
                                                                  .data![
                                                                      index]
                                                                  .blood_test_sugar_r
                                                                  .toString(),
                                                          kidney_test_urea:
                                                              snapshot
                                                                  .data![
                                                                      index]
                                                                  .kidney_test_urea
                                                                  .toString(),
                                                          kedney_test_creatine:
                                                              snapshot
                                                                  .data![
                                                                      index]
                                                                  .kedney_test_creatine
                                                                  .toString(),
                                                          liver_test_bilirubin:
                                                              snapshot
                                                                  .data![
                                                                      index]
                                                                  .liver_test_bilirubin
                                                                  .toString(),
                                                          liver_test_sgot:
                                                              snapshot
                                                                  .data![
                                                                      index]
                                                                  .liver_test_sgot
                                                                  .toString(),
                                                          liver_test_sgpt:
                                                              snapshot
                                                                  .data![
                                                                      index]
                                                                  .liver_test_sgpt
                                                                  .toString(),
                                                          thyroid_tsh:
                                                              snapshot
                                                                  .data![
                                                                      index]
                                                                  .thyroid_tsh
                                                                  .toString(),
                                                          thyroid_t3: snapshot
                                                              .data![index]
                                                              .thyroid_t3
                                                              .toString(),
                                                          thyroid_t4: snapshot
                                                              .data![index]
                                                              .thyroid_t4
                                                              .toString(),
                                                          blood_groop:
                                                              snapshot
                                                                  .data![
                                                                      index]
                                                                  .blood_groop
                                                                  .toString(),
                                                          history_of_alergy:
                                                              snapshot
                                                                  .data![
                                                                      index]
                                                                  .history_of_alergy
                                                                  .toString(),
                                                          historyof_illness:
                                                              snapshot
                                                                  .data![
                                                                      index]
                                                                  .historyof_illness
                                                                  .toString(),
                                                          diagnosis: snapshot
                                                              .data![index]
                                                              .diagnosis
                                                              .toString(),
                                                          year: snapshot
                                                              .data![index]
                                                              .year
                                                              .toString(),
                                                          vaccitation:
                                                              snapshot
                                                                  .data![
                                                                      index]
                                                                  .vaccitation
                                                                  .toString(),
                                                          refer:
                                                              snapshot
                                                                  .data![
                                                                      index]
                                                                  .refer
                                                                  .toString(),
                                                          images: snapshot
                                                              .data![index]
                                                              .images
                                                              .toString(),
                                                        )));
                                          },
                                          child: const Text(
                                              'Detailed Medical Report',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20))),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    // Text("${snapshot.data!.length}"),
                                    childcount >= 2
                                        ? InkWell(
                                            onTap: () {
                                              Navigator.of(context)
                                                  .pushReplacement(
                                                      MaterialPageRoute(
                                                          builder:
                                                              (context) =>
                                                                  Select()));
                                            },
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
                                              height: 39,
                                              width: 300,
                                              decoration: BoxDecoration(
                                                color: colorA,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  10,
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Text(
                                                    'Change Your Children',
                                                    style: TextStyle(
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            2),
                                                    child: Image.asset(
                                                        'assets/pics/report.png'),
                                                  )
                                                ],
                                              ),
                                            ),
                                          )
                                        : Container(),
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
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Future<List<Album>> bow() async {
    final prefs = await SharedPreferences.getInstance();
    final vals = prefs.getString('id') ?? "0";
    final mobile = prefs.getString('mobile') ?? "0";
    print(vals);
    final response = await http.post(
      Uri.parse(Apiconst.all_student_data),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "id": ids == null ? idsl! : ids,
      }),
    );
    var jsond = json.decode(response.body)["country"];
    print(jsond);
    List<Album> allround = [];
    for (var o in jsond) {
      Album al = Album(
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
          o["year"],
          o["vaccitation"],
          o["refer"],
          o["images"]);
      allround.add(al);
    }
    print(allround);
    return allround;
  }
}

class Album {
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
  String? year;
  String? vaccitation;
  String? refer;
  String? images;

  Album(
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
    this.year,
    this.vaccitation,
    this.refer,
    this.images,
  );
}
