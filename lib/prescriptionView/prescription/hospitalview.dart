import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ubiqr/Constant/base_url.dart';
import 'package:ubiqr/Constant/colors.dart';
import 'package:ubiqr/prescriptionView/prescription/detail.dart';
import 'package:ubiqr/prescriptionView/prescription/zoom.dart';
import 'package:path_provider/path_provider.dart';



class View extends StatefulWidget {
  final Doctor raja;
  View({required  this.raja});
  @override
  State<View> createState() => _ViewState();
}

class _ViewState extends State<View> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: appb,
              // toolbarHeight: 55,
              leading: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    size: 25,
                    color: Colors.black,
                  )),
              title: const Text('Prescription Detail',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children:[
                        ElevatedButton.icon(
                          icon: Icon(Icons.share),
                          label: Text("Share", style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,fontWeight: FontWeight.bold
                          ),),

                            onPressed: () async {

                              leader(widget.raja.id.toString());
                              raja(context);
                              final snackBar = SnackBar(
                                elevation: 5,
                                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                                  behavior: SnackBarBehavior.floating,
                                content:  Text('Generating PDF!'),

                              );
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);

                            },

                          style: ElevatedButton.styleFrom(
                            primary: Colors.teal,
                            onPrimary: Colors.white,
                            shadowColor: Colors.red,
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),


                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      // padding:EdgeInsets.all(15),
                      width: double.infinity,
                      color: const Color(0xffBA68C8),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(top: 10, right: 20),
                            height: 50,
                            width: double.infinity,
                            alignment: Alignment.centerRight,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Image.asset(
                                    'assets/pics/logomain.png',
                                    height: 55,
                                  ),
                                ),
                                Text(
                                  'Date : ${widget.raja.date}',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            alignment: Alignment.center,
                            height: 35,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              color: colorA,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 5.0,
                                  spreadRadius: 0.0,
                                ),
                              ],
                            ),
                            child: Text(widget.raja.hospital_name.toString(),
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                          ),
                          const SizedBox(height: 15),
                          Container(
                            padding: const EdgeInsets.only(left: 20),
                            height: 40,
                            width: double.infinity,
                            child: Row(children: [
                              const Text(
                                'Doctor Name:   ',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                              Text(widget.raja.doctor_name.toString(),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                            ]),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 20),
                            height: 30,
                            width: double.infinity,
                            child: Row(children: [
                              const Text('Patient Name:   ',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  )),
                              Text(
                                widget.raja.s_id.toString(),
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ]),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 20),
                            height: 30,
                            width: double.infinity,
                            child: Row(children: [
                              const Text(
                                'Subject:   ',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(width: 43),
                              Text(
                                widget.raja.subject.toString(),
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ]),
                          ),
                          const SizedBox(height: 30),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => zoompic(
                                            image: widget.raja.images.toString(),
                                          )));
                            },
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height*0.4,
                              width:MediaQuery.of(context).size.width*0.8,
                              child: Image.network(
                                widget.raja.images.toString(),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            )));
  }
  var map;
  Future leader(String id) async{
    final response = await http.post(
      Uri.parse('https://ubiqcure.in/admin/pdf/index.php?id=$id'),

    );
    var data = jsonDecode(response.body);
    print(data);
    if (data['status'] == '200') {
      setState(() {
        map=json.decode(response.body);
      });
      pdfcreate();
    }
  }
  pdfcreate() async{
    final dl=map==null?'':map['pdfimage'].toString();
    final imageurl = dl;

    final uri = Uri.parse(imageurl);
    final response = await http.get(uri);
    final bytes = response.bodyBytes;
    final temp = await getTemporaryDirectory();
    final path = '${temp.path}/Ubiqr Uploaded Prescription.pdf';
    File(path).writeAsBytesSync(bytes);
    await Share.shareFiles([path], text: 'Image Shared');
  }
  raja(BuildContext context) {
    map == null? CircularProgressIndicator(): map['status'] == '200'? Navigator.pop(context):
    CircularProgressIndicator();
  }
}


