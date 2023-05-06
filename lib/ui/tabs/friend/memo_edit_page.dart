import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wru/data/repository/friend/friend_repository_impl.dart';
import 'package:wru/ui/hooks/use_l10n.dart';
import 'package:wru/ui/routes/app_route.gr.dart';
import 'package:wru/ui/tabs/exchange/exchange_state.dart';
import 'package:wru/ui/tabs/exchange/exchange_view_model.dart';
import 'package:wru/ui/tabs/friend/friend_view_model.dart';
import 'package:wru/ui/theme/app_theme.dart';

class MemoEditPage extends HookConsumerWidget {
  const MemoEditPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final l10n = useL10n();
    final imagestate = ref.watch(imageprovider);
    final imagestatenotifier = ref.read(imageprovider.notifier);
    final friendindexstate = ref.watch(frinedindexprovider);
    final friendindexnotifier = ref.read(frinedindexprovider.notifier);
    final imgProvider = ref.watch(imgListProvider);
    final faceImgProvider = ref.watch(faceImgListProvider);
    final memoProvider = ref.watch(memoListProvider);
    final memoNotifier = ref.read(memoListProvider.notifier);
    final repositoryProvider = ref.read(friendRepositoryProvider);
    String memo = memoProvider[friendindexstate];

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
                  ? Image.network(
                      //firebase
                      imgProvider[friendindexstate],
                      fit: BoxFit.contain,
                    )
                  : faceImgProvider[friendindexstate] != null
                      ? Image.network(
                          //firebase
                          faceImgProvider[friendindexstate]!,
                          fit: BoxFit.contain,
                        )
                      : Container(
                          color: Colors.grey,
                          height: 250,
                          width: 413.636,
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
                  hintText: l10n.enterMemo),
              controller: TextEditingController(text: memo),
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
                    context.router.pop();
                  },
                  child: Text('戻る'),
                ),
                ElevatedButton(
                  onPressed: () {
                    memoNotifier.state[friendindexstate] = memo;
                    context.router.push(FriendRoute());
                    //firestoreにメモを保存
                    repositoryProvider.saveMemo(friendindexstate, memo);
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
