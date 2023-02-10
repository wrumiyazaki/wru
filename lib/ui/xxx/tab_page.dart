import 'package:wru/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:wru/ui/hooks/use_l10n.dart';
import 'package:wru/ui/theme/app_text_theme.dart';
import 'package:wru/ui/theme/app_theme.dart';
import 'package:wru/ui/xxx/xxx_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:auto_route/auto_route.dart';
import 'package:wru/ui/routes/app_route.gr.dart';

class TabPage extends StatelessWidget {
  const TabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [HomeRoute(), ExchangeRoute(), FriendRoute()],
      builder: (context, child, animation) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
            body: FadeTransition(
              opacity: animation,
              child: child,
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: tabsRouter.activeIndex,
              onTap: (index) {
                tabsRouter.setActiveIndex(index);
              },
              items: const [
                BottomNavigationBarItem(label: 'Tab1', icon: Icon(Icons.check)),
                BottomNavigationBarItem(label: 'Tab2', icon: Icon(Icons.check)),
                BottomNavigationBarItem(label: 'Tab3', icon: Icon(Icons.check)),
              ],
            ));
      },
    );
  }
}
