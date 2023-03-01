import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wru/ui/hooks/use_l10n.dart';
import 'package:wru/ui/routes/app_route.gr.dart';
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
    final friendindexnotifier = ref.read(frinedindexprovider.notifier);

    Widget nameCard(index) {
      return Material(
        elevation: 5,
        child: Container(
          height: 250,
          width: 413.636,
          padding: EdgeInsets.fromLTRB(10, 20, 20, 0),
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
                                    friendsmemo[index],
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
                                friendindexnotifier.state = index;
                                context.pushRoute(MemoEditRoute());
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
        thickness: 7,
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
