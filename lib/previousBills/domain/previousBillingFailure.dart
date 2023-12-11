import 'package:freezed_annotation/freezed_annotation.dart';

part 'previousBillingFailure.freezed.dart';

// these are the failures
@freezed
class PreviousBillingFailure with _$PreviousBillingFailure {
  const factory PreviousBillingFailure.unexpected() = _Unexpected;

  const factory PreviousBillingFailure.insufficientPermission() =
  _InsufficientPermission;

  const factory PreviousBillingFailure.unableToUpdate() = _UnableToUpdate;
}