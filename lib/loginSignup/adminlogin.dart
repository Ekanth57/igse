import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:igse/adminPages/adminHomePage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../commonWidgets/textField.dart';

class AdminLoginPage extends StatefulWidget {
  const AdminLoginPage({Key? key}) : super(key: key);

  @override
  State<AdminLoginPage> createState() => _AdminLoginPageState();
}

class _AdminLoginPageState extends State<AdminLoginPage> {
  String email='';
  String password='';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(750, 1334));

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:  [
              const Center(
                child: Text("Admin Login",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                  ),),
              ),
              MyTextFormField(
                isMandatory: false,
                opacity: 1,
                heading: "email",
                hintText: 'Enter Your Email Address',
                isEmail: true,
                textAction: TextInputAction.next,
                onchanged: (value) {
                  email=value!;
                },
                validator: (String? value){
                  return AdminEmailAndPasswordFieldValidate.validateEmail(value!);
                },

              ),



              MyTextFormField(
                isMandatory: false,
                opacity: 1,
                isPassword: true,
                heading: "password",
                hintText: 'Enter Your Password',
                textAction: TextInputAction.done,
                onchanged: (value) {
                  password=value!;
                },
                validator: (String? value) {
                  const pattern = r'[a-z]$';
                  RegExp regExp = new RegExp(pattern);
                  if (value!.isEmpty) {
                    return 'Please enter password';
                  } else if (!regExp.hasMatch(value)) {
                    return 'enter valid password';
                  }
                  return null;
                },
              ),
              GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    width: .8.sw,
                    height: .12.sw,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(const Radius.circular(50)),
                      color: Colors.red.shade200,
                    ),
                    child: Center(
                      child: Text(
                        'Login  ',
                        style: TextStyle(
                            color: Theme.of(context)
                                .textTheme
                                .headline6!
                                .color,
                            fontSize: 30.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                onTap: () async {
                  if (_formKey.currentState!.validate()) {
                    try {
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: email,
                        password:password,
                      ).then((value) async {
                        final prefs = await SharedPreferences.getInstance();
                        await prefs.setString('lastLogin', 'admin');
                         Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AdminHomePage()));
                      });
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        Fluttertoast.showToast(
                            msg: 'No admin found for this email.',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.TOP,
                            timeInSecForIosWeb: 1);
                      } else if (e.code == 'wrong-password') {

                        Fluttertoast.showToast(
                            msg: 'password is incorrect!',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.TOP,
                            timeInSecForIosWeb: 1);
                      }
                    }

                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}



class AdminEmailAndPasswordFieldValidate {
  static String? validateEmail(String value) {
    const pattern = r'gse@shangrila.gov.un';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return 'Please enter email';
    } else if (!regExp.hasMatch(value)) {
      return 'enter valid email address';
    }
    return null;
  }

  static String? validatePassword(String value) {
    const pattern = r'gse@energy';
    RegExp regExp = new RegExp(pattern);
    if (value.isEmpty) {
      return 'Please enter password';
    } else if (!regExp.hasMatch(value)) {
      return 'enter valid password';
    }
    return null;
  }
}