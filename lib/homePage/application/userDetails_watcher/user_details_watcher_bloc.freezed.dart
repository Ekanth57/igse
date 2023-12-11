// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_details_watcher_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserDetailsWatcherEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userID) watchAllStarted,
    required TResult Function(
            Either<UserDetailsFailure, UserDetailsList> failureOrBookings)
        bookingsReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userID)? watchAllStarted,
    TResult? Function(
            Either<UserDetailsFailure, UserDetailsList> failureOrBookings)?
        bookingsReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userID)? watchAllStarted,
    TResult Function(
            Either<UserDetailsFailure, UserDetailsList> failureOrBookings)?
        bookingsReceived,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_WatchAllStarted value) watchAllStarted,
    required TResult Function(_BookingsReceived value) bookingsReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_WatchAllStarted value)? watchAllStarted,
    TResult? Function(_BookingsReceived value)? bookingsReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_WatchAllStarted value)? watchAllStarted,
    TResult Function(_BookingsReceived value)? bookingsReceived,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDetailsWatcherEventCopyWith<$Res> {
  factory $UserDetailsWatcherEventCopyWith(UserDetailsWatcherEvent value,
          $Res Function(UserDetailsWatcherEvent) then) =
      _$UserDetailsWatcherEventCopyWithImpl<$Res, UserDetailsWatcherEvent>;
}

/// @nodoc
class _$UserDetailsWatcherEventCopyWithImpl<$Res,
        $Val extends UserDetailsWatcherEvent>
    implements $UserDetailsWatcherEventCopyWith<$Res> {
  _$UserDetailsWatcherEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_WatchAllStartedCopyWith<$Res> {
  factory _$$_WatchAllStartedCopyWith(
          _$_WatchAllStarted value, $Res Function(_$_WatchAllStarted) then) =
      __$$_WatchAllStartedCopyWithImpl<$Res>;
  @useResult
  $Res call({String userID});
}

/// @nodoc
class __$$_WatchAllStartedCopyWithImpl<$Res>
    extends _$UserDetailsWatcherEventCopyWithImpl<$Res, _$_WatchAllStarted>
    implements _$$_WatchAllStartedCopyWith<$Res> {
  __$$_WatchAllStartedCopyWithImpl(
      _$_WatchAllStarted _value, $Res Function(_$_WatchAllStarted) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userID = null,
  }) {
    return _then(_$_WatchAllStarted(
      null == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_WatchAllStarted implements _WatchAllStarted {
  const _$_WatchAllStarted(this.userID);

  @override
  final String userID;

  @override
  String toString() {
    return 'UserDetailsWatcherEvent.watchAllStarted(userID: $userID)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WatchAllStarted &&
            (identical(other.userID, userID) || other.userID == userID));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userID);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WatchAllStartedCopyWith<_$_WatchAllStarted> get copyWith =>
      __$$_WatchAllStartedCopyWithImpl<_$_WatchAllStarted>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userID) watchAllStarted,
    required TResult Function(
            Either<UserDetailsFailure, UserDetailsList> failureOrBookings)
        bookingsReceived,
  }) {
    return watchAllStarted(userID);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userID)? watchAllStarted,
    TResult? Function(
            Either<UserDetailsFailure, UserDetailsList> failureOrBookings)?
        bookingsReceived,
  }) {
    return watchAllStarted?.call(userID);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userID)? watchAllStarted,
    TResult Function(
            Either<UserDetailsFailure, UserDetailsList> failureOrBookings)?
        bookingsReceived,
    required TResult orElse(),
  }) {
    if (watchAllStarted != null) {
      return watchAllStarted(userID);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_WatchAllStarted value) watchAllStarted,
    required TResult Function(_BookingsReceived value) bookingsReceived,
  }) {
    return watchAllStarted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_WatchAllStarted value)? watchAllStarted,
    TResult? Function(_BookingsReceived value)? bookingsReceived,
  }) {
    return watchAllStarted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_WatchAllStarted value)? watchAllStarted,
    TResult Function(_BookingsReceived value)? bookingsReceived,
    required TResult orElse(),
  }) {
    if (watchAllStarted != null) {
      return watchAllStarted(this);
    }
    return orElse();
  }
}

abstract class _WatchAllStarted implements UserDetailsWatcherEvent {
  const factory _WatchAllStarted(final String userID) = _$_WatchAllStarted;

