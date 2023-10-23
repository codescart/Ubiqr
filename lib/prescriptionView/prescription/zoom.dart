import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:ubiqr/Constant/colors.dart';

class zoompic extends StatefulWidget {
  final String image;
  const zoompic({super.key, required this.image});

  @override
  State<zoompic> createState() => _zoompicState();
}

class _zoompicState extends State<zoompic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Padding(
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
        ),
        child: PhotoView(
          backgroundDecoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          // minScale: 100,
          imageProvider: NetworkImage(
            widget.image,
          ),
        ),
      ),

    );
  }
}
