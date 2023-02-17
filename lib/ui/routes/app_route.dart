import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:wru/ui/profile/profile_page.dart';
import 'package:wru/ui/routes/route_path.dart';
import 'package:wru/ui/tabs/exchange/exchange_page.dart';
import 'package:wru/ui/tabs/friend/friend_page.dart';
import 'package:wru/ui/tabs/home/home_page.dart';
import 'package:wru/ui/tabs/tab_page.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(
        path: RoutePath.appRouteTab,
        page: TabPage,
        children: [
          //ネストする必要がある
          AutoRoute(path: 'home', page: HomePage, children: []),
          AutoRoute(path: 'exchange', page: ExchangePage),
          AutoRoute(path: 'friend', page: FriendPage),
        ],
        initial: true),
    AutoRoute(
      path: RoutePath.appRouteProfile,
      page: ProfilePage,
    )
  ],
)
class $AppRouter {}
