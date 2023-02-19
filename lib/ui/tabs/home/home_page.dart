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
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: ElevatedButton(
            onPressed: () => context.router.push(ProfileRoute()),
            child: const Text('プロフィールへ')),
      )),
    );
  }
}
