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
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:auto_route/empty_router_widgets.dart' as _i5;
import 'package:flutter/material.dart' as _i10;
import 'package:wru/ui/profile/profile_edit_page.dart' as _i3;
import 'package:wru/ui/profile/profile_page.dart' as _i2;
import 'package:wru/ui/tabs/exchange/qr_display_page.dart' as _i7;
import 'package:wru/ui/tabs/exchange/qr_scan_page.dart' as _i8;
import 'package:wru/ui/tabs/friend/friend_page.dart' as _i6;
import 'package:wru/ui/tabs/home/home_page.dart' as _i4;
import 'package:wru/ui/tabs/tab_page.dart' as _i1;

class AppRouter extends _i9.RootStackRouter {
  AppRouter([_i10.GlobalKey<_i10.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    TabRoute.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.TabPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.ProfilePage(),
      );
    },
    ProfileEditRoute.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i3.ProfileEditPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i4.HomePage(),
      );
    },
    ExchangeTab.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i5.EmptyRouterPage(),
      );
    },
    FriendRoute.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i6.FriendPage(),
      );
    },
    QrDisplayRoute.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i7.QrDisplayPage(),
      );
    },
    QrScanRoute.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i8.QrScanPage(),
      );
    },
  };

  @override
  List<_i9.RouteConfig> get routes => [
        _i9.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/tab',
          fullMatch: true,
        ),
        _i9.RouteConfig(
          TabRoute.name,
          path: '/tab',
          children: [
            _i9.RouteConfig(
              HomeRoute.name,
              path: 'home',
              parent: TabRoute.name,
            ),
            _i9.RouteConfig(
              ExchangeTab.name,
              path: 'exchange',
              parent: TabRoute.name,
              children: [
                _i9.RouteConfig(
                  QrDisplayRoute.name,
                  path: '',
                  parent: ExchangeTab.name,
                ),
                _i9.RouteConfig(
                  QrScanRoute.name,
                  path: 'scan',
                  parent: ExchangeTab.name,
                ),
              ],
            ),
            _i9.RouteConfig(
              FriendRoute.name,
              path: 'friend',
              parent: TabRoute.name,
            ),
          ],
        ),
        _i9.RouteConfig(
          ProfileRoute.name,
          path: '/profile',
        ),
        _i9.RouteConfig(
          ProfileEditRoute.name,
          path: '/profile',
        ),
      ];
}

/// generated route for
/// [_i1.TabPage]
class TabRoute extends _i9.PageRouteInfo<void> {
  const TabRoute({List<_i9.PageRouteInfo>? children})
      : super(
          TabRoute.name,
          path: '/tab',
          initialChildren: children,
        );

  static const String name = 'TabRoute';
}

/// generated route for
/// [_i2.ProfilePage]
class ProfileRoute extends _i9.PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: '/profile',
        );

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i3.ProfileEditPage]
class ProfileEditRoute extends _i9.PageRouteInfo<void> {
  const ProfileEditRoute()
      : super(
          ProfileEditRoute.name,
          path: '/profile',
        );

  static const String name = 'ProfileEditRoute';
}

/// generated route for
/// [_i4.HomePage]
class HomeRoute extends _i9.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: 'home',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i5.EmptyRouterPage]
class ExchangeTab extends _i9.PageRouteInfo<void> {
  const ExchangeTab({List<_i9.PageRouteInfo>? children})
      : super(
          ExchangeTab.name,
          path: 'exchange',
          initialChildren: children,
        );

  static const String name = 'ExchangeTab';
}

/// generated route for
/// [_i6.FriendPage]
class FriendRoute extends _i9.PageRouteInfo<void> {
  const FriendRoute()
      : super(
          FriendRoute.name,
          path: 'friend',
        );

  static const String name = 'FriendRoute';
}

/// generated route for
/// [_i7.QrDisplayPage]
class QrDisplayRoute extends _i9.PageRouteInfo<void> {
  const QrDisplayRoute()
      : super(
          QrDisplayRoute.name,
          path: '',
        );

  static const String name = 'QrDisplayRoute';
}

/// generated route for
/// [_i8.QrScanPage]
class QrScanRoute extends _i9.PageRouteInfo<void> {
  const QrScanRoute()
      : super(
          QrScanRoute.name,
          path: 'scan',
        );

  static const String name = 'QrScanRoute';
}
