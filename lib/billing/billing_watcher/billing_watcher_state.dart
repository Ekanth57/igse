part of 'billing_watcher_bloc.dart';

@freezed
class BillingWatcherState with _$BillingWatcherState {
  const factory BillingWatcherState.initial() = _Initial;
  const factory BillingWatcherState.loadInProgress() = _LoadInProgress;
  const factory BillingWatcherState.loadSuccess(List<BillingDetailsList> billingList) = _LoadSuccess;
  const factory BillingWatcherState.loadFailure(BillingFailure billingFailure) = _LoadFailure;
}
