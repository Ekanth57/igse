
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/utils.dart';
import 'package:igse/billing/domain/billingDetails.dart';
import 'package:igse/billing/domain/billingFailure.dart';
import 'package:igse/previousBills/domain/previousBillingFacade.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import '../domain/previousBillingFailure.dart';



@LazySingleton(as: IPreviousBillingFacade)
class PreviousBillingRepository implements IPreviousBillingFacade {
  @override
  Stream<Either<PreviousBillingFailure, List<BillingDetailsList>>> previousBillingWatch() async* {
    User? firebaseUser = FirebaseAuth.instance.currentUser;

    yield* FirebaseFirestore.instance
        .collection("Users").doc(firebaseUser!.uid).collection('billing').orderBy('billingTime', descending: true)
        .snapshots()
        .map(
          (snapshot) => right<PreviousBillingFailure, List<BillingDetailsList>>(
        snapshot.docs
            .map((doc) => BillingDetailsList.fromJson(doc.data()))
            .toList(),
      ),
    );
  }

}