import 'package:flutter_study_mvvm/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:flutter_study_mvvm/ui/theme/app_text_theme.dart';
import 'package:flutter_study_mvvm/ui/theme/app_theme.dart';
import 'package:flutter_study_mvvm/ui/xxx/xxx_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class XXXPage extends HookConsumerWidget {
  const XXXPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final state = ref.watch(xxxViewModelProvider);
    final viewModel = ref.watch(xxxViewModelProvider.notifier);

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
                    L10n.of(context)!.hello,
                    style: theme.textTheme.h70.bold(),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: theme.appColors.primary,
                          onPrimary: theme.appColors.onPrimary),
                      onPressed: viewModel.increment,
                      child: Text(data.count.toString()))
                ],
              )),
            ),
          );
        },
        error: (error, stackTrace) => Text(error.toString()),
        loading: () {
          return const Scaffold(
            body: SafeArea(
                child: Center(
              child: CircularProgressIndicator(),
            )),
          );
        });
  }
}
