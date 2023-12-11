import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import '../domain/userDetails.dart';
import '../domain/userDetailsFacade.dart';
import '../domain/userDetailsFailure.dart';



@LazySingleton(as: IUserDetailsFacade)
class FirebaseAuthFacade implements IUserDetailsFacade {
  final firestoreInstance = FirebaseFirestore.instance;
  @override
  Future<Option> getSignedInUser() {
    throw UnimplementedError();
  }

  @override
  Stream<Either<UserDetailsFailure, UserDetailsList>> watchAll(String userID) async* {
    //anOJS7zHY2cebx1OgVQ1blgjWJp1
    print('infrastructure---${userID}');
    yield* FirebaseFirestore.instance
        .collection('Users')
        .doc(userID)
        .snapshots()
        .map((snapshot) => right<UserDetailsFailure, UserDetailsList>(
        UserDetailsList.fromFirestore(snapshot)))
      ..onErrorReturnWith((e, stackTrace) {
        if (e is FirebaseException &&
            e.message!.contains('PERMISSION_DENIED')) {
          return left(const UserDetailsFailure.insufficientPermission());
        } else {
          return left(const UserDetailsFailure.unexpected());
        }
      });
  }

}