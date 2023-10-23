import 'dart:async';
import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ubiqr/Constant/base_url.dart';
class Slider_wer extends StatefulWidget {
  const Slider_wer({Key? key}) : super(key: key);

  @override
  State<Slider_wer> createState() => _Slider_werState();
}

class _Slider_werState extends State<Slider_wer> {







  @override
  void initState() {
    state();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 105,
        aspectRatio: 16/9,
        viewportFraction: 0.9,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        enlargeFactor: 0.3,
        scrollDirection: Axis.horizontal,
      ),
      items: state_data.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(width: 1,color: Colors.white),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(i["slider"]),
                  )
              ),

            );
          },
        );
      }).toList(),
    );
    // return Scaffold(
    //   body: Column(
    //     children: [
    //       SizedBox(
    //           height: 105,
    //           child: FutureBuilder<List<Alb>>(
    //               future: bowe(),
    //               builder: (context, snapshot) {
    //                 if (snapshot.hasError) print(snapshot.error);
    //                 return snapshot.hasData
    //                     ? PageView.builder(
    //                     itemCount: snapshot.data!.length,
    //                     controller: pageController,
    //                     onPageChanged: (index) {
    //                       pageNo = index;
    //                       setState(() {
    //                         lgth=snapshot.data!.length;
    //                       });
    //                       print(snapshot.data!.length);
    //                     },
    //                     itemBuilder: (_, index) {
    //                       return AnimatedBuilder(
    //                         animation: pageController,
    //                         builder: (context, child) {
    //                           return child!;
    //                         },
    //                         child: Container(
    //                           margin: const EdgeInsets.only(
    //                               right: 4, left: 4, top: 10, bottom: 10),
    //                           height: 105,
    //
    //                           decoration: BoxDecoration(
    //                               image: DecorationImage(
    //                                 image: NetworkImage(snapshot.data![index].slider),
    //                                 fit: BoxFit.cover,
    //                               ),
    //
    //                               borderRadius: BorderRadius.circular(18)),
    //                         ),
    //                       );
    //                     }
    //                 ):  Center(child: SizedBox(
    //
    //
    //                     child: Image.asset("assets/pics/load.gif"),
    //                   ),
    //                 );
    //               }
    //           )
    //       ),
    //     ],
    //   ),
    // );
  }


  List state_data = [];

  Future<String> state() async {
    final res = await http.get(
        Uri.parse(Apiconst.slider)
    );
    final resBody = json.decode(res.body)['id'];
    print("hhhhhhhhhhhhh");
    print(resBody);
    setState(() {
      state_data = resBody;
    });



    return "Sucess";
  }
}
// class Alb {
//   String slider;
//
//
//   Alb(this.slider);
//
// }
// Future<List<Alb>> bowe() async{
//   final response = await http.post(
//     Uri.parse(Apiconst.slider),
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//     body: jsonEncode(<String, String>{
//       // "hospital_id":"98"
//     }),
//
//   );
//
//   var jsond = json.decode(response.body)["id"];
//   print(jsond);
//   List<Alb> allround = [];
//   for (var o in jsond)  {
//     Alb al = Alb(
//       o["slider"],
//
//
//     );
//
//     allround.add(al);
//   }
//   return allround;
// }