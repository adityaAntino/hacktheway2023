import 'package:get_it/get_it.dart';
import 'package:hacktheway2023/features/onboarding/modal/get_user_modal.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

void setupGetIt() async {
  getIt.registerSingletonAsync<SharedPreferences>(
          () async => SharedPreferences.getInstance());
  await GetIt.instance.isReady<SharedPreferences>();

  getIt.registerSingleton<UserData>(UserData());
}
