import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/src/common_widgets/custom_elevated_btn.dart';
import 'package:news_app/src/constants/gaps.dart';
import 'package:news_app/src/features/onboarding/presentation/onboarding_controller.dart';

class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('How are you'),
            Gaps.v16,
            CustomElevatedBtn(
              title: 'Get Started',
              onTap: () async {
                await ref
                    .read(onboardingControllerProvider.notifier)
                    .completeOnboarding();
                if (context.mounted) context.go('/feeds');
              },
            ),
          ],
        ),
      ),
    );
  }
}
