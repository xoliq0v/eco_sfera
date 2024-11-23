import 'package:app_bloc/app_bloc.dart';
import 'package:eco_sfera/di/injection.config.dart';
import 'package:core/core.dart';
import 'package:database/database.dart';
import 'package:map_service/map_service.dart';
import 'package:navigation/navigation.dart';
import 'package:network/network.dart';
import 'package:repository/repository.dart';
import 'package:use_case/use_case.dart';

final getIt = GetIt.instance;

@InjectableInit(
  externalPackageModulesBefore: [
    ExternalModule(CorePackageModule),
    ExternalModule(NavigationPackageModule),
    ExternalModule(DatabasePackageModule),
    ExternalModule(NetworkPackageModule),
    ExternalModule(MapServicePackageModule),
  ],
  externalPackageModulesAfter: [
    ExternalModule(RepositoryPackageModule),
    ExternalModule(UseCasePackageModule),
    ExternalModule(AppBlocPackageModule),
  ],
)
Future<GetIt> configInjection() {
  return getIt.init();
}
