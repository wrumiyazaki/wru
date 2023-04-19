import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wru/ui/signIn/sign_in_page.dart';
import 'package:wru/ui/signIn/sign_in_view_model.dart';
import 'package:wru/ui/signUp/sign_up_page.dart';
import 'package:wru/ui/theme/app_theme.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:auto_route/auto_route.dart';
import 'package:wru/ui/routes/app_route.gr.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class TabPage extends HookConsumerWidget {
  const TabPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final signBoolProvider = ref.watch(signInOrUpProvider);

    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        //ログイン状態を確認中
        if (snapshot.connectionState == ConnectionState.waiting) {}
        //ログインしている状態
        if (snapshot.hasData) {
          return AutoTabsRouter(
            routes: const [HomeRoute(), ExchangeTab(), FriendTab()],
            builder: (context, child, animation) {
              return Scaffold(
                  body: FadeTransition(
                    opacity: animation,
                    child: child,
                  ),
                  bottomNavigationBar: ConvexAppBar(
                    style: TabStyle.fixedCircle,
                    color: theme.appColors.unselectedIcon,
                    activeColor: theme.appColors.selectedIcon,
                    backgroundColor: theme.appColors.tabBarBackground,
                    top: -30,
                    height: 50,
                    curveSize: 100,
                    cornerRadius: 5,
                    onTap: (index) {
                      AutoTabsRouter.of(context).setActiveIndex(index);
                    },
                    items: const [
                      TabItem(icon: Icons.home),
                      TabItem(icon: Icons.qr_code_scanner),
                      TabItem(icon: Icons.groups),
                    ],
                    initialActiveIndex: AutoTabsRouter.of(context).activeIndex,
                  ));
            },
          );
        }
        //ログインしていない場合
        if (signBoolProvider == true) {
          return const SignInPage();
        } else {
          return const SignUpPage();
        }
      },
    );
  }
}