  String get userID;
  @JsonKey(ignore: true)
  _$$_WatchAllStartedCopyWith<_$_WatchAllStarted> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_BookingsReceivedCopyWith<$Res> {
  factory _$$_BookingsReceivedCopyWith(
          _$_BookingsReceived value, $Res Function(_$_BookingsReceived) then) =
      __$$_BookingsReceivedCopyWithImpl<$Res>;
  @useResult
  $Res call({Either<UserDetailsFailure, UserDetailsList> failureOrBookings});
}

/// @nodoc
class __$$_BookingsReceivedCopyWithImpl<$Res>
    extends _$UserDetailsWatcherEventCopyWithImpl<$Res, _$_BookingsReceived>
    implements _$$_BookingsReceivedCopyWith<$Res> {
  __$$_BookingsReceivedCopyWithImpl(
      _$_BookingsReceived _value, $Res Function(_$_BookingsReceived) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failureOrBookings = null,
  }) {
    return _then(_$_BookingsReceived(
      null == failureOrBookings
          ? _value.failureOrBookings
          : failureOrBookings // ignore: cast_nullable_to_non_nullable
              as Either<UserDetailsFailure, UserDetailsList>,
    ));
  }
}

/// @nodoc

class _$_BookingsReceived implements _BookingsReceived {
  const _$_BookingsReceived(this.failureOrBookings);

  @override
  final Either<UserDetailsFailure, UserDetailsList> failureOrBookings;

  @override
  String toString() {
    return 'UserDetailsWatcherEvent.bookingsReceived(failureOrBookings: $failureOrBookings)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BookingsReceived &&
            (identical(other.failureOrBookings, failureOrBookings) ||
                other.failureOrBookings == failureOrBookings));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failureOrBookings);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BookingsReceivedCopyWith<_$_BookingsReceived> get copyWith =>
      __$$_BookingsReceivedCopyWithImpl<_$_BookingsReceived>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userID) watchAllStarted,
    required TResult Function(
            Either<UserDetailsFailure, UserDetailsList> failureOrBookings)
        bookingsReceived,
  }) {
    return bookingsReceived(failureOrBookings);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userID)? watchAllStarted,
    TResult? Function(
            Either<UserDetailsFailure, UserDetailsList> failureOrBookings)?
        bookingsReceived,
  }) {
    return bookingsReceived?.call(failureOrBookings);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userID)? watchAllStarted,
    TResult Function(
            Either<UserDetailsFailure, UserDetailsList> failureOrBookings)?
        bookingsReceived,
    required TResult orElse(),
  }) {
    if (bookingsReceived != null) {
      return bookingsReceived(failureOrBookings);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_WatchAllStarted value) watchAllStarted,
    required TResult Function(_BookingsReceived value) bookingsReceived,
  }) {
    return bookingsReceived(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_WatchAllStarted value)? watchAllStarted,
    TResult? Function(_BookingsReceived value)? bookingsReceived,
  }) {
    return bookingsReceived?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_WatchAllStarted value)? watchAllStarted,
    TResult Function(_BookingsReceived value)? bookingsReceived,
    required TResult orElse(),
  }) {
    if (bookingsReceived != null) {
      return bookingsReceived(this);
    }
    return orElse();
  }
}

abstract class _BookingsReceived implements UserDetailsWatcherEvent {
  const factory _BookingsReceived(
          final Either<UserDetailsFailure, UserDetailsList> failureOrBookings) =
      _$_BookingsReceived;

  Either<UserDetailsFailure, UserDetailsList> get failureOrBookings;
  @JsonKey(ignore: true)
  _$$_BookingsReceivedCopyWith<_$_BookingsReceived> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UserDetailsWatcherState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(UserDetailsList userDetailsList) loadSuccess,
    required TResult Function(UserDetailsFailure userDetailsFailure)
        loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadInProgress,
    TResult? Function(UserDetailsList userDetailsList)? loadSuccess,
    TResult? Function(UserDetailsFailure userDetailsFailure)? loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(UserDetailsList userDetailsList)? loadSuccess,
    TResult Function(UserDetailsFailure userDetailsFailure)? loadFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_LoadSuccess value)? loadSuccess,
    TResult? Function(_LoadFailure value)? loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDetailsWatcherStateCopyWith<$Res> {
  factory $UserDetailsWatcherStateCopyWith(UserDetailsWatcherState value,
          $Res Function(UserDetailsWatcherState) then) =
      _$UserDetailsWatcherStateCopyWithImpl<$Res, UserDetailsWatcherState>;
}

