import 'dart:async';


import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../billing/domain/billingDetails.dart';
import '../../domain/previousBillingFacade.dart';
import '../../domain/previousBillingFailure.dart';


part 'previous_billing_watcher_bloc.freezed.dart';
part 'previous_billing_watcher_event.dart';
part 'previous_billing_watcher_state.dart';

@injectable
class PreviousBillingWatcherBloc extends Bloc<PreviousBillingWatcherEvent, PreviousBillingWatcherState> {
  final IPreviousBillingFacade billingWatcherRepository;

  PreviousBillingWatcherBloc(this.billingWatcherRepository)
      : super(const PreviousBillingWatcherState.initial());

  StreamSubscription<Either<PreviousBillingFailure, List<BillingDetailsList>>>?
  billingStreamSubscription;

  @override
  Stream<PreviousBillingWatcherState> mapEventToState(
      PreviousBillingWatcherEvent event,
      ) async* {
    yield* event.map(
      watchAllStarted: (e) async* {
        yield const PreviousBillingWatcherState.loadInProgress();
        await billingStreamSubscription?.cancel();
        billingStreamSubscription =
            billingWatcherRepository.previousBillingWatch().listen(
                  (failureOrBookings) =>
                  add(PreviousBillingWatcherEvent.assetsWatched(failureOrBookings)),
            );
        print('inside watcher billing bloc--');
      },
      assetsWatched: (e) async* {
        yield e.failureOrBilling.fold(
              (f) => PreviousBillingWatcherState.loadFailure(f),
              (assets) => PreviousBillingWatcherState.loadSuccess(assets),
        );
        print('watcher billing failure-----');

      },
    );
  }

}
