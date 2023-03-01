import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wru/ui/hooks/use_l10n.dart';
import 'package:wru/ui/routes/app_route.gr.dart';
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
    final friendindexstate = ref.watch(frinedindexprovider);
    final friendindexnotifier = ref.read(frinedindexprovider.notifier);
    String memo = friendsmemo[friendindexstate];

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
                      FriendViewModel().nameCardImage[friendindexstate],
                      fit: BoxFit.contain,
                    )
                  : Image.network(
                      //firebase
                      FriendViewModel().portraitImage[friendindexstate],
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
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  alignLabelWithHint: true,
                  hintText: l10n.entermemo),
              controller:
                  TextEditingController(text: friendsmemo[friendindexstate]),
              onChanged: (value) {
                memo = value;
              },
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    //firebaseにメモを保存
                    context.router.pop();
                  },
                  child: Text('戻る'),
                ),
                ElevatedButton(
                  onPressed: () {
                    friendsmemo[friendindexstate] = memo;
                    context.router.push(FriendRoute());
                    //firebaseにメモを保存
                    FriendViewModel().memoSave(friendindexstate);
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
