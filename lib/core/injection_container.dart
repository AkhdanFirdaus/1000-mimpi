import 'package:get_it/get_it.dart';
import 'routes/router.dart';

export 'package:auto_route/auto_route.dart';
export 'routes/router.dart';

GetIt getIt = GetIt.instance;

void init() {
  getIt.registerLazySingleton<AppRouter>(() => AppRouter());
}
