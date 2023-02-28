import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wru/ui/tabs/friend/friend_view_model.dart';

class FriendPage extends HookConsumerWidget {
  FriendPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                : Image.network(
                    //firebase
                    FriendViewModel().portraitImage[index],
                    fit: BoxFit.contain,
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
