import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:sms_otp_auto_verify/sms_otp_auto_verify.dart';
import 'package:ubiqr/SelectingChild/Selecting.dart';
import 'package:ubiqr/login_main/bottom_nav_bar.dart';
import 'package:ubiqr/login_main/login_page.dart';

import '../Constant/colors.dart';

//import '../models/common_functions.dart';
//import '../models/login_model.dart';

class OTPScreens extends StatefulWidget {
  final String phone;
  const OTPScreens({required this.phone});

  @override
  _OTPScreensState createState() => _OTPScreensState();
}

class _OTPScreensState extends State<OTPScreens> {
  final int _otpCodeLength = 6;
  bool _isLoadingButton = false;
  bool _enableButton = false;
  String _otpCode = "";
  // final _scaffoldKey = GlobalKey<ScaffoldState>();
  final intRegex = RegExp(r'\d+', multiLine: true);
  TextEditingController textEditingController = TextEditingController(text: "");
  // final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  String _verificationCode = "";

  @override
  void initState() {
    super.initState();
    super.initState();
    // loginRequestModel = LoginRequestModel();
    _verifyPhone();
    _getSignatureCode();
    _startListeningSms();
  }

  @override
  void dispose() {
    super.dispose();
    SmsVerification.stopListening();
  }

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: Theme.of(context).primaryColor),
      borderRadius: BorderRadius.circular(15.0),
    );
  }

  /// get signature code
  _getSignatureCode() async {
    String? signature = await SmsVerification.getAppSignature();
    print("signature $signature");
  }

  /// listen sms
  _startListeningSms() {
    print("lllllllllll");
    SmsVerification.startListeningSms().then((message) {
      setState(() {
        _otpCode = SmsVerification.getCode(message, intRegex);
        textEditingController.text = _otpCode;
        _onOtpCallBack(_otpCode, true);
      });
    });
  }

  _onSubmitOtp() async {
    setState(() {
      _isLoadingButton = !_isLoadingButton;
      _verifyOtpCode();
    });
  }

  _onClickRetry() {
    _startListeningSms();
  }

  _onOtpCallBack(String otpCode, bool isAutofill) async {
    setState(() {
      _otpCode = otpCode;
      if (otpCode.length == _otpCodeLength && isAutofill) {
        _enableButton = false;

        _isLoadingButton = true;
        _verifyOtpCode();
      } else if (otpCode.length == _otpCodeLength && !isAutofill) {
        _enableButton = true;
        _isLoadingButton = false;
      } else {
        _enableButton = false;
      }
    });
  }

  _verifyOtpCode() async {
    FocusScope.of(context).requestFocus(FocusNode());
    Timer(const Duration(milliseconds: 4000), () async {
      setState(() {
        _isLoadingButton = false;
        _enableButton = false;
      });

      try {
        await FirebaseAuth.instance
            .signInWithCredential(PhoneAuthProvider.credential(
                verificationId: _verificationCode, smsCode: _otpCode))
            .then((value) async {
          if (value.user != null) {
            final prefs1 = await SharedPreferences.getInstance();
            final key1 = 'mobile';
            final mobile = widget.phone;
            prefs1.setString(key1, mobile);

            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => Select()));
          }
        });
      } catch (e) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.toString())));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(backgroundColor: Colors.white,
      leading: IconButton(icon: Icon(Icons.arrow_back_ios_new,color:Colors.black),onPressed: (){
        Navigator.of(context).pop();
      },),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    height: 40,
                  ),
                  const SizedBox(
                    height: 200,
                    width: 200,
                    child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage(
                          'assets/pics/logomain.png',
                        )),
                  ), // SizedBox(
                  //   height: 20.h,
                  // ),.
                  const SizedBox(
                    height: 70,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "OTP Verification to this number  ${widget.phone}",
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                          color:appb,
                          onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>login()));


                      }, icon:Icon(Icons.edit)),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  TextFieldPin(
                      textController: textEditingController,
                      autoFocus: true,
                      codeLength: _otpCodeLength,
                      alignment: MainAxisAlignment.center,
                      defaultBoxSize: 40.0,
                      margin: 5,
                      selectedBoxSize: 40.0,
                      textStyle: const TextStyle(fontSize: 20),
                      defaultDecoration: _pinPutDecoration.copyWith(
                          border: Border.all(
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.6))),
                      selectedDecoration: _pinPutDecoration,
                      onChange: (code) {
                        _onOtpCallBack(code, false);
                      }),
                  const SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: MaterialButton(
                        onPressed: _enableButton ? _onSubmitOtp : null,
                        color: Colors.green,
                        disabledColor: Colors.purple,
                        child: Column(
                          children: [
                            _setUpButtonChild(),
                          ],
                        )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _verifyPhone() async {
    print("ffffffffffffffddddddddd");
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+91${widget.phone}',
      verificationCompleted: (PhoneAuthCredential credential) async {
        final prefs1 = await SharedPreferences.getInstance();
        final key1 = 'mobile';
         final mobile = "${widget.phone}";
        prefs1.setString(key1, mobile);
        // Navigator.of(context).pushReplacement(
        //     MaterialPageRoute(builder: (context) => const TabsScreen()));
      },
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {
        setState(() {
          _verificationCode = verificationId;
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );

  }

  Widget _setUpButtonChild() {
    if (_isLoadingButton) {
      return const SizedBox(
        width: 19,
        height: 19,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      );
    } else {
      return const Text(
        "Verify",
        style: TextStyle(color: Colors.white),
      );
    }
  }
}



