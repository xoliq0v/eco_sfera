// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:app_bloc/app_bloc.dart' as _i10;
import 'package:core/core.dart' as _i3;
import 'package:database/database.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:map_service/map_service.dart' as _i7;
import 'package:navigation/navigation.dart' as _i4;
import 'package:network/network.dart' as _i6;
import 'package:repository/repository.dart' as _i8;
import 'package:use_case/use_case.dart' as _i9;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    await _i3.CorePackageModule().init(gh);
    await _i4.NavigationPackageModule().init(gh);
    await _i5.DatabasePackageModule().init(gh);
    await _i6.NetworkPackageModule().init(gh);
    await _i7.MapServicePackageModule().init(gh);
    await _i8.RepositoryPackageModule().init(gh);
    await _i9.UseCasePackageModule().init(gh);
    await _i10.AppBlocPackageModule().init(gh);
    return this;
  }
}
