

import 'package:igse/homePage/domain/userDetailsFailure.dart';
import 'package:igse/homePage/domain/userDetails.dart';
import 'package:dartz/dartz.dart';


abstract class IUserDetailsFacade {
  // ignore: non_constant_identifier_names
  Stream<Either<UserDetailsFailure, UserDetailsList>> watchAll(String userId);

}