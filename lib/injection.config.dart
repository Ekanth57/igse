// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'billing/billing_watcher/billing_watcher_bloc.dart' as _i11;
import 'billing/domain/billingFacade.dart' as _i3;
import 'billing/infrastructure/billingRepository.dart' as _i4;
import 'homePage/application/userDetails_watcher/user_details_watcher_bloc.dart'
    as _i10;
import 'homePage/domain/userDetailsFacade.dart' as _i7;
import 'homePage/infrastructure/userDetails_repository.dart' as _i8;
import 'previousBills/application/watcher/previous_billing_watcher_bloc.dart'
    as _i9;
import 'previousBills/domain/previousBillingFacade.dart' as _i5;
import 'previousBills/infrastructre/previousBillingRepository.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.IBillingFacade>(() => _i4.BillingRepository());
  gh.lazySingleton<_i5.IPreviousBillingFacade>(
      () => _i6.PreviousBillingRepository());
  gh.lazySingleton<_i7.IUserDetailsFacade>(() => _i8.FirebaseAuthFacade());
  gh.factory<_i9.PreviousBillingWatcherBloc>(
      () => _i9.PreviousBillingWatcherBloc(get<_i5.IPreviousBillingFacade>()));
  gh.factory<_i10.UserDetailsWatcherBloc>(
      () => _i10.UserDetailsWatcherBloc(get<_i7.IUserDetailsFacade>()));
  gh.factory<_i11.BillingWatcherBloc>(
      () => _i11.BillingWatcherBloc(get<_i3.IBillingFacade>()));
  return get;
}
