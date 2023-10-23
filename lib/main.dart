import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ubiqr/SelectingChild/Selecting.dart';
import 'package:ubiqr/login_main/bottom_nav_bar.dart';
import 'package:ubiqr/login_main/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var channel = const MethodChannel('updatappinapp');
  updateapp(){
    channel.invokeMapMethod('updatemyapp');
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateapp();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: Splash(),
      // home: BottomNavBar(),
    );
  }
}
