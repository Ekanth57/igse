import 'package:dartz/dartz.dart';
import 'package:igse/billing/domain/billingDetails.dart';
import 'package:igse/previousBills/domain/previousBillingFailure.dart';




abstract class IPreviousBillingFacade {
  Stream<Either<PreviousBillingFailure, List<BillingDetailsList>>> previousBillingWatch();
}