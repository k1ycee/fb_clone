import 'package:fb_clone/services/auth_service.dart';
import 'package:fb_clone/services/cloud_storage.dart';
import 'package:fb_clone/services/firestore_service.dart';
import 'package:fb_clone/utils/image_picker.dart';
import 'package:fb_clone/utils/navigator.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;


void finder(){
  locator.registerLazySingleton(() => AuthService());
  locator.registerLazySingleton(() => Navigation());
  locator.registerLazySingleton(() => FireStoreService());
  locator.registerLazySingleton(() => StorageService());
  locator.registerLazySingleton(() => ImageSelector());
}