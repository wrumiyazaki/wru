import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wru/ui/routes/app_route.gr.dart';

class QrDisplayPage extends HookConsumerWidget {
  const QrDisplayPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          onPressed: () {
            context.pushRoute(const QrScanRoute());
          },
          child: Text('Display')),
    );
  }
}
