import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../injection.dart';
import '../application/watcher/previous_billing_watcher_bloc.dart';
import 'package:intl/intl.dart';

class PreviousBills extends StatefulWidget {
  const PreviousBills({Key? key}) : super(key: key);

  @override
  State<PreviousBills> createState() => _PreviousBillsState();
}

class _PreviousBillsState extends State<PreviousBills> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<PreviousBillingWatcherBloc>(
            create: (context) => getIt<PreviousBillingWatcherBloc>()
              ..add( PreviousBillingWatcherEvent.watchAllStarted()),
          ),
        ],
        child: BlocBuilder<PreviousBillingWatcherBloc, PreviousBillingWatcherState>(
          builder: (context, state) {
            return state.map(
              initial: (_) {
                return Container(
                  width: 1.sw,
                  height: 1.sw,
                  color: Colors.white,
                  child: CircularProgressIndicator(color: Colors.blue,),
                );
              },
              loadInProgress: (_) => const Center(
                child: CircularProgressIndicator(),
              ),
              loadSuccess: (state) {
                print('billing success---------');
                state.billingList.forEach((element) {
                  print(element.totalPrice);
                });
                return Container(
                  width: 1.sw,
                  height: .9.sw,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount:state.billingList.length,
                    itemBuilder: (_, i) {
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          width: 0.9.sw,
                          //height: .9.sw,
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
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('payed on: ${DateFormat('dd/MM/yyyy, hh:mm a').format(DateTime.fromMillisecondsSinceEpoch(state.billingList[i].billingTime!.millisecondsSinceEpoch))}',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                             const Padding(
                               padding: const EdgeInsets.only(left: 8,bottom: 5),
                               child: Text('Meter readings in kwh',
                                 style: TextStyle(color: Colors.black),
                               ),
                             ),
                              Center(
                                child: Container(
                                  width: .85.sw,
                                  height: .15.sw,
                                  decoration: BoxDecoration(
                                      color:Colors.white,
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
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children:const [
                                          Text('Day',style: TextStyle(color: Colors.grey),),
                                          Text('Night',style: TextStyle(color: Colors.grey),),
                                          Text('Gas',style: TextStyle(color: Colors.grey),),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('${state.billingList[i].meterReadings!.previousMeterReadingsDay}',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 20
                                          ),
                                          ),
                                          Text('${state.billingList[i].meterReadings!.previousMeterReadingsNight}',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 20
                                            ),
                                          ),
                                          Text('${state.billingList[i].meterReadings!.previousMeterReadingsGas}',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 20
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 10,),
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
                                            child: Text('Electricity(Day)/kwh (${state.billingList[i].tariffDetails!.tariffDay}£)',
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
                                              ':  ${state.billingList[i].totalPriceDetails!.totalEDay!.toStringAsFixed(2)}£',
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
                                            child: Text('Electricity(Night)/kwh (${state.billingList[i].tariffDetails!.tariffNight}£)',
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
                                              ':  ${(state.billingList[i].totalPriceDetails!.totalENight!).toStringAsFixed(2)}£',
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
                                            child: Text('gas/kwh (${state.billingList[i].tariffDetails!.tariffGas}£)',
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
                                              ':  ${state.billingList[i].totalPriceDetails!.totalGas!.toStringAsFixed(2)}£',
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
                                            child: Text('standing charge/day (${state.billingList[i].tariffDetails!.tariffStandingCharge}£) ',
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
                                              ':  ${(state.billingList[i].tariffDetails!.tariffStandingCharge!*30).toStringAsFixed(2)}£',
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
                                              ':  ${state.billingList[i].totalPrice!.toStringAsFixed(2)}£',
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
                              Container(
                                decoration: BoxDecoration(
                                    color:Colors.green,
                                    borderRadius: BorderRadius.only(bottomLeft:Radius.circular(20),bottomRight: Radius.circular(20)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        spreadRadius: 3,
                                        blurRadius: 5,
                                        offset: Offset(
                                            0, 4), // changes position of shadow
                                      ),
                                    ]),
                                width: 1.sw,
                                height: 0.1.sw,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    Text('Paid',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20
                                    ),
                                    ),
                                    SizedBox(width: 5,),
                                    Icon(Icons.check_circle,
                                    color: Colors.white,
                                      size: 20,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );

              },
              loadFailure: (state) {

                return Container(
                  width: 1.sw,
                  height: 1.sw,
                  color: Colors.white,
                  child: const Text('something went wrong please contact the admin'),
                );
              },
            );
          },
        )

    );
  }
}
