part of 'user_details_watcher_bloc.dart';

@freezed
class UserDetailsWatcherEvent with _$UserDetailsWatcherEvent {
  const factory UserDetailsWatcherEvent.watchAllStarted(String userID) = _WatchAllStarted;
  const factory UserDetailsWatcherEvent.bookingsReceived(
      Either<UserDetailsFailure, UserDetailsList> failureOrBookings,
      ) = _BookingsReceived;
}