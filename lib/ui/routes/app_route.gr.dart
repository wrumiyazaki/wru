// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:wru/ui/xxx/exchange_page.dart' as _i3;
import 'package:wru/ui/xxx/friend_page.dart' as _i4;
import 'package:wru/ui/xxx/home_page.dart' as _i2;
import 'package:wru/ui/xxx/tab_page.dart' as _i1;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    TabRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.TabPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomePage(),
      );
    },
    ExchangeRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i3.ExchangePage(),
      );
    },
    FriendRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i4.FriendPage(),
      );
    },
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/xxx',
          fullMatch: true,
        ),
        _i5.RouteConfig(
          TabRoute.name,
          path: '/xxx',
          children: [
            _i5.RouteConfig(
              '#redirect',
              path: '',
              parent: TabRoute.name,
              redirectTo: 'home',
              fullMatch: true,
            ),
            _i5.RouteConfig(
              HomeRoute.name,
              path: 'home',
              parent: TabRoute.name,
            ),
            _i5.RouteConfig(
              ExchangeRoute.name,
              path: 'exchange',
              parent: TabRoute.name,
            ),
            _i5.RouteConfig(
              FriendRoute.name,
              path: 'friend',
              parent: TabRoute.name,
            ),
          ],
        ),
      ];
}

/// generated route for
/// [_i1.TabPage]
class TabRoute extends _i5.PageRouteInfo<void> {
  const TabRoute({List<_i5.PageRouteInfo>? children})
      : super(
          TabRoute.name,
          path: '/xxx',
          initialChildren: children,
        );

  static const String name = 'TabRoute';
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: 'home',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i3.ExchangePage]
class ExchangeRoute extends _i5.PageRouteInfo<void> {
  const ExchangeRoute()
      : super(
          ExchangeRoute.name,
          path: 'exchange',
        );

  static const String name = 'ExchangeRoute';
}

/// generated route for
/// [_i4.FriendPage]
class FriendRoute extends _i5.PageRouteInfo<void> {
  const FriendRoute()
      : super(
          FriendRoute.name,
          path: 'friend',
        );

  static const String name = 'FriendRoute';
}
