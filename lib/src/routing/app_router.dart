import 'package:flutter/material.dart';
import 'package:news_app/src/features/feeds/presentation/news_feed_screen.dart';
import 'package:news_app/src/features/onboarding/data/onboarding_repository.dart';
import 'package:news_app/src/features/onboarding/presentation/onboarding_screen.dart';
import 'package:news_app/src/routing/app_startup.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:go_router/go_router.dart';

part 'app_router.g.dart';

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  final appStartup = ref.watch(appStartupProvider);
  return GoRouter(
    initialLocation: '/feeds',
    redirect: (context, state) {
      if (appStartup.isLoading || appStartup.hasError) {
        return '/startup';
      }
      final onboardingState =
          ref.read(onboardingRepositoryProvider).requireValue;
      final onboardingCompleted = onboardingState.isOnboardingComplete();
      if (!onboardingCompleted) {
        if (state.uri.path != '/onboarding') {
          return '/onboarding';
        } else {
          return null;
        }
      }
      return null;
    },
    routes: [
      GoRoute(
        path: '/startup',
        builder: (context, state) => AppStartupWidget(
          onLoaded: (_) => const SizedBox.shrink(),
        ),
      ),
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: '/feeds',
        builder: (context, state) => const NewsFeed(),
      ),
    ],
  );
}
