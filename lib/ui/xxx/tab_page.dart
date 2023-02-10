import 'package:wru/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:wru/ui/hooks/use_l10n.dart';
import 'package:wru/ui/theme/app_text_theme.dart';
import 'package:wru/ui/theme/app_theme.dart';
import 'package:wru/ui/xxx/xxx_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:auto_route/auto_route.dart';
import 'package:wru/ui/routes/app_route.gr.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

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
            bottomNavigationBar: ConvexAppBar(
              style: TabStyle.fixedCircle,
              color: Colors.grey,
              activeColor: Color.fromARGB(255, 161, 116, 79),
              backgroundColor: Colors.white,
              top: -30,
              height: 50,
              curveSize: 100,
              cornerRadius: 5,
              onTap: (index) {
                tabsRouter.setActiveIndex(index);
              },
              items: const [
                TabItem(icon: Icons.home),
                TabItem(icon: Icons.qr_code_scanner),
                TabItem(icon: Icons.groups),
              ],
              initialActiveIndex: tabsRouter.activeIndex,
            ));
      },
    );
  }
}
