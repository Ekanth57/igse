
import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../domain/userDetails.dart';
import '../../domain/userDetailsFacade.dart';
import '../../domain/userDetailsFailure.dart';

part 'user_details_watcher_event.dart';
part 'user_details_watcher_state.dart';
part 'user_details_watcher_bloc.freezed.dart';
@injectable
class UserDetailsWatcherBloc
    extends Bloc<UserDetailsWatcherEvent, UserDetailsWatcherState> {
  final IUserDetailsFacade _cardRepository;

  UserDetailsWatcherBloc(this._cardRepository)
      : super(const UserDetailsWatcherState.initial());
  StreamSubscription<Either<UserDetailsFailure, UserDetailsList>>?
  _userStreamSubscription;

  @override
  Stream<UserDetailsWatcherState> mapEventToState(
      UserDetailsWatcherEvent event,
      ) async* {
    yield* event.map(
      watchAllStarted: (e) async* {
        yield const UserDetailsWatcherState.loadInProgress();
        await _userStreamSubscription?.cancel();
        _userStreamSubscription =
            _cardRepository.watchAll(e.userID).listen((failureOrBookings) {
              add(UserDetailsWatcherEvent.bookingsReceived(failureOrBookings));
            });
      },
      bookingsReceived: (e) async* {
        yield e.failureOrBookings.fold(
              (f) => UserDetailsWatcherState.loadFailure(f),
              (bookings) => UserDetailsWatcherState.loadSuccess(bookings),

        );

      },
    );
  }

}