
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:get/utils.dart';
import 'package:igse/billing/domain/billingDetails.dart';
import 'package:igse/billing/domain/billingFailure.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import '../domain/billingFacade.dart';


@LazySingleton(as: IBillingFacade)
class BillingRepository implements IBillingFacade {
  @override
  Stream<Either<BillingFailure, List<BillingDetailsList>>> billingWatch() async* {
    print('inside billing repository------');
      yield* FirebaseFirestore.instance
          .collection("Billing").orderBy('billingTime', descending: true)
          .snapshots()
          .map(
            (snapshot) => right<BillingFailure, List<BillingDetailsList>>(
          snapshot.docs
              .map((doc) => BillingDetailsList.fromJson(doc.data()))
              .toList(),
        ),
      );
  }

}