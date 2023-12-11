import 'package:dartz/dartz.dart';
import 'package:igse/billing/domain/billingDetails.dart';

import 'billingFailure.dart';


abstract class IBillingFacade {
  Stream<Either<BillingFailure, List<BillingDetailsList>>> billingWatch();
}