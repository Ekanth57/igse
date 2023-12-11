part of 'previous_billing_watcher_bloc.dart';

@freezed
class PreviousBillingWatcherState with _$PreviousBillingWatcherState {
  const factory PreviousBillingWatcherState.initial() = _Initial;
  const factory PreviousBillingWatcherState.loadInProgress() = _LoadInProgress;
  const factory PreviousBillingWatcherState.loadSuccess(List<BillingDetailsList> billingList) = _LoadSuccess;
  const factory PreviousBillingWatcherState.loadFailure(PreviousBillingFailure previousBillingFailure) = _LoadFailure;
}