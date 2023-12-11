import 'package:freezed_annotation/freezed_annotation.dart';

part 'billingFailure.freezed.dart';

// these are the failures
@freezed
class BillingFailure with _$BillingFailure {
  const factory BillingFailure.unexpected() = _Unexpected;

  const factory BillingFailure.insufficientPermission() =
  _InsufficientPermission;

  const factory BillingFailure.unableToUpdate() = _UnableToUpdate;
}