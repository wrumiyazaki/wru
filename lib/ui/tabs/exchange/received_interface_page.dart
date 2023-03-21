import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wru/data/model/received_card/received_card.dart';
import 'package:wru/ui/routes/app_route.gr.dart';
import 'package:wru/ui/tabs/exchange/exchange_view_model.dart';

class ReceivedInterfacePage extends HookConsumerWidget {
  ReceivedInterfacePage({super.key, required this.info});

  String info;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          height: 200,
          width: 300,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed: () {
              context.router.push(RecieveRoute(info: info));
              //セーブ
              //受け取ったjsonをRecivedCardに当てはめる
              final ReceivedCard receivedCard = jsonDecode(info);
              ref
                  .read(receivedCardProvider.notifier)
                  .getReceivedCard(receivedCard, ref);
            },
            child: Text('名刺を受け取る'),
          ),
        ),
      ),
    );
  }
}
