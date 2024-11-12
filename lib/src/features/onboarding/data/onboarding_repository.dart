import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'onboarding_repository.g.dart';

class OnboardingRepository {
  final SharedPreferences _prefs;
  static const String onboardingKey = 'onboarding_key';

  OnboardingRepository(this._prefs);

  Future<void> setOnboardingComplete() async {
    await _prefs.setBool(onboardingKey, true);
  }

  bool isOnboardingComplete() => _prefs.getBool(onboardingKey) ?? false;
}

@Riverpod(keepAlive: true)
FutureOr<OnboardingRepository> onboardingRepository(
    OnboardingRepositoryRef ref) async {
  return OnboardingRepository(
    await SharedPreferences.getInstance(),
  );
}
