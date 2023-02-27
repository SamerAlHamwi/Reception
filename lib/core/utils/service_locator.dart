import 'package:get_it/get_it.dart';

import '../boilerplate/pagination/cubits/pagination_cubit.dart';

class ServiceLocator {
  static void registerModels() {
    GetIt.I.registerLazySingleton<CubitsStore>(() => CubitsStore());
  }

  static void refreshCalls() {
    GetIt.I<CubitsStore>().callsList?.getList();
  }
}

class CubitsStore {
  PaginationCubit? callsList;

  CubitsStore();
}
