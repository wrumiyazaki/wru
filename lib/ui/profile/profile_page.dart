import 'package:auto_route/auto_route.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wru/ui/hooks/use_l10n.dart';
import 'package:wru/ui/profile/profile_view_model.dart';
import 'package:wru/ui/routes/app_route.gr.dart';
import 'package:wru/ui/theme/app_theme.dart';

//要素数増やすならview_modelとListView(edit_page側は条件分岐もある)内も
class ProfilePropList extends StatelessWidget {
  ProfilePropList({super.key});
  final l10n = useL10n();

  late List<String> profilePropList = [
    l10n.name,
    l10n.namePhonetic,
    l10n.userID,
    l10n.birthday,
    l10n.telePhoneNumber,
    l10n.email,
    l10n.gender,
    l10n.belonging1,
    l10n.belonging2,
    l10n.belonging3,
  ];

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class ProfilePage extends HookConsumerWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final l10n = useL10n();

    //プロフィール１つ分のWidget
    Widget modelToWidget(index, text) {
      return Container(
        child: Column(children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.fromLTRB(30, 20, 0, 5),
            child: Text(
              ProfilePropList().profilePropList[index],
              style: theme.textTheme.h20.copyWith(color: Colors.grey.shade700),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
            child: Text(
              '$text',
              style: theme.textTheme.h40,
            ),
          ),
        ]),
      );
    }

    return Scaffold(
      appBar: AppBar(
        //この辺を変更するときはprofile_edit_pageも変更しないといけないかも
        title: Text(l10n.profile),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          color: Colors.grey,
          onPressed: () {
            context.popRoute();
          },
        ),
        backgroundColor: theme.appColors.background,
        elevation: 0,
        actions: [
          TextButton(
            style: TextButton.styleFrom(),
            onPressed: () {
              context.router.push(ProfileEditRoute());
            },
            child: Text(
              l10n.edit,
              style: theme.textTheme.h40.copyWith(color: Colors.black),
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          modelToWidget(0, getMap[MapKey().name]),
          modelToWidget(1, getMap[MapKey().namePhonetic]),
          modelToWidget(2, getMap[MapKey().userID]),
          modelToWidget(3, getMap[MapKey().birthday]),
          modelToWidget(4, getMap[MapKey().telePhoneNumber]),
          modelToWidget(5, getMap[MapKey().email]),
          modelToWidget(6, getMap[MapKey().gender]),
          modelToWidget(7, getMap[MapKey().belonging1]),
          modelToWidget(8, getMap[MapKey().belonging2]),
          modelToWidget(9, getMap[MapKey().belonging3]),
        ],
      ),
    );
  }
}
