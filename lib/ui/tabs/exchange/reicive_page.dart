import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
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
    final imagestate = ref.watch(imageprovider);
    final imagestatenotifier = ref.read(imageprovider.notifier);
    final provider = ref.watch(receivedCardProvider);
    String memo = '';

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(10, 120, 10, 0),
            child: provider['infoList'][4] != null
                ? Text(
                    style: theme.textTheme.h50
                        .copyWith(color: theme.appColors.receivePageText),
                    // '小林さんから名刺が届きました♪'
                    '${provider['infoList'][4]}${l10n.nameCardFrom}',
                  )
                : null,
            // alignment: Alignment.center,
          ),
          Container(
            height: 250,
            width: 413.636,
            padding: const EdgeInsets.fromLTRB(10, 40, 10, 0),
            child: GestureDetector(
                onTap: () {
                  imagestatenotifier.state = !imagestate;
                  print(imagestate);
                },
                child: imagestate
                    ? Image.network(
                        //firebase
                        '${provider['imgUrl']}',
                        fit: BoxFit.contain,
                      )
                    : Container(
                        child: provider['faceImgUrl'] != null
                            ? Image.network(
                                //firebase
                                '${provider['faceImgUrl']}',
                                fit: BoxFit.contain,
                              )
                            : Container(
                                height: 250,
                                width: 413.636,
                                color: Colors.grey,
                              ))),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(20, 40, 20, 10),
            child: TextField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: const OutlineInputBorder(
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
                ref.watch(receivedCardProvider.notifier).saveMemo(memo);
              },
              child: Text(l10n.save),
            ),
          ),
        ],
      ),
    );
  }
}
