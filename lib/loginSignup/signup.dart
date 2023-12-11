import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/utils.dart';
import 'package:igse/qrScan/qrScan.dart';

import '../commonWidgets/textField.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../homePage/presentation/homePage.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  String name='';
  String mailId='';
  String password='';
  String confirmPassword='';
  String address='';
  String selectedProperty='';
  String noOfRooms='';
  final code = TextEditingController();
  List<dynamic> voucherCodes=[];

  //TextEditingController code = TextEditingController(text: "");
  List<String> propertyType =['detached', 'semi-detached', 'terraced', 'flat', 'cottage', 'bungalow', 'mansion'];
  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    DocumentSnapshot documentSnapshot =
    await FirebaseFirestore.instance.collection('vouchers').doc('vouchers').get();
    voucherCodes=documentSnapshot.get('voucherDetails');
    print('printing voucher----------${voucherCodes.length}');
  }
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(750, 1334));

    WidgetsFlutterBinding.ensureInitialized();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:  [
                SizedBox(
                  height: .3.sw,
                ),
                const Center(
                  child: Text("Signup",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                    ),),
                ),
                MyTextFormField(
                  isMandatory: false,
                  opacity: 1,
                  heading: "Full Name",
                  hintText: 'Enter Your Full Name',
                  textAction: TextInputAction.next,
                  onchanged: (value) {
                    name=value!;
                  },
                  validator: (String? value) {
                    const pattern =
                        r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$";
                    RegExp regExp = new RegExp(pattern);
                    if (value!.isEmpty) {
                      return 'Enter Your Full Name';
                    } else if (!regExp.hasMatch(value)) {
                      return 'Please enter valid Full Name';
                    }
                    return null;
                  },
                ),
                MyTextFormField(
                  isMandatory: false,
                  opacity: 1,
                  heading: "email",
                  hintText: 'Enter Your Email Address',
                  isEmail: true,
                  textAction: TextInputAction.next,
                  onchanged: (value) {
                    mailId=value!;
                  },
                  validator: (String? value) {
                    const pattern =
                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                    RegExp regExp = new RegExp(pattern);
                    if (value!.isEmpty) {
                      return 'Enter Your Email Address';
                    } else if (!regExp.hasMatch(value)) {
                      return 'Please enter valid Email address';
                    }
                    return null;
                  },
                ),

                MyTextFormField(
                  isMandatory: false,
                  opacity: 1,
                  isPassword: true,
                  heading: "password",
                  hintText: 'Enter Your Password',
                  textAction: TextInputAction.next,
                  onchanged: (value) {
                    password=value!;
                  },
                  validator: (String? value) {
                    const pattern =
                        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                    RegExp regExp = new RegExp(pattern);
                    if (value!.isEmpty) {
                      return 'Please enter password';
                    } else if (!regExp.hasMatch(value)) {
                      return 'enter valid password';
                    }
                    return null;
                  },
                ),

                MyTextFormField(
                  isMandatory: false,
                  opacity: 1,
                  isPassword: true,
                  heading: "Confirm password",
                  hintText: 'Enter Your Password',
                  textAction: TextInputAction.next,
                  onchanged: (value) {
                    confirmPassword=value!;
                  },
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Enter Your password';
                    } else if (password!=confirmPassword) {
                      return 'passwords do not match';
                    }
                    return null;
                  },
                ),

                MyTextFormField(
                  isMandatory: false,
                  opacity: 1,
                  heading: "Full Address",
                  hintText: 'Enter Your Full Address',
                  textAction: TextInputAction.next,
                  onchanged: (value) {
                    address=value!;
                  },
                  validator: (String? value) {
                    const pattern =
                        r"^[#.0-9a-zA-Z\s,-]+$";
                    RegExp regExp = new RegExp(pattern);
                    if (value!.isEmpty) {
                      return 'Enter Your Full Address';
                    } else if (!regExp.hasMatch(value)) {
                      return 'Please enter valid Full Address';
                    }
                    return null;
                  },
                ),
              Container(
                alignment: Alignment.topLeft,
                child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                    child: Text('Property Type',
                      style:  TextStyle(
                        color: Colors.black,
                        fontSize: 30.sp,
                      )
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: InputDecorator(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(

                          borderRadius: BorderRadius.all(Radius.circular(30))
                      )
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      hint: selectedProperty.isEmpty
                          ? Text('Select Property Type')
                          : Text(
                        selectedProperty,
                        style: TextStyle(color: Colors.black),
                      ),
                      isDense:true,
                      isExpanded: true,
                      iconSize: 30.0,
                      style: TextStyle(color: Colors.black),
                      items: propertyType.map(
                            (val) {
                          return DropdownMenuItem<String>(
                            value: val,
                            child: Text(val),
                          );
                        },
                      ).toList(),
                      onChanged: (val) {
                        setState(
                              () {
                            selectedProperty = val.toString();
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
                MyTextFormField(
                  isMandatory: false,
                  opacity: 1,
                  heading: "Number of bedrooms",
                  hintText: 'Enter total number of bedrooms',
                  keyboardtype: TextInputType.number,
                  textAction: TextInputAction.next,
                  onchanged: (value) {
                    noOfRooms=value!;
                  },
                  validator: (String? value) {
                    const pattern =
                        r"^[0-9]+$";
                    RegExp regExp = new RegExp(pattern);
                    if (value!.isEmpty) {
                      return 'Enter total number of bedrooms';
                    } else if (!regExp.hasMatch(value)) {
                      return 'Please enter valid number';
                    }
                    return null;
                  },
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                    child: Text('Energy Voucher Codes',
                        style:  TextStyle(
                          color: Colors.black,
                          fontSize: 30.sp,
                        )
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Container(
                        width: .8.sw,
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: code,
                          style: TextStyle(
                              color: Theme.of(context).textTheme.bodyText1!.color,
                              fontWeight: FontWeight.w500,
                              fontFamily:
                              Theme.of(context).textTheme.subtitle1!.fontFamily,
                              fontStyle: FontStyle.normal,
                              fontSize: 15),
                          // inputFormatters: [
                          //   LengthLimitingTextInputFormatter(8),
                          // ],
                          decoration: InputDecoration(
                            //counterText: "",
                            contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                            errorBorder:  OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide:  BorderSide(color: Colors.red, width: 0.0),
                            ),
                            // focusedErrorBorder: new OutlineInputBorder(
                            //   borderSide: new BorderSide(color: Colors.red, width: 0.0),
                            // ),
                            suffixIconConstraints:
                            const BoxConstraints(minWidth: 23, maxHeight: 20),
                            errorStyle: TextStyle(
                                color: Colors.red,
                                fontSize: 12,
                                fontFamily:
                                Theme.of(context).textTheme.subtitle1!.fontFamily,
                                fontWeight: FontWeight.normal),
                            hintText: 'Enter Energy Voucher Codes or scan it',
                            hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
                            enabledBorder:  OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide:const BorderSide(
                                color: Colors.grey,
                                width: 0.0,
                              ),
                            ),
                            // border: const OutlineInputBorder(),
                          ),
                          onChanged: (value) {
                            print(code.text);
                            code.value.text!=value;
                          },
                          validator: (String? value) {
                            const pattern = r"^[a-zA-Z0-9]{5,15}.\*?$";
                            RegExp regExp = new RegExp(pattern);
                            if (value!.isEmpty) {
                              return 'Enter Energy Voucher Codes';
                            } else if (!regExp.hasMatch(value)) {
                              return 'Please enter valid Voucher Codes';
                            }
                            return null;
                          },

                        ),
                      ),
                    ),
                    Container(
                      child: IconButton(onPressed: () async {
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => QrScan()),
                        );
                        code.value.text!=result;
                        // setState(() {
                        //   print('printing resut---$result');
                        //   code=result;
                        // });
                      },
                        icon:Icon(Icons.qr_code_scanner_outlined),
                    ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child:GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        width: 0.8.sw,
                        height: .12.sw,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(const Radius.circular(50)),
                          color: Colors.green.shade200,
                        ),
                        child: Center(
                          child: Text(
                            'Sign up',
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
                    onTap: () async{
                      if (_formKey.currentState!.validate() ) {
                        if(selectedProperty.isEmpty){
                            Fluttertoast.showToast(
                                msg: "Please select property type.",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.TOP,
                                timeInSecForIosWeb: 1);
                        }else {
                          if (voucherCodes.contains(code.value.text)==true) {
                            Fluttertoast.showToast(
                                msg: "voucher code already in use",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.TOP,
                                timeInSecForIosWeb: 1);
                          }
                          else{
                            try {
                              await FirebaseAuth.instance.createUserWithEmailAndPassword(
                                  email: mailId,
                                  password: password
                              ).then((value) async {
                                var firebaseUser = FirebaseAuth.instance.currentUser;
                                await FirebaseFirestore.instance
                                    .collection('Users')
                                    .doc(firebaseUser!.uid)
                                    .set({'userId': firebaseUser.uid,
                                  'userDetails':{
                                    'userName':name,
                                    'email':mailId,
                                    'address':address,
                                    'propertyType':selectedProperty,
                                    'noOfRooms':noOfRooms,
                                    'initialVoucher':code.value.text,
                                    'voucherUsed':[code.value.text]
                                  },
                                  'previousBillingDate':Timestamp.now(),
                                  'previousMeterReadingsDay':"0",
                                  'previousMeterReadingsNight':"0",
                                  'previousMeterReadingsGas':"0",
                                  'totalCredits':200,
                                  'initialPaymentDone':false
                                }, SetOptions(merge: true)).then((value) async => {
                                  print('inside then statment----'),
                                voucherCodes.add(code.value.text),
                                await FirebaseFirestore.instance
                                    .collection('vouchers').doc('vouchers')
                                    .update({'voucherDetails':voucherCodes}),

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>  HomePage())),
                                });

                              }

                              );


                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'email-already-in-use') {
                                Fluttertoast.showToast(
                                    msg: "The account already exists for that email.",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.TOP,
                                    timeInSecForIosWeb: 1);
                              }
                            } catch (e) {
                              print(e);
                            }
                          }
                        }

                      }

                      // Navigator.push(
                      //     context, MaterialPageRoute(builder: (context) => const SignupPage()));
                    },
                  ),

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

