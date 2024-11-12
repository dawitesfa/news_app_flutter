import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/src/common_widgets/custom_elevated_btn.dart';
import 'package:news_app/src/constants/gaps.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:news_app/src/features/onboarding/data/onboarding_repository.dart';

part 'app_startup.g.dart';

@riverpod
FutureOr<void> appStartup(AppStartupRef ref) async {
  ref.onDispose(() {
    //make sure all the related providers disposed
    ref.invalidate(onboardingRepositoryProvider);
  });
  await ref.watch(onboardingRepositoryProvider.future);
}

class AppStartupWidget extends ConsumerWidget {
  const AppStartupWidget({
    super.key,
    required this.onLoaded,
  });
  final WidgetBuilder onLoaded;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final startupAsync = ref.watch(appStartupProvider);
    return startupAsync.when(
      data: (_) => onLoaded(context),
      error: (err, stk) => AppStartupError(
        message: err.toString(),
        onRetry: () {},
      ),
      loading: () => const AppStartupLoading(),
    );
  }
}

class AppStartupLoading extends StatelessWidget {
  const AppStartupLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class AppStartupError extends StatelessWidget {
  const AppStartupError({
    super.key,
    required this.message,
    required this.onRetry,
  });
  final String message;
  final Function() onRetry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(message),
            Gaps.v16,
            const CustomElevatedBtn(title: 'Retry'),
          ],
        ),
      ),
    );
  }
}
