import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../injection.dart';
import '../../loginSignup/welcomePage.dart';
import '../../previousBills/presentation/previousBillingPage.dart';
import '../../qrScan/scanner.dart';
import '../application/userDetails_watcher/user_details_watcher_bloc.dart';
import 'bookingSuccessfullPgae.dart';
import 'package:uuid/uuid.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool billing=false;
  String voucherCode='';
  String eDay='0';
  String eNight='0';
  String gas='0';
  final _formKey = GlobalKey<FormState>();
  double priceDay=0.34;
  double priceNight=0.2;
  double priceGas=0.1;
  double priceStandingCharge=0.74;

  double totalEDay=0;
  double totalENight=0;
  double totalGas=0;
  double totalStandingCharge=0;
  double totalPrice=0;

  int previousMRDay=0;
  int previousMRNight=0;
  int previousGasReadings=0;
  Map<String,dynamic> price={};
  List<dynamic> voucherCodes=[];
  final scannerCode = TextEditingController();

  //TextEditingController scannerCode = TextEditingController(text: "");
  User? firebaseUser = FirebaseAuth.instance.currentUser;
  bool initial=true;
  @override
  void initState() {
    getData();
    getBill();
    super.initState();
  }

  getData() async {
    DocumentSnapshot documentSnapshot =
    await FirebaseFirestore.instance.collection('vouchers').doc('vouchers').get();
    voucherCodes=documentSnapshot.get('voucherDetails');
    print('printing voucher----------${voucherCodes.length}');
  }


  getBill() async {
    DocumentSnapshot documentSnapshot =
    await FirebaseFirestore.instance.collection('setPrice').doc('price').get();
    price=documentSnapshot.get('setPrice');
    price.forEach((key, value) {
      setState(() {
        if(key=='ElectricityDay'){
          priceDay=double.parse(value.toString());
        }
        if(key=='ElectricityNight'){
          priceNight=double.parse(value.toString());
        }
        if(key=='StandingCharge'){
           priceStandingCharge=double.parse(value.toString());
        }
        if(key=='gas'){
          priceGas=double.parse(value.toString());
        }
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    User? firebaseUser = FirebaseAuth.instance.currentUser;

    return MultiBlocProvider(
        providers: [
          BlocProvider<UserDetailsWatcherBloc>(
            create: (context) => getIt<UserDetailsWatcherBloc>()
              ..add( UserDetailsWatcherEvent.watchAllStarted(firebaseUser!.uid)),
          ),
        ],
        child: BlocBuilder<UserDetailsWatcherBloc, UserDetailsWatcherState>(
          builder: (context, state) {
            return state.map(
              initial: (_) {
                return Container(
                  width: 1.sw,
                  height: 1.sw,
                  color: Colors.white,
                );
              },
              loadInProgress: (_) => const Center(
                child: CircularProgressIndicator(color: Colors.blue,),
              ),
              loadSuccess: (state) {
                print('load success---------');
                if(initial){
                  eDay=state.userDetailsList.previousMeterReadingsDay!;
                  eNight=state.userDetailsList.previousMeterReadingsNight!;
                  gas=state.userDetailsList.previousMeterReadingsGas!;
                  initial=false;
                }
                previousMRDay=int.parse(state.userDetailsList.previousMeterReadingsDay!);
                previousMRNight=int.parse(state.userDetailsList.previousMeterReadingsNight!);
                previousGasReadings=int.parse(state.userDetailsList.previousMeterReadingsGas!);
                return WillPopScope(
                  onWillPop: ()async{
                    return false;
                  },
                  child: Scaffold(
                    resizeToAvoidBottomInset: false,
                    appBar: AppBar(
                      centerTitle: true,
                      title: const Text('IGSE',
                        style: TextStyle(
                            color: Colors.black
                        ),),
                      backgroundColor: Colors.white,
                      actions: [
                        Padding(
                          padding:const EdgeInsets.all(6),
                          child: GestureDetector(
                            onTap: ()async {
                              final prefs = await SharedPreferences.getInstance();
                              final success = await prefs.remove('lastLogin');
                              await FirebaseAuth.instance.signOut().then((value) {

                                Navigator.push(
                                    context, MaterialPageRoute(builder: (context) => const WelcomePage()));
                              });

                            },
                            child:const Icon(
                              Icons.logout,

                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    body: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10,),
                          Center(
                            child: GestureDetector(
                              child: Container(
                                width: .5.sw,
                                height: .1.sw,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        spreadRadius: 3,
                                        blurRadius: 5,
                                        offset: Offset(0, 4), // changes position of shadow
                                      ),
                                    ]),
                                child:  Center(child: Text('Credit Balance: ${state.userDetailsList.totalCredits!.toStringAsFixed(2)}£',
                                  style: const TextStyle(
                                    fontSize:16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )),
                              ),
                              onTap: (){
                                scannerCode.clear();
                                topUp(context,state.userDetailsList.totalCredits!);
                              },
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Padding(
                            padding: EdgeInsets.all(10),
                            child: Text('Electricity and gas meter readings',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                child: Container(
                                  width: .3.sw,
                                  height: .3.sw,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.2),
                                          spreadRadius: 3,
                                          blurRadius: 5,
                                          offset: Offset(0, 4), // changes position of shadow
                                        ),
                                      ]),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children:  [
                                      const Text('Meter Readings -\nDay',
                                      textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w500
                                        ),
                                      ),
                                      Text(eDay,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 30
                                      ),
                                      ),
                                      Text('kwh'),
                                    ],
                                  ),
                                ),
                                onTap: (){
                                  showAlertDialog(context,state.userDetailsList.initialPaymentDone!,state.userDetailsList.previousBillingDate!);
                                },
                              ),
                              GestureDetector(
                                child: Container(
                                  width: .3.sw,
                                  height: .3.sw,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.2),
                                          spreadRadius: 3,
                                          blurRadius: 5,
                                          offset: Offset(0, 4), // changes position of shadow
                                        ),
                                      ]),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children:  [
                                      const Text('Meter Readings -\nNight',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w500
                                        ),
                                      ),
                                      Text(eNight,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 30
                                        ),
                                      ),
                                      Text('kwh'),
                                    ],
                                  ),
                                ),
                                onTap: (){
                                  showAlertDialog(context,state.userDetailsList.initialPaymentDone!,state.userDetailsList.previousBillingDate!);
                                },
                              ),
                              GestureDetector(
                                child: Container(
                                  width: .3.sw,
                                  height: .3.sw,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.2),
                                          spreadRadius: 3,
                                          blurRadius: 5,
                                          offset: Offset(0, 4), // changes position of shadow
                                        ),
                                      ]),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children:  [
                                      const Text('Gas Meter -\nreadings',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w500
                                        ),
                                      ),
                                      Text(gas,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 30
                                        ),
                                      ),
                                      Text('kwh'),
                                    ],
                                  ),
                                ),
                                onTap: (){
                                  showAlertDialog(context,state.userDetailsList.initialPaymentDone!,state.userDetailsList.previousBillingDate!);
                                },
                              ),
                            ],
                          ),
                          Visibility(
                            visible: billing,
                            child: const Padding(
                              padding: EdgeInsets.all(10),
                              child: Text('Billing'),
                            ),
                          ),
                          Visibility(
                            visible: billing,
                            child: Center(
                              child: Container(
                                width: 0.9.sw,
                                height: .55.sw,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        spreadRadius: 3,
                                        blurRadius: 5,
                                        offset: Offset(0, 4),

                                      ),
                                    ]),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Container(
                                child: Row(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                  MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Container(
                                        width: .65.sw,
                                        height: .07.sw,
                                        child: Text('Electricity(Day)/kwh (${priceDay}£)',
                                          maxLines: 2,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 0),
                                      child: Container(
                                        height: .07.sw,
                                        child: Text(
                                          ':  ${totalEDay.toStringAsFixed(2)}£',
                                          maxLines: 2,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: Row(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(left: 10),
                                                child: Container(
                                                  width: .65.sw,
                                                  height: .07.sw,
                                                  child: Text('Electricity(Night)/kwh (${priceNight}£)',
                                                    maxLines: 2,
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(top: 0),
                                                child: Container(
                                                  height: .07.sw,
                                                  child: Text(
                                                    ':  ${totalENight.toStringAsFixed(2)}£',
                                                    maxLines: 2,
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: Row(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(left: 10),
                                                child: Container(
                                                  width: .65.sw,
                                                  height: .07.sw,
                                                  child: Text('gas/kwh (${priceGas}£)',
                                                    maxLines: 2,
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(top: 0),
                                                child: Container(
                                                  height: .07.sw,
                                                  child: Text(
                                                    ':  ${totalGas.toStringAsFixed(2)}£',
                                                    maxLines: 2,
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: Row(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(left: 10),
                                                child: Container(
                                                  width: .65.sw,
                                                  height: .07.sw,
                                                  child: Text('standing charge/day (${priceStandingCharge}£) ',
                                                    maxLines: 2,
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(top: 0),
                                                child: Container(
                                                  height: .07.sw,
                                                  child: Text(
                                                    ':  ${(totalStandingCharge).toStringAsFixed(2)}£',
                                                    maxLines: 2,
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),

                                      ],
                                    ),
                                    const Center(child: Text('-----------------------------------------------------------',
                                    style: TextStyle(color: Colors.grey),
                                    ),),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: Row(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(left: 10),
                                                child: Container(
                                                  width: .65.sw,
                                                  height: .07.sw,
                                                  child: const Text('Total Price',
                                                    maxLines: 2,
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(top: 0),
                                                child: Container(
                                                  height: .07.sw,
                                                  child: Text(
                                                    ':  ${totalPrice.toStringAsFixed(2)}£',
                                                    maxLines: 2,
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),

                                      ],
                                    ),
                                    Center(
                                      child: GestureDetector(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              width: .5.sw,
                                              height: .08.sw,
                                              decoration: const BoxDecoration(
                                                borderRadius:
                                                BorderRadius.all(Radius.circular(50)),
                                                color: Colors.black,
                                              ),
                                              child: Center(
                                                child: Text(
                                                  'Pay ${totalPrice.toStringAsFixed(2)}',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 30.sp,
                                                      fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                          ),
                                          onTap: () async {
                                            if((state.userDetailsList.totalCredits! - totalPrice)<0){
                                              Fluttertoast.showToast(
                                                  msg: "Not enough credit",
                                                  toastLength: Toast.LENGTH_SHORT,
                                                  gravity: ToastGravity.TOP,
                                                  timeInSecForIosWeb: 1);
                                            }else{
                                              await FirebaseFirestore.instance
                                                  .collection('Users')
                                                  .doc(firebaseUser!.uid)
                                                  .set({
                                                'initialPaymentDone':true,
                                                'totalCredits':(state.userDetailsList.totalCredits!- totalPrice),
                                                'previousMeterReadingsDay':eDay,
                                                'previousMeterReadingsNight':eNight,
                                                'previousMeterReadingsGas':gas,
                                                'previousBillingDate':Timestamp.now(),
                                              }, SetOptions(merge: true));
                                              await FirebaseFirestore.instance
                                                  .collection('Users')
                                                  .doc(firebaseUser.uid).collection('billing').doc(Uuid().v4())
                                                  .set({
                                                'totalPrice':totalPrice,
                                                'billingTime':DateTime.now(),
                                                'meterReadings':{
                                                  'previousMeterReadingsDay':eDay,
                                                  'previousMeterReadingsNight':eNight,
                                                  'previousMeterReadingsGas':gas,
                                                },
                                                'tariffDetails':{
                                                  'tariffDay':priceDay,
                                                  'tariffNight':priceNight,
                                                  'tariffGas':priceGas,
                                                  'tariffStandingCharge':priceStandingCharge,
                                                },
                                                'totalPriceDetails':{
                                                  'totalEDay':totalEDay,
                                                  'totalENight':totalENight,
                                                  'totalGas':totalGas,
                                                  'totalStandingCharge':totalStandingCharge,
                                                }
                                              }, SetOptions(merge: true));
                                              await FirebaseFirestore.instance
                                                  .collection('Billing')
                                                  .doc(Uuid().v4())
                                                  .set({
                                                'userId':firebaseUser.uid,
                                                'totalPrice':totalPrice,
                                                'billingTime':DateTime.now(),
                                                'meterReadings':{
                                                  'previousMeterReadingsDay':eDay,
                                                  'previousMeterReadingsNight':eNight,
                                                  'previousMeterReadingsGas':gas,
                                                },
                                                'tariffDetails':{
                                                  'tariffDay':priceDay,
                                                  'tariffNight':priceNight,
                                                  'tariffGas':priceGas,
                                                  'tariffStandingCharge':priceStandingCharge,
                                                },
                                                'totalPriceDetails':{
                                                  'totalEDay':totalEDay,
                                                  'totalENight':totalENight,
                                                  'totalGas':totalGas,
                                                  'totalStandingCharge':totalStandingCharge,
                                                }
                                              }, SetOptions(merge: true));
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context) => BookingSuccessPage()),
                                              );
                                            }

                                          }),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(10),
                            child: Text('Previous bills'),
                          ),
                          Container(child: PreviousBills()),
                        ],
                      ),
                    ),
                  ),
                );

              },
              loadFailure: (state) {
                return Container(
                  width: 1.sw,
                  height: 1.sw,
                  color: Colors.amber,
                );
              },
            );
          },
        )

    );
  }
  showAlertDialog(BuildContext context,bool initialPaymentDone, Timestamp previousBillingDate) {

    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.of(context, rootNavigator: true)
            .pop();
      },
    );
    Widget continueButton = TextButton(
      child: Text("submit"),
      onPressed: () {
        print("-------------------${initialPaymentDone}");

        if(_formKey.currentState!.validate()){
          setState(() {
            totalEDay=priceDay*(int.parse(eDay)-previousMRDay);
            print(totalEDay);

            totalENight=priceNight*(int.parse(eNight)-previousMRNight);
            totalGas=priceGas*(int.parse(gas)-previousGasReadings);
            if(initialPaymentDone==false){
              totalStandingCharge=0;
            }else{
              final differenceInDays = DateTime.now().difference(previousBillingDate.toDate()).inDays;
              totalStandingCharge=priceStandingCharge*differenceInDays;
            }
            //totalStandingCharge=priceStandingCharge*30;
            totalPrice=totalEDay+totalENight+totalGas+totalStandingCharge;
            billing=true;
          });
          Navigator.of(context, rootNavigator: true)
              .pop();
        }
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius:
          BorderRadius.all(Radius.circular(32.0))),
      content: Container(
        width: 0.9.sw,
        height: 0.85.sw,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Electricity meter reading - Day(in kwh)',
              style: TextStyle(
                fontSize: 15,
              ),
              ),
              SizedBox(height: 5,),
              TextFormField(
                initialValue: eDay,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                style: TextStyle(
                    color: Theme.of(context).textTheme.bodyText1!.color,
                    fontWeight: FontWeight.w500,
                    fontFamily:
                    Theme.of(context).textTheme.subtitle1!.fontFamily,
                    fontStyle: FontStyle.normal,
                    fontSize: 15),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  errorBorder:  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide:  BorderSide(color: Colors.red, width: 0.0),
                  ),
                  suffixIconConstraints:
                  const BoxConstraints(minWidth: 23, maxHeight: 20),
                  errorStyle: TextStyle(
                      color: Colors.red,
                      fontSize: 12,
                      fontFamily:
                      Theme.of(context).textTheme.subtitle1!.fontFamily,
                      fontWeight: FontWeight.normal),
                  hintText: 'Enter meter reading',
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
                  eDay=value;
                },
                validator: (String? value) {
                  const pattern =
                      r"^[0-9]+$";
                  RegExp regExp = new RegExp(pattern);
                  if (value!.isEmpty) {
                    return 'Enter meter readings';
                  } else if (!regExp.hasMatch(value))
                  {
                    return 'Please enter valid meter readings';
                  }
                  else if(int.parse(value)<=previousMRDay)
                  {
                    return 'value should be greater then previous readings';
                  }
                  return null;
                },

              ),
              SizedBox(height: 0.08.sw),
              Text('Electricity meter reading - Night(in kwh)',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              SizedBox(height: 5,),
              TextFormField(
                initialValue: eNight,
                keyboardType: TextInputType.number,

                textInputAction: TextInputAction.next,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                style: TextStyle(
                    color: Theme.of(context).textTheme.bodyText1!.color,
                    fontWeight: FontWeight.w500,
                    fontFamily:
                    Theme.of(context).textTheme.subtitle1!.fontFamily,
                    fontStyle: FontStyle.normal,
                    fontSize: 15),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  errorBorder:  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide:  BorderSide(color: Colors.red, width: 0.0),
                  ),
                  suffixIconConstraints:
                  const BoxConstraints(minWidth: 23, maxHeight: 20),
                  errorStyle: TextStyle(
                      color: Colors.red,
                      fontSize: 12,
                      fontFamily:
                      Theme.of(context).textTheme.subtitle1!.fontFamily,
                      fontWeight: FontWeight.normal),
                  hintText: 'Enter meter reading',
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
                  eNight=value;
                },
                validator: (String? value) {
                  const pattern =
                      r"^[0-9]+$";
                  RegExp regExp = new RegExp(pattern);
                  if (value!.isEmpty) {
                    return 'Enter meter readings';
                  } else if (!regExp.hasMatch(value)) {
                    return 'Please enter valid meter readings';
                  }else if(int.parse(value)<=previousMRNight)
                  {
                    return 'value should be greater then previous readings';
                  }
                  return null;
                },

              ),
              SizedBox(height: 0.08.sw),
              Text('Gas meter reading(in kwh)',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              SizedBox(height: 5,),
              TextFormField(
                initialValue: gas,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                style: TextStyle(
                    color: Theme.of(context).textTheme.bodyText1!.color,
                    fontWeight: FontWeight.w500,
                    fontFamily:
                    Theme.of(context).textTheme.subtitle1!.fontFamily,
                    fontStyle: FontStyle.normal,
                    fontSize: 15),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  errorBorder:  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide:  BorderSide(color: Colors.red, width: 0.0),
                  ),
                  suffixIconConstraints:
                  const BoxConstraints(minWidth: 23, maxHeight: 20),
                  errorStyle: TextStyle(
                      color: Colors.red,
                      fontSize: 12,
                      fontFamily:
                      Theme.of(context).textTheme.subtitle1!.fontFamily,
                      fontWeight: FontWeight.normal),
                  hintText: 'Enter meter reading',
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
                  gas=value;
                },
                validator: (String? value) {
                  const pattern =
                      r"^[0-9]+$";
                  RegExp regExp = new RegExp(pattern);
                  if (value!.isEmpty) {
                    return 'Enter meter readings';
                  } else if (!regExp.hasMatch(value)) {
                    return 'Please enter valid meter readings';
                  }else if(int.parse(value)<=previousGasReadings)
                  {
                    return 'value should be greater then previous readings';
                  }
                  return null;
                },

              ),
              SizedBox(height: 0.08.sw),
            ],
          ),
        ),
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }


  topUp(BuildContext context,double credits) {

    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.of(context, rootNavigator: true)
            .pop();
      },
    );
    Widget continueButton = TextButton(
      child: Text("submit"),
      onPressed: () async {
        print(scannerCode.text);
        if(_formKey.currentState!.validate()){
          if(voucherCodes.contains(scannerCode.text)==true){
            Fluttertoast.showToast(
                msg: "Voucher code already in use.",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.TOP,
                timeInSecForIosWeb: 1);
          }else{
            await FirebaseFirestore.instance
                .collection('Users')
                .doc(firebaseUser!.uid)
                .set({
              'totalCredits':credits+200,
            }, SetOptions(merge: true));
            voucherCodes.add(scannerCode.text);
            await FirebaseFirestore.instance
                .collection('vouchers').doc('vouchers')
                .update({'voucherDetails':voucherCodes});

            Navigator.of(context, rootNavigator: true)
                .pop();
            Fluttertoast.showToast(
                msg: "voucher code applied successfully.",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.TOP,
                timeInSecForIosWeb: 1);
          }

        }
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius:
          BorderRadius.all(Radius.circular(32.0))),
      content: Container(
        width: 0.9.sw,
        height: 0.7.sw,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Top up your credits by entering voucher code or scanning the qr code',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              SizedBox(height: 10,),
              TextFormField(
                controller: scannerCode,
                textInputAction: TextInputAction.next,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                style: TextStyle(
                    color: Theme.of(context).textTheme.bodyText1!.color,
                    fontWeight: FontWeight.w500,
                    fontFamily:
                    Theme.of(context).textTheme.subtitle1!.fontFamily,
                    fontStyle: FontStyle.normal,
                    fontSize: 15),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  errorBorder:  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide:  BorderSide(color: Colors.red, width: 0.0),
                  ),
                  suffixIconConstraints:
                  const BoxConstraints(minWidth: 23, maxHeight: 20),
                  errorStyle: TextStyle(
                      color: Colors.red,
                      fontSize: 12,
                      fontFamily:
                      Theme.of(context).textTheme.subtitle1!.fontFamily,
                      fontWeight: FontWeight.normal),
                  hintText: 'Enter Energy Voucher Code',
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
                  scannerCode.value.text!=value;
                },
                validator: (String? value) {
                  const pattern = r"^[a-zA-Z0-9]{5,15}.\*?$";
                  RegExp regExp = new RegExp(pattern);
                  if (value!.isEmpty) {
                    return 'Enter Energy Voucher Code';
                  } else if (!regExp.hasMatch(value)) {
                    return 'Please enter valid Voucher Code';
                  }
                  return null;
                },

              ),
             const Center(
               child:  Padding(
                  padding:  EdgeInsets.all(10.0),
                  child: Text('OR',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700),),
                ),
             ),
              Center(
                child: IconButton(
                  icon: Icon(Icons.qr_code_scanner),
                  iconSize: 0.25.sw,
                  color: Colors.grey,
                  onPressed: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Scanner(voucherCodes)),
                    );
                    print('reasult---$result');
                    setState(() {
                      scannerCode.text=result;

                    });
                  },
                ),
              )
            ],
          ),
        ),
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

}
