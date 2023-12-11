
part of 'user_details_watcher_bloc.dart';

@freezed
class UserDetailsWatcherState with _$UserDetailsWatcherState {
  const factory UserDetailsWatcherState.initial() = _Initial;
  const factory UserDetailsWatcherState.loadInProgress() = _LoadInProgress;
  const factory UserDetailsWatcherState.loadSuccess(UserDetailsList userDetailsList) =_LoadSuccess;
  const factory UserDetailsWatcherState.loadFailure(UserDetailsFailure userDetailsFailure) =_LoadFailure;
}