/// @nodoc
class _$UserDetailsWatcherStateCopyWithImpl<$Res,
        $Val extends UserDetailsWatcherState>
    implements $UserDetailsWatcherStateCopyWith<$Res> {
  _$UserDetailsWatcherStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$UserDetailsWatcherStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'UserDetailsWatcherState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(UserDetailsList userDetailsList) loadSuccess,
    required TResult Function(UserDetailsFailure userDetailsFailure)
        loadFailure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadInProgress,
    TResult? Function(UserDetailsList userDetailsList)? loadSuccess,
    TResult? Function(UserDetailsFailure userDetailsFailure)? loadFailure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(UserDetailsList userDetailsList)? loadSuccess,
    TResult Function(UserDetailsFailure userDetailsFailure)? loadFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_LoadSuccess value)? loadSuccess,
    TResult? Function(_LoadFailure value)? loadFailure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements UserDetailsWatcherState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_LoadInProgressCopyWith<$Res> {
  factory _$$_LoadInProgressCopyWith(
          _$_LoadInProgress value, $Res Function(_$_LoadInProgress) then) =
      __$$_LoadInProgressCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadInProgressCopyWithImpl<$Res>
    extends _$UserDetailsWatcherStateCopyWithImpl<$Res, _$_LoadInProgress>
    implements _$$_LoadInProgressCopyWith<$Res> {
  __$$_LoadInProgressCopyWithImpl(
      _$_LoadInProgress _value, $Res Function(_$_LoadInProgress) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_LoadInProgress implements _LoadInProgress {
  const _$_LoadInProgress();

  @override
  String toString() {
    return 'UserDetailsWatcherState.loadInProgress()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_LoadInProgress);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(UserDetailsList userDetailsList) loadSuccess,
    required TResult Function(UserDetailsFailure userDetailsFailure)
        loadFailure,
  }) {
    return loadInProgress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadInProgress,
    TResult? Function(UserDetailsList userDetailsList)? loadSuccess,
    TResult? Function(UserDetailsFailure userDetailsFailure)? loadFailure,
  }) {
    return loadInProgress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(UserDetailsList userDetailsList)? loadSuccess,
    TResult Function(UserDetailsFailure userDetailsFailure)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) {
    return loadInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_LoadSuccess value)? loadSuccess,
    TResult? Function(_LoadFailure value)? loadFailure,
  }) {
    return loadInProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress(this);
    }
    return orElse();
  }
}

abstract class _LoadInProgress implements UserDetailsWatcherState {
  const factory _LoadInProgress() = _$_LoadInProgress;
}

/// @nodoc
abstract class _$$_LoadSuccessCopyWith<$Res> {
  factory _$$_LoadSuccessCopyWith(
          _$_LoadSuccess value, $Res Function(_$_LoadSuccess) then) =
      __$$_LoadSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({UserDetailsList userDetailsList});
}

/// @nodoc
class __$$_LoadSuccessCopyWithImpl<$Res>
    extends _$UserDetailsWatcherStateCopyWithImpl<$Res, _$_LoadSuccess>
    implements _$$_LoadSuccessCopyWith<$Res> {
  __$$_LoadSuccessCopyWithImpl(
      _$_LoadSuccess _value, $Res Function(_$_LoadSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userDetailsList = null,
  }) {
    return _then(_$_LoadSuccess(
      null == userDetailsList
          ? _value.userDetailsList
          : userDetailsList // ignore: cast_nullable_to_non_nullable
              as UserDetailsList,
    ));
  }
}

/// @nodoc

class _$_LoadSuccess implements _LoadSuccess {
  const _$_LoadSuccess(this.userDetailsList);

  @override
  final UserDetailsList userDetailsList;

