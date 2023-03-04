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
import 'package:auto_route/auto_route.dart' as _i14;
import 'package:auto_route/empty_router_widgets.dart' as _i8;
import 'package:flutter/material.dart' as _i15;
import 'package:wru/ui/create_card/pages/enter_information_page.dart' as _i6;
import 'package:wru/ui/profile/profile_edit_page.dart' as _i3;
import 'package:wru/ui/profile/profile_page.dart' as _i2;
import 'package:wru/ui/signIn/sign_in_page.dart' as _i4;
import 'package:wru/ui/signUp/sign_up_page.dart' as _i5;
import 'package:wru/ui/tabs/exchange/qr_display_page.dart' as _i9;
import 'package:wru/ui/tabs/exchange/qr_scan_page.dart' as _i10;
import 'package:wru/ui/tabs/exchange/reicive_page.dart' as _i11;
import 'package:wru/ui/tabs/friend/friend_page.dart' as _i12;
import 'package:wru/ui/tabs/friend/memo_edit_page.dart' as _i13;
import 'package:wru/ui/tabs/home/home_page.dart' as _i7;
import 'package:wru/ui/tabs/tab_page.dart' as _i1;

class AppRouter extends _i14.RootStackRouter {
  AppRouter([_i15.GlobalKey<_i15.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i14.PageFactory> pagesMap = {
    TabRoute.name: (routeData) {
      return _i14.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.TabPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i14.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.ProfilePage(),
      );
    },
    ProfileEditRoute.name: (routeData) {
      return _i14.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i3.ProfileEditPage(),
      );
    },
    SignInRoute.name: (routeData) {
      return _i14.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i4.SignInPage(),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i14.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i5.SignUpPage(),
      );
    },
    EnterInformationRoute.name: (routeData) {
      return _i14.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i6.EnterInformationPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i14.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i7.HomePage(),
      );
    },
    ExchangeTab.name: (routeData) {
      return _i14.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i8.EmptyRouterPage(),
      );
    },
    FriendTab.name: (routeData) {
      return _i14.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i8.EmptyRouterPage(),
      );
    },
    QrDisplayRoute.name: (routeData) {
      return _i14.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i9.QrDisplayPage(),
      );
    },
    QrScanRoute.name: (routeData) {
      final args = routeData.argsAs<QrScanRouteArgs>(
          orElse: () => const QrScanRouteArgs());
      return _i14.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i10.QrScanPage(key: args.key),
      );
    },
    RecieveRoute.name: (routeData) {
      return _i14.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i11.RecievePage(),
      );
    },
    FriendRoute.name: (routeData) {
      final args = routeData.argsAs<FriendRouteArgs>(
          orElse: () => const FriendRouteArgs());
      return _i14.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i12.FriendPage(key: args.key),
      );
    },
    MemoEditRoute.name: (routeData) {
      return _i14.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i13.MemoEditPage(),
      );
    },
  };

  @override
  List<_i14.RouteConfig> get routes => [
        _i14.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/tab',
          fullMatch: true,
        ),
        _i14.RouteConfig(
          TabRoute.name,
          path: '/tab',
          children: [
            _i14.RouteConfig(
              HomeRoute.name,
              path: 'home',
              parent: TabRoute.name,
            ),
            _i14.RouteConfig(
              ExchangeTab.name,
              path: 'exchange',
              parent: TabRoute.name,
              children: [
                _i14.RouteConfig(
                  QrDisplayRoute.name,
                  path: '',
                  parent: ExchangeTab.name,
                ),
                _i14.RouteConfig(
                  QrScanRoute.name,
                  path: 'scan',
                  parent: ExchangeTab.name,
                ),
                _i14.RouteConfig(
                  RecieveRoute.name,
                  path: 'receive',
                  parent: ExchangeTab.name,
                ),
              ],
            ),
            _i14.RouteConfig(
              FriendTab.name,
              path: 'friend',
              parent: TabRoute.name,
              children: [
                _i14.RouteConfig(
                  FriendRoute.name,
                  path: '',
                  parent: FriendTab.name,
                ),
                _i14.RouteConfig(
                  MemoEditRoute.name,
                  path: 'memoedit',
                  parent: FriendTab.name,
                ),
              ],
            ),
          ],
        ),
        _i14.RouteConfig(
          ProfileRoute.name,
          path: '/profile',
        ),
        _i14.RouteConfig(
          ProfileEditRoute.name,
          path: '/profile',
        ),
        _i14.RouteConfig(
          SignInRoute.name,
          path: '/signIn',
        ),
        _i14.RouteConfig(
          SignUpRoute.name,
          path: '/signUp',
        ),
        _i14.RouteConfig(
          EnterInformationRoute.name,
          path: '/enter_information',
        ),
      ];
}

