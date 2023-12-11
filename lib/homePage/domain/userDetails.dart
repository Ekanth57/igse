import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../billing/domain/billingDetails.dart';
part 'userDetails.g.dart';
@JsonSerializable(explicitToJson: true)
class UserDetailsList {
  UserDetails? userDetails;
  double? totalCredits;
  String? userId;
  String? previousMeterReadingsDay;
  String? previousMeterReadingsNight;
  String? previousMeterReadingsGas;
  bool? initialPaymentDone;
  @JsonKey(
    fromJson: firestoreTimestampFromJson,
    toJson: firestoreTimestampToJson,
  )
  Timestamp? previousBillingDate;

  UserDetailsList({
    this.userDetails,
    this.totalCredits,
    this.userId,
    this.previousMeterReadingsDay,
    this.previousMeterReadingsNight,
    this.previousMeterReadingsGas,
    this.previousBillingDate,
    this.initialPaymentDone,
  });
  Map<String, dynamic> toJson() => _$UserDetailsListToJson(this);
  factory UserDetailsList.fromJson(Map<String, dynamic> json) =>
      _$UserDetailsListFromJson(json);
  factory UserDetailsList.fromFirestore(doc) {
    return UserDetailsList.fromJson(doc.data());
  }
}

@JsonSerializable(explicitToJson: true)
class UserDetails {
  String? address;
  String? email;
  String? initialVoucher;
  String? noOfRooms;
  String? propertyType;
  String? userName;
  List<String>? voucherUsed;
  UserDetails(
    this.address,
    this.email,
    this.initialVoucher,
    this.noOfRooms,
    this.propertyType,
    this.userName,
    this.voucherUsed,
  );
  Map<String, dynamic> toJson() => _$UserDetailsToJson(this);
  factory UserDetails.fromJson(Map<String, dynamic> json) =>
      _$UserDetailsFromJson(json);
  factory UserDetails.fromFirestore(doc) {
    return UserDetails.fromJson(doc.data());
  }
}


@JsonSerializable(explicitToJson: true)
class VoucherDetails {

  Map<String,dynamic>? voucherDetails;
  VoucherDetails(
      this.voucherDetails,
      );
  Map<String, dynamic> toJson() => _$VoucherDetailsToJson(this);
  factory VoucherDetails.fromJson(Map<String, dynamic> json) =>
      _$VoucherDetailsFromJson(json);
  factory VoucherDetails.fromFirestore(doc) {
    return VoucherDetails.fromJson(doc.data());
  }
}