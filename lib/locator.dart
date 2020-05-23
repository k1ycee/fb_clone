import 'package:fb_clone/services/auth_service.dart';
import 'package:fb_clone/utils/navigator.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;


void finder(){
  locator.registerLazySingleton(() => AuthService());
  locator.registerLazySingleton(() => Navigation());
}