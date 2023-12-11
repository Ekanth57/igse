import 'package:freezed_annotation/freezed_annotation.dart';

part 'userDetailsFailure.freezed.dart';

@freezed
class UserDetailsFailure with _$UserDetailsFailure {
  const factory UserDetailsFailure.unexpected() = _Unexpected;
  const factory UserDetailsFailure.insufficientPermission() =
  _InsufficientPermission;
  const factory UserDetailsFailure.unableToUpdate() = _UnableToUpdate;
}