import 'package:auto_route/auto_route.dart';
import 'package:wru/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:wru/ui/hooks/use_l10n.dart';
import 'package:wru/ui/routes/app_route.gr.dart';
import 'package:wru/ui/theme/app_text_theme.dart';
import 'package:wru/ui/theme/app_theme.dart';
import 'package:wru/ui/xxx/xxx_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final state = ref.watch(xxxViewModelProvider);
    final viewModel = ref.watch(xxxViewModelProvider.notifier);
    final l10n = useL10n();

    return state.when(
      data: (data) {
        return Scaffold(
          body: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Assets.img.flutterIcon.image(width: 200),
                  Text(
                    l10n.hello,
                    style: theme.textTheme.h70.bold(),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: theme.appColors.primary,
                      onPrimary: theme.appColors.onPrimary,
                    ),
                    onPressed: viewModel.increment,
                    child: Text(
                      data.count.toString(),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () => context.router.push(ProfileRoute()),
                      child: const Text('プロフィールへ'))
                ],
              ),
            ),
          ),
        );
      },
      error: (error, stackTrace) => Text(error.toString()),
      loading: () {
        return const Scaffold(
          body: SafeArea(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }
}
