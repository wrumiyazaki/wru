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
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:auto_route/empty_router_widgets.dart' as _i5;
import 'package:flutter/material.dart' as _i11;
import 'package:wru/ui/profile/profile_edit_page.dart' as _i3;
import 'package:wru/ui/profile/profile_page.dart' as _i2;
import 'package:wru/ui/tabs/exchange/qr_display_page.dart' as _i7;
import 'package:wru/ui/tabs/exchange/qr_scan_page.dart' as _i8;
import 'package:wru/ui/tabs/exchange/reicive_page.dart' as _i9;
import 'package:wru/ui/tabs/friend/friend_page.dart' as _i6;
import 'package:wru/ui/tabs/home/home_page.dart' as _i4;
import 'package:wru/ui/tabs/tab_page.dart' as _i1;

class AppRouter extends _i10.RootStackRouter {
  AppRouter([_i11.GlobalKey<_i11.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    TabRoute.name: (routeData) {
      return _i10.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.TabPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i10.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.ProfilePage(),
      );
    },
    ProfileEditRoute.name: (routeData) {
      return _i10.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i3.ProfileEditPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i10.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i4.HomePage(),
      );
    },
    ExchangeTab.name: (routeData) {
      return _i10.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i5.EmptyRouterPage(),
      );
    },
    FriendRoute.name: (routeData) {
      return _i10.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i6.FriendPage(),
      );
    },
    QrDisplayRoute.name: (routeData) {
      return _i10.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i7.QrDisplayPage(),
      );
    },
    QrScanRoute.name: (routeData) {
      final args = routeData.argsAs<QrScanRouteArgs>(
          orElse: () => const QrScanRouteArgs());
      return _i10.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i8.QrScanPage(key: args.key),
      );
    },
    RecieveRoute.name: (routeData) {
      return _i10.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i9.RecievePage(),
      );
    },
  };

  @override
  List<_i10.RouteConfig> get routes => [
        _i10.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/tab',
          fullMatch: true,
        ),
        _i10.RouteConfig(
          TabRoute.name,
          path: '/tab',
          children: [
            _i10.RouteConfig(
              HomeRoute.name,
              path: 'home',
              parent: TabRoute.name,
            ),
            _i10.RouteConfig(
              ExchangeTab.name,
              path: 'exchange',
              parent: TabRoute.name,
              children: [
                _i10.RouteConfig(
                  QrDisplayRoute.name,
                  path: '',
                  parent: ExchangeTab.name,
                ),
                _i10.RouteConfig(
                  QrScanRoute.name,
                  path: 'scan',
                  parent: ExchangeTab.name,
                ),
                _i10.RouteConfig(
                  RecieveRoute.name,
                  path: 'receive',
                  parent: ExchangeTab.name,
                ),
              ],
            ),
            _i10.RouteConfig(
              FriendRoute.name,
              path: 'friend',
              parent: TabRoute.name,
            ),
          ],
        ),
        _i10.RouteConfig(
          ProfileRoute.name,
          path: '/profile',
        ),
        _i10.RouteConfig(
          ProfileEditRoute.name,
          path: '/profile',
        ),
      ];
}

/// generated route for
/// [_i1.TabPage]
class TabRoute extends _i10.PageRouteInfo<void> {
  const TabRoute({List<_i10.PageRouteInfo>? children})
      : super(
          TabRoute.name,
          path: '/tab',
          initialChildren: children,
        );

  static const String name = 'TabRoute';
}

/// generated route for
/// [_i2.ProfilePage]
class ProfileRoute extends _i10.PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: '/profile',
        );

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i3.ProfileEditPage]
class ProfileEditRoute extends _i10.PageRouteInfo<void> {
  const ProfileEditRoute()
      : super(
          ProfileEditRoute.name,
          path: '/profile',
        );

  static const String name = 'ProfileEditRoute';
}

/// generated route for
/// [_i4.HomePage]
class HomeRoute extends _i10.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: 'home',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i5.EmptyRouterPage]
class ExchangeTab extends _i10.PageRouteInfo<void> {
  const ExchangeTab({List<_i10.PageRouteInfo>? children})
      : super(
          ExchangeTab.name,
          path: 'exchange',
          initialChildren: children,
        );

  static const String name = 'ExchangeTab';
}

/// generated route for
/// [_i6.FriendPage]
class FriendRoute extends _i10.PageRouteInfo<void> {
  const FriendRoute()
      : super(
          FriendRoute.name,
          path: 'friend',
        );

  static const String name = 'FriendRoute';
}

/// generated route for
/// [_i7.QrDisplayPage]
class QrDisplayRoute extends _i10.PageRouteInfo<void> {
  const QrDisplayRoute()
      : super(
          QrDisplayRoute.name,
          path: '',
        );

  static const String name = 'QrDisplayRoute';
}

/// generated route for
/// [_i8.QrScanPage]
class QrScanRoute extends _i10.PageRouteInfo<QrScanRouteArgs> {
  QrScanRoute({_i11.Key? key})
      : super(
          QrScanRoute.name,
          path: 'scan',
          args: QrScanRouteArgs(key: key),
        );

  static const String name = 'QrScanRoute';
}

class QrScanRouteArgs {
  const QrScanRouteArgs({this.key});

  final _i11.Key? key;

  @override
  String toString() {
    return 'QrScanRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i9.RecievePage]
class RecieveRoute extends _i10.PageRouteInfo<void> {
  const RecieveRoute()
      : super(
          RecieveRoute.name,
          path: 'receive',
        );

  static const String name = 'RecieveRoute';
}
