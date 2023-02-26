import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wru/ui/routes/app_route.gr.dart';
import 'package:wru/ui/tabs/exchange/exchange_state.dart';
import 'package:wru/ui/tabs/exchange/exchange_view_model.dart';

class QrDisplayPage extends HookConsumerWidget {
  const QrDisplayPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final absorb = ref.watch(absorbProvider);
    final absorbnotifier = ref.watch(absorbProvider.notifier);

    return Container(
      padding: const EdgeInsets.all(8.0),
      child: AbsorbPointer(
        //childのWidgetの操作を受け付けるか
        absorbing: absorb,
        child: ElevatedButton(
            onPressed: () async {
              absorbnotifier.state = true;
              context.router.push(QrScanRoute());
              await Future.delayed(Duration(milliseconds: 300));
              absorbnotifier.state = false;
            },
            child: Text('Display')),
      ),
    );
  }
}
