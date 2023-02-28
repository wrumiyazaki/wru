import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wru/ui/hooks/use_l10n.dart';
import 'package:wru/ui/tabs/friend/friend_view_model.dart';
import 'package:wru/ui/theme/app_theme.dart';

class FriendPage extends HookConsumerWidget {
  FriendPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = useL10n();
    final theme = ref.watch(appThemeProvider);
    final boolsstate = ref.watch(boolsprovider);
    final boolsstatenotifier = ref.read(boolsprovider.notifier);

    Widget nameCard(index) {
      return Material(
        elevation: 5,
        child: Container(
          height: 250,
          width: 413.636,
          padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: GestureDetector(
            onTap: () {
              boolsstatenotifier.state[index] = !boolsstate[index];
              boolsstatenotifier.state = [...boolsstate];
            },
            child: boolsstate[index]
                ? Image.asset(
                    //firebase
                    FriendViewModel().nameCardImage[index],
                    fit: BoxFit.contain,
                  )
                : Row(
                    children: [
                      Container(
                        height: 200,
                        width: 150,
                        child: Image.network(
                          //firebase
                          FriendViewModel().portraitImage[index],
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                                width: double.infinity,
                                child: SingleChildScrollView(
                                  child: Text(
                                    FriendViewModel().memo[index],
                                    style: theme.textTheme.h40,
                                  ),
                                ),
                              ),
                            ),
                            ElevatedButton(
                              style: TextButton.styleFrom(
                                  minimumSize: Size(180, 20),
                                  backgroundColor: Colors.grey),
                              onPressed: () {
                                //firebaseにメモを保存
                              },
                              child: Text(l10n.edit),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Scrollbar(
        thumbVisibility: true,
        child: ListView.builder(
          itemCount: FriendViewModel().listlength,
          itemBuilder: (context, index) {
            return nameCard(index);
          },
        ),
      ),
    );
  }
}
