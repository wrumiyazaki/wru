import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wru/ui/routes/app_route.gr.dart';
import 'package:wru/ui/tabs/exchange/qr_display_page.dart';

class QrScanPage extends HookConsumerWidget {
  const QrScanPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          onPressed: () async {
            context.router.popAndPush(QrDisplayRoute());
          },
          child: Text('Scan')),
    );
  }
}