/// generated route for
/// [_i1.TabPage]
class TabRoute extends _i14.PageRouteInfo<void> {
  const TabRoute({List<_i14.PageRouteInfo>? children})
      : super(
          TabRoute.name,
          path: '/tab',
          initialChildren: children,
        );

  static const String name = 'TabRoute';
}

/// generated route for
/// [_i2.ProfilePage]
class ProfileRoute extends _i14.PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: '/profile',
        );

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i3.ProfileEditPage]
class ProfileEditRoute extends _i14.PageRouteInfo<void> {
  const ProfileEditRoute()
      : super(
          ProfileEditRoute.name,
          path: '/profile',
        );

  static const String name = 'ProfileEditRoute';
}

/// generated route for
/// [_i4.SignInPage]
class SignInRoute extends _i14.PageRouteInfo<void> {
  const SignInRoute()
      : super(
          SignInRoute.name,
          path: '/signIn',
        );

  static const String name = 'SignInRoute';
}

/// generated route for
/// [_i5.SignUpPage]
class SignUpRoute extends _i14.PageRouteInfo<void> {
  const SignUpRoute()
      : super(
          SignUpRoute.name,
          path: '/signUp',
        );

  static const String name = 'SignUpRoute';
}

/// generated route for
/// [_i6.EnterInformationPage]
class EnterInformationRoute extends _i14.PageRouteInfo<void> {
  const EnterInformationRoute()
      : super(
          EnterInformationRoute.name,
          path: '/enter_information',
        );

  static const String name = 'EnterInformationRoute';
}

/// generated route for
/// [_i7.HomePage]
class HomeRoute extends _i14.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: 'home',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i8.EmptyRouterPage]
class ExchangeTab extends _i14.PageRouteInfo<void> {
  const ExchangeTab({List<_i14.PageRouteInfo>? children})
      : super(
          ExchangeTab.name,
          path: 'exchange',
          initialChildren: children,
        );

  static const String name = 'ExchangeTab';
}

/// generated route for
/// [_i8.EmptyRouterPage]
class FriendTab extends _i14.PageRouteInfo<void> {
  const FriendTab({List<_i14.PageRouteInfo>? children})
      : super(
          FriendTab.name,
          path: 'friend',
          initialChildren: children,
        );

  static const String name = 'FriendTab';
}

/// generated route for
/// [_i9.QrDisplayPage]
class QrDisplayRoute extends _i14.PageRouteInfo<void> {
  const QrDisplayRoute()
      : super(
          QrDisplayRoute.name,
          path: '',
        );

  static const String name = 'QrDisplayRoute';
}

/// generated route for
/// [_i10.QrScanPage]
class QrScanRoute extends _i14.PageRouteInfo<QrScanRouteArgs> {
  QrScanRoute({_i15.Key? key})
      : super(
          QrScanRoute.name,
          path: 'scan',
          args: QrScanRouteArgs(key: key),
        );

  static const String name = 'QrScanRoute';
}

class QrScanRouteArgs {
  const QrScanRouteArgs({this.key});

  final _i15.Key? key;

  @override
  String toString() {
    return 'QrScanRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i11.RecievePage]
class RecieveRoute extends _i14.PageRouteInfo<void> {
  const RecieveRoute()
      : super(
          RecieveRoute.name,
          path: 'receive',
        );

  static const String name = 'RecieveRoute';
}

/// generated route for
/// [_i12.FriendPage]
class FriendRoute extends _i14.PageRouteInfo<FriendRouteArgs> {
  FriendRoute({_i15.Key? key})
      : super(
          FriendRoute.name,
          path: '',
          args: FriendRouteArgs(key: key),
        );

  static const String name = 'FriendRoute';
}

class FriendRouteArgs {
  const FriendRouteArgs({this.key});

  final _i15.Key? key;

  @override
  String toString() {
    return 'FriendRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i13.MemoEditPage]
class MemoEditRoute extends _i14.PageRouteInfo<void> {
  const MemoEditRoute()
      : super(
          MemoEditRoute.name,
          path: 'memoedit',
        );

  static const String name = 'MemoEditRoute';
}
