import 'package:eco_app/data/local/authenticated_cache.dart';
import 'package:eco_app/data/local/secure_storage.dart';
import 'package:eco_app/domain/repository/address_respository.dart';
import 'package:eco_app/domain/repository/auth_respository.dart';
import 'package:eco_app/domain/repository/cart_repository.dart';
import 'package:eco_app/domain/repository/category_repository.dart';
import 'package:eco_app/domain/repository/order_respository.dart';
import 'package:eco_app/domain/repository/product_repository.dart';
import 'package:eco_app/domain/repository/province_repository.dart';
import 'package:eco_app/domain/usecases/address_usecases.dart';
import 'package:eco_app/domain/usecases/auth_usecases.dart';
import 'package:eco_app/domain/usecases/cart_usecases.dart';
import 'package:eco_app/domain/usecases/category_usecases.dart';
import 'package:eco_app/domain/usecases/order_usecases.dart';
import 'package:eco_app/domain/usecases/product_usecases.dart';
import 'package:eco_app/domain/usecases/province_usecases.dart';
import 'package:get_it/get_it.dart';

// enum InjectorState { NotInit, WasInit }

GetIt getIt = GetIt.instance;

var injector = GetIt.asNewInstance();

initInjector() {
  injector.registerLazySingleton<SecureStorage>(() => SecureStorageImpl());
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
  injector.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(authenticatedCache: injector()));
  injector.registerLazySingleton<AuthUsecases>(
      () => AuthUsecasesImpl(repository: injector()));
  injector.registerLazySingleton<OrderRepository>(
      () => OrderRepositoryImpl(authenticatedCache: injector()));
  injector.registerLazySingleton<OrderUsecases>(
      () => OrderUsecasesImpl(repository: injector()));
  injector.registerLazySingleton<ProvinceRepository>(
      () => ProvinceRepositoryImpl());
  injector.registerLazySingleton<ProvinceUsecases>(
      () => ProvinceUsecasesImpl(repository: injector()));
  injector.registerLazySingleton<AddressRepository>(
      () => AddressRepositoryImpl(authenticatedCache: injector()));
  injector.registerLazySingleton<AddressUsecases>(
      () => AddressUsecasesImpl(repository: injector()));
}
