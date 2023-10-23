import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import "dart:io";

File file = File("");

class fpicker extends StatefulWidget {
  const fpicker({Key? key}) : super(key: key);

  @override
  State<fpicker> createState() => _file_pickerState();
}

class _file_pickerState extends State<fpicker> {
  FilePickerResult? result;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_outlined),
          ),
          title: const Text("File picker demo"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.file(file),
            TextButton(
                onPressed: () {
                  PicksFile();
                },
                child: const Text("Pick file"))
          ],
        ),
      ),
    );
  }

  void PicksFile() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.any);
    if (result != null) {
      setState(() {
        file = File(result.files.single.path ?? "");
      });
    }
  }
}
