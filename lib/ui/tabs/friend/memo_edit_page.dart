import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wru/ui/hooks/use_l10n.dart';
import 'package:wru/ui/tabs/exchange/exchange_state.dart';
import 'package:wru/ui/tabs/friend/friend_view_model.dart';
import 'package:wru/ui/theme/app_theme.dart';

class MemoEditPage extends HookConsumerWidget {
  const MemoEditPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final l10n = useL10n();
    final controllerstate = ref.watch(qrCodeProvider);
    final imagestate = ref.watch(imageprovider);
    final imagestatenotifier = ref.read(imageprovider.notifier);
    String memo = '';

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(10, 120, 10, 0),
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
                  ? Image.asset(
                      //firebase
                      'assets/img/namecard-sample.png',
                      fit: BoxFit.contain,
                    )
                  : Image.network(
                      //firebase
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/800px-Image_created_with_a_mobile_phone.png',
                      fit: BoxFit.contain,
                    ),
            ),
          ),
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
                  hintText: l10n.entermemo),
              controller: TextEditingController(text: memo),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // context.router.push(TabRoute());
                    //firebaseにメモを保存
                    context.router.pop();
                    FriendViewModel().memoSave(memo);
                  },
                  child: Text('戻る'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // context.router.push(TabRoute());
                    //firebaseにメモを保存
                    FriendViewModel().memoSave(memo);
                  },
                  child: Text(l10n.save),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
