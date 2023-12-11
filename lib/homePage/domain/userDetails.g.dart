// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userDetails.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDetailsList _$UserDetailsListFromJson(Map<String, dynamic> json) =>
    UserDetailsList(
      userDetails: json['userDetails'] == null
          ? null
          : UserDetails.fromJson(json['userDetails'] as Map<String, dynamic>),
      totalCredits: (json['totalCredits'] as num?)?.toDouble(),
      userId: json['userId'] as String?,
      previousMeterReadingsDay: json['previousMeterReadingsDay'] as String?,
      previousMeterReadingsNight: json['previousMeterReadingsNight'] as String?,
      previousMeterReadingsGas: json['previousMeterReadingsGas'] as String?,
      previousBillingDate:
          firestoreTimestampFromJson(json['previousBillingDate']),
      initialPaymentDone: json['initialPaymentDone'] as bool?,
    );

Map<String, dynamic> _$UserDetailsListToJson(UserDetailsList instance) =>
    <String, dynamic>{
      'userDetails': instance.userDetails?.toJson(),
      'totalCredits': instance.totalCredits,
      'userId': instance.userId,
      'previousMeterReadingsDay': instance.previousMeterReadingsDay,
      'previousMeterReadingsNight': instance.previousMeterReadingsNight,
      'previousMeterReadingsGas': instance.previousMeterReadingsGas,
      'initialPaymentDone': instance.initialPaymentDone,
      'previousBillingDate':
          firestoreTimestampToJson(instance.previousBillingDate),
    };

UserDetails _$UserDetailsFromJson(Map<String, dynamic> json) => UserDetails(
      json['address'] as String?,
      json['email'] as String?,
      json['initialVoucher'] as String?,
      json['noOfRooms'] as String?,
      json['propertyType'] as String?,
      json['userName'] as String?,
      (json['voucherUsed'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$UserDetailsToJson(UserDetails instance) =>
    <String, dynamic>{
      'address': instance.address,
      'email': instance.email,
      'initialVoucher': instance.initialVoucher,
      'noOfRooms': instance.noOfRooms,
      'propertyType': instance.propertyType,
      'userName': instance.userName,
      'voucherUsed': instance.voucherUsed,
    };

VoucherDetails _$VoucherDetailsFromJson(Map<String, dynamic> json) =>
    VoucherDetails(
      json['voucherDetails'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$VoucherDetailsToJson(VoucherDetails instance) =>
    <String, dynamic>{
      'voucherDetails': instance.voucherDetails,
    };
