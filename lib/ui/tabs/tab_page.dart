import 'package:flutter/material.dart';
import 'package:wru/ui/hooks/use_router.dart';
import 'package:wru/ui/theme/app_theme.dart';
import 'package:wru/ui/xxx/xxx_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:auto_route/auto_route.dart';
import 'package:wru/ui/routes/app_route.gr.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class TabPage extends HookConsumerWidget {
  const TabPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final state = ref.watch(xxxViewModelProvider);
    final viewModel = ref.watch(xxxViewModelProvider.notifier);
    return AutoTabsRouter(
      routes: const [HomeRoute(), ExchangeRoute(), FriendRoute()],
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
                useTabRouter().setActiveIndex(index);
              },
              items: const [
                TabItem(icon: Icons.home),
                TabItem(icon: Icons.qr_code_scanner),
                TabItem(icon: Icons.groups),
              ],
              initialActiveIndex: useTabRouter().activeIndex,
            ));
      },
    );
  }
}
