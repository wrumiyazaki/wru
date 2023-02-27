import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wru/ui/hooks/use_l10n.dart';
import 'package:wru/ui/routes/app_route.gr.dart';
import 'package:wru/ui/tabs/exchange/exchange_state.dart';
import 'package:wru/ui/tabs/exchange/exchange_view_model.dart';
import 'package:wru/ui/theme/app_theme.dart';

class RecievePage extends HookConsumerWidget {
  const RecievePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final l10n = useL10n();
    final controllerstate = ref.watch(qrCodeProvider);
    String memo = '';

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(10, 100, 10, 10),
            child: Text(
              style: theme.textTheme.h50
                  .copyWith(color: theme.appColors.receivePageText),
              // '${ExchangeViewModel().yourName(controllerstate.code!)}さんから名刺が届きました♪'
              '小林${l10n.namecardfrom}',
            ),
            // alignment: Alignment.center,
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Image.network(
              'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/800px-Image_created_with_a_mobile_phone.png',
              fit: BoxFit.contain,
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
            child: TextField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  alignLabelWithHint: true,
                  hintText: l10n.entermemo),
              controller: TextEditingController(text: memo),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: () {
                context.router.push(TabRoute());
                //firebaseにメモを保存
                ExchangeViewModel().memoSave(memo);
              },
              child: Text(l10n.save),
            ),
          ),
        ],
      ),
    );
  }
}
