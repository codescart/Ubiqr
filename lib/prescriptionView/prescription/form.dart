

import 'dart:io';

// import 'package:fire_uber_customer/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ubiqr/Constant/base_url.dart';

class UpdateProfile extends StatefulWidget {
  final String type;
  UpdateProfile({ required this.type});
  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}


class _UpdateProfileState extends State<UpdateProfile> {
  @override
  void initState() {

    super.initState();
    Future<void> _selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: selectedDate,
          firstDate: DateTime(2015, 8),
          lastDate: DateTime(2101));
      if (picked != null && picked != selectedDate) {
        setState(() {
          selectedDate = picked;
        });
      }
    }
  }

  DateTime selectedDate = DateTime.now();
  final TextEditingController hospital_name = TextEditingController();
  final TextEditingController doctor_name = TextEditingController();
  final TextEditingController subject = TextEditingController();
  final TextEditingController date = TextEditingController();



  @override
  void dispose() {
    hospital_name.dispose();
    doctor_name.dispose();
    subject.dispose();
    date.dispose();
    super.dispose();
  }
  InputDecoration getInputDecoration(String hintext, IconData iconData) {
    return InputDecoration(
      counter: Offstage(),

      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
        borderSide: BorderSide(color: Colors.white, width: 2),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
        borderSide: BorderSide(color: Colors.white, width: 2),
      ),
      border: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.all(
          Radius.circular(12.0),
        ),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
        borderSide: BorderSide(color: Color(0xFFF65054)),
      ),
      errorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
        borderSide: BorderSide(color: Color(0xFFF65054)),
      ),
      filled: true,
      prefixIcon: Icon(
        iconData,
       // color: kTextLowBlackColor,
      ),
      hintStyle: const TextStyle(color: Colors.black54, fontSize: 14),
      hintText: hintext,
     // fillColor: kBackgroundColor,
      contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 15),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffBA68C8),
        title: Image.asset(
          'assets/pics/textlogo.png',
          width: 120,
        ),
        centerTitle: true,
      ),
      body: pj(),
    );
  }
pj(){
 return SingleChildScrollView(
    child: Column(
      children: [
        const SizedBox(
          height: 40,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 17.0, bottom: 5.0),
            child: Text(
              'Hospital Name',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: 15.0, top: 0.0, right: 15.0, bottom: 8.0),
          child: TextFormField(
            style: const TextStyle(fontSize: 14),
            decoration: getInputDecoration(
              'Hospital Name',
              Icons.local_hospital_outlined,
            ),
            controller: hospital_name,
            // keyboardType: TextInputType.name,

          ),
        ),
        SizedBox(
          height: 15,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 17.0, bottom: 5.0),
            child: Text(
              'Doctor Name',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: 15.0, top: 0.0, right: 15.0, bottom: 8.0),
          child: TextFormField(
            style: const TextStyle(fontSize: 14),
            decoration: getInputDecoration(
              'Doctor Name',
              Icons.medical_information_outlined,
            ),
            controller: doctor_name,
            keyboardType: TextInputType.name,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 17.0, bottom: 5.0),
            child: Text(
              'Prescription',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: 15.0, top: 0.0, right: 15.0, bottom: 8.0),
          child: TextFormField(
            style: const TextStyle(fontSize: 14),
            decoration: getInputDecoration(
              'Prescription',
              Icons.subject_outlined,
            ),

            controller: subject,
            keyboardType: TextInputType.multiline,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 17.0, bottom: 5.0),
            child: Text(
              'Date',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: 15.0, top: 0.0, right: 15.0, bottom: 8.0),
          child: TextFormField(
            readOnly: true,
            onTap: () async {
              DateTime? pickeddate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101))
                  .then((pickeddate) {
                if (pickeddate != null) {
                  setState(() {
                    selectedDate = pickeddate;
                    date.text =
                    "${selectedDate.toLocal()}".split(' ')[0];
                  });
                }
                return null;
              });
            },
            controller: date,
            // keyboardType: TextInputType.number,
            style: const TextStyle(fontSize: 14),
            decoration: getInputDecoration(
              'Date',
              Icons.calendar_month,
            ),
          ),
        ),

        const SizedBox(
          height: 15,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 17.0, bottom: 5.0),
            child: Text(
              'Document',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        Stack(
          children: [
            filee == null
                ? InkWell(
              onTap: () {
                _choosee();
              },
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, top: 0.0, right: 15.0, bottom: 8.0),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xFFF0f0f0),
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ), //Border.all
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10.0,top: 10),
                          child: Row(
                            children: [
                              Icon(Icons.note_add_outlined,size: 22,color: Colors.black54,),
                              SizedBox(width: 10,),

                              Text('Upload your Document',
                                style: TextStyle(color:Colors.black45, ),),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
                : Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, top: 0.0, right: 15.0, bottom: 8.0),
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFFF0f0f0),
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ), //Border.all
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 10.0,right: 10),
                  child: Row(
                    children: [


                      Text('Document Uploded',
                        style: TextStyle(color:Colors.black45, ),),
                      Spacer(),
                      Icon(Icons.verified_outlined,size: 22,color: Colors.green,),
                    ],
                  ),
                ),
              ),
            ),

            Center(
              child: IconButton(
                onPressed: () {
                  _choosee();
                },
                icon: const Icon(
                  Icons.add_a_photo,
                  size: 20,
                  color: Colors.transparent,
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 40,
        ),
        Container(
          height: 40,
          width: 350,
          decoration: const BoxDecoration(
            color: Colors.transparent,
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                offset: Offset(5.0, 5.0),
                blurRadius: 15.0,
                spreadRadius: 0.0,
              ),
            ],
          ),
          child: TextButton(
            onPressed: () {
              // _uploadImage();
              uploadImage(
                // name.text,
                hospital_name.text,
                doctor_name.text,
                subject.text,
                date.text,

              );
              Navigator.of(context).pop();
            },
            style: TextButton.styleFrom(
                backgroundColor: const Color(0xffBA68C8),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            child: const Text('SUBMIT',
                style: TextStyle(color: Colors.white)),
          ),
        ),
        //column
      ],
    ),
  );
}
    Future<void> uploadImage(
    String hospitalName,
    String doctorName,
    String subject,
    String date,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final vals = prefs.getString('id') ?? "0";
    final mobile = prefs.getString('mobile') ?? "0";
    print(vals);

    print("vvvvvvvvv");
    var stream = http.ByteStream(filee!.openRead());
    stream.cast();
    var length = await filee!.length();
    var uri = Uri.parse(Apiconst.formurl+Apiconst.UPLOAD_PRESC);
    var request = http.MultipartRequest('POST', uri);
    request.fields['mobile'] = mobile;
    request.fields['hospital_name'] = hospitalName;
    request.fields['doctor_name'] = doctorName;
    request.fields['subject'] = subject;
    request.fields['date'] = date;
    request.fields["s_id"] = vals;
    request.fields["type"] = widget.type;
    var multiport = http.MultipartFile('sendimage', stream, length,
        filename: (filee!.path));
    request.files.add(multiport);
    var response = await request.send();
    print(response);
    if (response.statusCode == 200) {
      print("aaaaaaaaaa");
    } else {
      print("bbbb");
    }
  }

  File? filee;
  final pickerr = ImagePicker();

  void _choosee() async {
    final pickedFile = await pickerr.getImage(
        source: ImageSource.gallery,
       // imageQuality: 100,
       //  maxHeight: 500,
       //  maxWidth: 500
    );
    setState(() {
      if (pickedFile != null) {
        filee = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }


}
