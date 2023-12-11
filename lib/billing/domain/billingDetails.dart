import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'billingDetails.g.dart';

@JsonSerializable(explicitToJson: true)
class BillingDetailsList {
  MeterReadings? meterReadings;
  TariffDetails? tariffDetails;
  TotalPriceDetails? totalPriceDetails;
  double? totalPrice;
  @JsonKey(
    fromJson: firestoreTimestampFromJson,
    toJson: firestoreTimestampToJson,
  )
  Timestamp? billingTime;
  BillingDetailsList({
    this.meterReadings,
    this.tariffDetails,
    this.totalPriceDetails,
    this.totalPrice,
    this.billingTime
  });
  Map<String, dynamic> toJson() => _$BillingDetailsListToJson(this);
  factory BillingDetailsList.fromJson(Map<String, dynamic> json) =>
      _$BillingDetailsListFromJson(json);
  factory BillingDetailsList.fromFirestore(doc) {
    return BillingDetailsList.fromJson(doc.data());
  }
}

@JsonSerializable(explicitToJson: true)
class MeterReadings {
  String? previousMeterReadingsDay;
  String? previousMeterReadingsNight;
  String? previousMeterReadingsGas;

  MeterReadings({
    this.previousMeterReadingsDay,
    this.previousMeterReadingsNight,
    this.previousMeterReadingsGas,
  });
  Map<String, dynamic> toJson() => _$MeterReadingsToJson(this);
  factory MeterReadings.fromJson(Map<String, dynamic> json) =>
      _$MeterReadingsFromJson(json);
  factory MeterReadings.fromFirestore(doc) {
    return MeterReadings.fromJson(doc.data());
  }
}

@JsonSerializable(explicitToJson: true)
class TariffDetails {
  double? tariffDay;
  double? tariffNight;
  double? tariffGas;
  double? tariffStandingCharge;

  TariffDetails({
    this.tariffDay,
    this.tariffNight,
    this.tariffGas,
    this.tariffStandingCharge
  });
  Map<String, dynamic> toJson() => _$TariffDetailsToJson(this);
  factory TariffDetails.fromJson(Map<String, dynamic> json) =>
      _$TariffDetailsFromJson(json);
  factory TariffDetails.fromFirestore(doc) {
    return TariffDetails.fromJson(doc.data());
  }
}

@JsonSerializable(explicitToJson: true)
class TotalPriceDetails {
  double? totalEDay;
  double? totalENight;
  double? totalGas;
  double? totalStandingCharge;

  TotalPriceDetails({
    this.totalEDay,
    this.totalENight,
    this.totalGas,
    this.totalStandingCharge,
  });
  Map<String, dynamic> toJson() => _$TotalPriceDetailsToJson(this);
  factory TotalPriceDetails.fromJson(Map<String, dynamic> json) =>
      _$TotalPriceDetailsFromJson(json);
  factory TotalPriceDetails.fromFirestore(doc) {
    return TotalPriceDetails.fromJson(doc.data());
  }
}

Timestamp firestoreTimestampFromJson(dynamic value) {
  return value;
  //value != null ? Timestamp.fromMicrosecondsSinceEpoch(value) : value;
}

Map<String, dynamic> firestoreTimestampToJson(Timestamp? value) {
  return {"seconds": value!.seconds, "nanoseconds": value.nanoseconds};
}