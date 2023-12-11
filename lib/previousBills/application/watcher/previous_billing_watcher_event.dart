part of 'previous_billing_watcher_bloc.dart';

@freezed
class PreviousBillingWatcherEvent with _$PreviousBillingWatcherEvent {
  const factory PreviousBillingWatcherEvent.watchAllStarted() =
  _WatchAllStarted;
  const factory PreviousBillingWatcherEvent.assetsWatched(Either<PreviousBillingFailure, List<BillingDetailsList>>
  failureOrBilling,) = _BillingReceived;
}