// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'billingDetails.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BillingDetailsList _$BillingDetailsListFromJson(Map<String, dynamic> json) =>
    BillingDetailsList(
      meterReadings: json['meterReadings'] == null
          ? null
          : MeterReadings.fromJson(
              json['meterReadings'] as Map<String, dynamic>),
      tariffDetails: json['tariffDetails'] == null
          ? null
          : TariffDetails.fromJson(
              json['tariffDetails'] as Map<String, dynamic>),
      totalPriceDetails: json['totalPriceDetails'] == null
          ? null
          : TotalPriceDetails.fromJson(
              json['totalPriceDetails'] as Map<String, dynamic>),
      totalPrice: (json['totalPrice'] as num?)?.toDouble(),
      billingTime: firestoreTimestampFromJson(json['billingTime']),
    );

Map<String, dynamic> _$BillingDetailsListToJson(BillingDetailsList instance) =>
    <String, dynamic>{
      'meterReadings': instance.meterReadings?.toJson(),
      'tariffDetails': instance.tariffDetails?.toJson(),
      'totalPriceDetails': instance.totalPriceDetails?.toJson(),
      'totalPrice': instance.totalPrice,
      'billingTime': firestoreTimestampToJson(instance.billingTime),
    };

MeterReadings _$MeterReadingsFromJson(Map<String, dynamic> json) =>
    MeterReadings(
      previousMeterReadingsDay: json['previousMeterReadingsDay'] as String?,
      previousMeterReadingsNight: json['previousMeterReadingsNight'] as String?,
      previousMeterReadingsGas: json['previousMeterReadingsGas'] as String?,
    );

Map<String, dynamic> _$MeterReadingsToJson(MeterReadings instance) =>
    <String, dynamic>{
      'previousMeterReadingsDay': instance.previousMeterReadingsDay,
      'previousMeterReadingsNight': instance.previousMeterReadingsNight,
      'previousMeterReadingsGas': instance.previousMeterReadingsGas,
    };

TariffDetails _$TariffDetailsFromJson(Map<String, dynamic> json) =>
    TariffDetails(
      tariffDay: (json['tariffDay'] as num?)?.toDouble(),
      tariffNight: (json['tariffNight'] as num?)?.toDouble(),
      tariffGas: (json['tariffGas'] as num?)?.toDouble(),
      tariffStandingCharge: (json['tariffStandingCharge'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$TariffDetailsToJson(TariffDetails instance) =>
    <String, dynamic>{
      'tariffDay': instance.tariffDay,
      'tariffNight': instance.tariffNight,
      'tariffGas': instance.tariffGas,
      'tariffStandingCharge': instance.tariffStandingCharge,
    };

TotalPriceDetails _$TotalPriceDetailsFromJson(Map<String, dynamic> json) =>
    TotalPriceDetails(
      totalEDay: (json['totalEDay'] as num?)?.toDouble(),
      totalENight: (json['totalENight'] as num?)?.toDouble(),
      totalGas: (json['totalGas'] as num?)?.toDouble(),
      totalStandingCharge: (json['totalStandingCharge'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$TotalPriceDetailsToJson(TotalPriceDetails instance) =>
    <String, dynamic>{
      'totalEDay': instance.totalEDay,
      'totalENight': instance.totalENight,
      'totalGas': instance.totalGas,
      'totalStandingCharge': instance.totalStandingCharge,
    };
