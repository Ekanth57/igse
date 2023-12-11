import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:igse/homePage/presentation/homePage.dart';
import 'package:lottie/lottie.dart';

class BookingSuccessPage extends StatefulWidget {

  @override
  _BookingSuccessPageState createState() => _BookingSuccessPageState();
}

class _BookingSuccessPageState extends State<BookingSuccessPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
        const Duration(seconds: 2),
            () {

              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const HomePage()));
        });
  }
  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();

    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              SizedBox(height: .5.sw),
              Container(
                width: 1.sw,
                height: 1.sw,
                child: Container(
                  margin: EdgeInsets.all(4),
                  child: Lottie.asset(
                    'assets/images/tickMark.json',
                    width: 250,
                    height: 250,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Center(
                child: Text(
                  "payment Successful",
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 40.sp,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          // bottomNavigationBar: GestureDetector(
          //     child: Padding(
          //       padding: const EdgeInsets.symmetric(
          //           vertical: 30, horizontal: 40),
          //       child: Container(
          //         width: .6.sw,
          //         height: .12.sw,
          //         decoration: const BoxDecoration(
          //           borderRadius:
          //           BorderRadius.all(Radius.circular(50)),
          //           color: Colors.black,
          //         ),
          //         child: Center(
          //           child: Text(
          //             'Done',
          //             style: TextStyle(
          //                 color: Colors.white,
          //                 fontSize: 30.sp,
          //                 fontWeight: FontWeight.bold),
          //           ),
          //         ),
          //       ),
          //     ),
          //     onTap: () async {
          //
          //     }),
        ));
  }
}

