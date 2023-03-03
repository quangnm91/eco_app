import 'package:eco_app/data/local/authenticated_cache.dart';
import 'package:eco_app/data/local/secure_storage.dart';
import 'package:eco_app/domain/repository/auth_respository.dart';
import 'package:eco_app/domain/repository/cart_repository.dart';
import 'package:eco_app/domain/repository/category_repository.dart';
import 'package:eco_app/domain/repository/product_repository.dart';
import 'package:eco_app/domain/usecases/auth_usecase.dart';
import 'package:eco_app/domain/usecases/cart_usecases.dart';
import 'package:eco_app/domain/usecases/category_usecases.dart';
import 'package:eco_app/domain/usecases/product_usecases.dart';
import 'package:get_it/get_it.dart';

// enum InjectorState { NotInit, WasInit }

GetIt getIt = GetIt.instance;

var injector = GetIt.asNewInstance();

initInjector() {
  injector.registerLazySingleton<AuthenticatedCache>(
      () => AuthenticatedCacheImpl(secureStorage: injector()));
  injector
      .registerLazySingleton<ProductRepository>(() => ProductRepositoryImpl());
  injector.registerLazySingleton<ProductUsecases>(
      () => ProductUsecasesImpl(repository: injector()));
  injector.registerLazySingleton<CategoryRepository>(
      () => CategoryRepositoryImpl());
  injector.registerLazySingleton<CategoryUsecases>(
      () => CategoryUsecasesImpl(repository: injector()));
  injector.registerLazySingleton<CartRepository>(
      () => CartRepositoryImpl(authenticatedCache: injector()));
  injector.registerLazySingleton<CartUsecases>(
      () => CartUsecasesImpl(repository: injector()));
  injector.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());
  injector.registerLazySingleton<AuthUsecases>(
      () => AuthUsecasesImpl(repository: injector()));
  injector.registerLazySingleton<SecureStorage>(() => SecureStorageImpl());
}
