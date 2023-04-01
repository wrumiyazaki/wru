import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wru/data/model/received_card/received_card.dart';
import 'package:wru/ui/hooks/use_l10n.dart';
import 'package:wru/ui/routes/app_route.gr.dart';
import 'package:wru/ui/tabs/exchange/exchange_state.dart';
import 'package:wru/ui/tabs/exchange/exchange_view_model.dart';
import 'package:wru/ui/theme/app_theme.dart';

class RecievePage extends HookConsumerWidget {
  String info;
  RecievePage({super.key, required this.info});

  //受け取った文字列をカスタムクラスに戻す
  late Map<String, dynamic> receivedMap = jsonDecode(info);
  late ReceivedCard receivedCard = ReceivedCard.fromJson(receivedMap);

  Image? returnImage(String? url) {
    if (url == null) {
      return null;
    } else {
      return Image.network(
        url,
        fit: BoxFit.contain,
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final l10n = useL10n();
    final imagestate = ref.watch(imageprovider);
    final imagestatenotifier = ref.read(imageprovider.notifier);
    String memo = '';

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(10, 120, 10, 0),
            child: Text(
              style: theme.textTheme.h50
                  .copyWith(color: theme.appColors.receivePageText),
              // '$こばやしさんから名刺が届きました♪'
              '${receivedCard.card['name']}${l10n.nameCardFrom}',
            ),
            // alignment: Alignment.center,
          ),
          Container(
              height: 250,
              width: 413.636,
              padding: EdgeInsets.fromLTRB(10, 40, 10, 0),
              child: GestureDetector(
                onTap: () {
                  imagestatenotifier.state = !imagestate;
                  print(imagestate);
                },
                child: imagestate
                    ? returnImage(
                        ref.watch(receivedCardProvider).card['imgUrl'])
                    : returnImage(
                        ref.watch(receivedCardProvider).card['faceImgUrl']),
              )),
          Container(
            padding: EdgeInsets.fromLTRB(20, 40, 20, 10),
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
                  hintText: l10n.enterMemo),
              controller: TextEditingController(text: memo),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: () {
                context.router.push(const TabRoute());
                //firebaseにメモを保存
                ref.read(receivedCardProvider.notifier).changeMemo(memo, ref);
              },
              child: Text(l10n.save),
            ),
          ),
        ],
      ),
    );
  }
}
