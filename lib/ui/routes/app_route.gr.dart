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
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;
import 'package:wru/ui/profile/profilepage.dart' as _i5;
import 'package:wru/ui/tabs/exchange/exchange_page.dart' as _i3;
import 'package:wru/ui/tabs/friend/friend_page.dart' as _i4;
import 'package:wru/ui/tabs/home/home_page.dart' as _i2;
import 'package:wru/ui/tabs/tab_page.dart' as _i1;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    TabRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.TabPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomePage(),
      );
    },
    ExchangeRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i3.ExchangePage(),
      );
    },
    FriendRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i4.FriendPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i5.ProfilePage(),
      );
    },
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/tab',
          fullMatch: true,
        ),
        _i6.RouteConfig(
          TabRoute.name,
          path: '/tab',
          children: [
            _i6.RouteConfig(
              HomeRoute.name,
              path: 'home',
              parent: TabRoute.name,
              children: [
                _i6.RouteConfig(
                  '#redirect',
                  path: '',
                  parent: HomeRoute.name,
                  redirectTo: 'profile',
                  fullMatch: true,
                ),
                _i6.RouteConfig(
                  ProfileRoute.name,
                  path: 'profile',
                  parent: HomeRoute.name,
                ),
              ],
            ),
            _i6.RouteConfig(
              ExchangeRoute.name,
              path: 'exchange',
              parent: TabRoute.name,
            ),
            _i6.RouteConfig(
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
class TabRoute extends _i6.PageRouteInfo<void> {
  const TabRoute({List<_i6.PageRouteInfo>? children})
      : super(
          TabRoute.name,
          path: '/tab',
          initialChildren: children,
        );

  static const String name = 'TabRoute';
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute({List<_i6.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          path: 'home',
          initialChildren: children,
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i3.ExchangePage]
class ExchangeRoute extends _i6.PageRouteInfo<void> {
  const ExchangeRoute()
      : super(
          ExchangeRoute.name,
          path: 'exchange',
        );

  static const String name = 'ExchangeRoute';
}

/// generated route for
/// [_i4.FriendPage]
class FriendRoute extends _i6.PageRouteInfo<void> {
  const FriendRoute()
      : super(
          FriendRoute.name,
          path: 'friend',
        );

  static const String name = 'FriendRoute';
}

/// generated route for
/// [_i5.ProfilePage]
class ProfileRoute extends _i6.PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: 'profile',
        );

  static const String name = 'ProfileRoute';
}