  @override
  String toString() {
    return 'UserDetailsWatcherState.loadSuccess(userDetailsList: $userDetailsList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadSuccess &&
            (identical(other.userDetailsList, userDetailsList) ||
                other.userDetailsList == userDetailsList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userDetailsList);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadSuccessCopyWith<_$_LoadSuccess> get copyWith =>
      __$$_LoadSuccessCopyWithImpl<_$_LoadSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(UserDetailsList userDetailsList) loadSuccess,
    required TResult Function(UserDetailsFailure userDetailsFailure)
        loadFailure,
  }) {
    return loadSuccess(userDetailsList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadInProgress,
    TResult? Function(UserDetailsList userDetailsList)? loadSuccess,
    TResult? Function(UserDetailsFailure userDetailsFailure)? loadFailure,
  }) {
    return loadSuccess?.call(userDetailsList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(UserDetailsList userDetailsList)? loadSuccess,
    TResult Function(UserDetailsFailure userDetailsFailure)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(userDetailsList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) {
    return loadSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_LoadSuccess value)? loadSuccess,
    TResult? Function(_LoadFailure value)? loadFailure,
  }) {
    return loadSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(this);
    }
    return orElse();
  }
}

abstract class _LoadSuccess implements UserDetailsWatcherState {
  const factory _LoadSuccess(final UserDetailsList userDetailsList) =
      _$_LoadSuccess;

  UserDetailsList get userDetailsList;
  @JsonKey(ignore: true)
  _$$_LoadSuccessCopyWith<_$_LoadSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadFailureCopyWith<$Res> {
  factory _$$_LoadFailureCopyWith(
          _$_LoadFailure value, $Res Function(_$_LoadFailure) then) =
      __$$_LoadFailureCopyWithImpl<$Res>;
  @useResult
  $Res call({UserDetailsFailure userDetailsFailure});

  $UserDetailsFailureCopyWith<$Res> get userDetailsFailure;
}

/// @nodoc
class __$$_LoadFailureCopyWithImpl<$Res>
    extends _$UserDetailsWatcherStateCopyWithImpl<$Res, _$_LoadFailure>
    implements _$$_LoadFailureCopyWith<$Res> {
  __$$_LoadFailureCopyWithImpl(
      _$_LoadFailure _value, $Res Function(_$_LoadFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userDetailsFailure = null,
  }) {
    return _then(_$_LoadFailure(
      null == userDetailsFailure
          ? _value.userDetailsFailure
          : userDetailsFailure // ignore: cast_nullable_to_non_nullable
              as UserDetailsFailure,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserDetailsFailureCopyWith<$Res> get userDetailsFailure {
    return $UserDetailsFailureCopyWith<$Res>(_value.userDetailsFailure,
        (value) {
      return _then(_value.copyWith(userDetailsFailure: value));
    });
  }
}

/// @nodoc

class _$_LoadFailure implements _LoadFailure {
  const _$_LoadFailure(this.userDetailsFailure);

  @override
  final UserDetailsFailure userDetailsFailure;

  @override
  String toString() {
    return 'UserDetailsWatcherState.loadFailure(userDetailsFailure: $userDetailsFailure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadFailure &&
            (identical(other.userDetailsFailure, userDetailsFailure) ||
                other.userDetailsFailure == userDetailsFailure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userDetailsFailure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadFailureCopyWith<_$_LoadFailure> get copyWith =>
      __$$_LoadFailureCopyWithImpl<_$_LoadFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(UserDetailsList userDetailsList) loadSuccess,
    required TResult Function(UserDetailsFailure userDetailsFailure)
        loadFailure,
  }) {
    return loadFailure(userDetailsFailure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadInProgress,
    TResult? Function(UserDetailsList userDetailsList)? loadSuccess,
    TResult? Function(UserDetailsFailure userDetailsFailure)? loadFailure,
  }) {
    return loadFailure?.call(userDetailsFailure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(UserDetailsList userDetailsList)? loadSuccess,
    TResult Function(UserDetailsFailure userDetailsFailure)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadFailure != null) {
      return loadFailure(userDetailsFailure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) {
    return loadFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_LoadSuccess value)? loadSuccess,
    TResult? Function(_LoadFailure value)? loadFailure,
  }) {
    return loadFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadFailure != null) {
      return loadFailure(this);
    }
    return orElse();
  }
}

abstract class _LoadFailure implements UserDetailsWatcherState {
  const factory _LoadFailure(final UserDetailsFailure userDetailsFailure) =
      _$_LoadFailure;

  UserDetailsFailure get userDetailsFailure;
  @JsonKey(ignore: true)
  _$$_LoadFailureCopyWith<_$_LoadFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
