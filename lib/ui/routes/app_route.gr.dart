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
import 'package:auto_route/auto_route.dart' as _i13;
import 'package:auto_route/empty_router_widgets.dart' as _i8;
import 'package:flutter/material.dart' as _i14;
import 'package:wru/ui/create_card/pages/enter_information_page.dart' as _i6;
import 'package:wru/ui/profile/profile_edit_page.dart' as _i3;
import 'package:wru/ui/profile/profile_page.dart' as _i2;
import 'package:wru/ui/signIn/sign_in_page.dart' as _i4;
import 'package:wru/ui/signUp/sign_up_page.dart' as _i5;
import 'package:wru/ui/tabs/exchange/qr_display_page.dart' as _i10;
import 'package:wru/ui/tabs/exchange/qr_scan_page.dart' as _i11;
import 'package:wru/ui/tabs/exchange/reicive_page.dart' as _i12;
import 'package:wru/ui/tabs/friend/friend_page.dart' as _i9;
import 'package:wru/ui/tabs/home/home_page.dart' as _i7;
import 'package:wru/ui/tabs/tab_page.dart' as _i1;

class AppRouter extends _i13.RootStackRouter {
  AppRouter([_i14.GlobalKey<_i14.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i13.PageFactory> pagesMap = {
    TabRoute.name: (routeData) {
      return _i13.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.TabPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i13.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.ProfilePage(),
      );
    },
    ProfileEditRoute.name: (routeData) {
      return _i13.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i3.ProfileEditPage(),
      );
    },
    SignInRoute.name: (routeData) {
      return _i13.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i4.SignInPage(),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i13.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i5.SignUpPage(),
      );
    },
    EnterInformationRoute.name: (routeData) {
      return _i13.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i6.EnterInformationPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i13.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i7.HomePage(),
      );
    },
    ExchangeTab.name: (routeData) {
      return _i13.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i8.EmptyRouterPage(),
      );
    },
    FriendRoute.name: (routeData) {
      return _i13.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i9.FriendPage(),
      );
    },
    QrDisplayRoute.name: (routeData) {
      return _i13.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i10.QrDisplayPage(),
      );
    },
    QrScanRoute.name: (routeData) {
      final args = routeData.argsAs<QrScanRouteArgs>(
          orElse: () => const QrScanRouteArgs());
      return _i13.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i11.QrScanPage(key: args.key),
      );
    },
    RecieveRoute.name: (routeData) {
      return _i13.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i12.RecievePage(),
      );
    },
  };

  @override
  List<_i13.RouteConfig> get routes => [
        _i13.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/tab',
          fullMatch: true,
        ),
        _i13.RouteConfig(
          TabRoute.name,
          path: '/tab',
          children: [
            _i13.RouteConfig(
              HomeRoute.name,
              path: 'home',
              parent: TabRoute.name,
            ),
            _i13.RouteConfig(
              ExchangeTab.name,
              path: 'exchange',
              parent: TabRoute.name,
              children: [
                _i13.RouteConfig(
                  QrDisplayRoute.name,
                  path: '',
                  parent: ExchangeTab.name,
                ),
                _i13.RouteConfig(
                  QrScanRoute.name,
                  path: 'scan',
                  parent: ExchangeTab.name,
                ),
                _i13.RouteConfig(
                  RecieveRoute.name,
                  path: 'receive',
                  parent: ExchangeTab.name,
                ),
              ],
            ),
            _i13.RouteConfig(
              FriendRoute.name,
              path: 'friend',
              parent: TabRoute.name,
            ),
          ],
        ),
        _i13.RouteConfig(
          ProfileRoute.name,
          path: '/profile',
        ),
        _i13.RouteConfig(
          ProfileEditRoute.name,
          path: '/profile',
        ),
        _i13.RouteConfig(
          SignInRoute.name,
          path: '/signIn',
        ),
        _i13.RouteConfig(
          SignUpRoute.name,
          path: '/signUp',
        ),
        _i13.RouteConfig(
          EnterInformationRoute.name,
          path: '/enter_information',
        ),
      ];
}

/// generated route for
/// [_i1.TabPage]
class TabRoute extends _i13.PageRouteInfo<void> {
  const TabRoute({List<_i13.PageRouteInfo>? children})
      : super(
          TabRoute.name,
          path: '/tab',
          initialChildren: children,
        );

  static const String name = 'TabRoute';
}

/// generated route for
/// [_i2.ProfilePage]
class ProfileRoute extends _i13.PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: '/profile',
        );

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i3.ProfileEditPage]
class ProfileEditRoute extends _i13.PageRouteInfo<void> {
  const ProfileEditRoute()
      : super(
          ProfileEditRoute.name,
          path: '/profile',
        );

  static const String name = 'ProfileEditRoute';
}

/// generated route for
/// [_i4.SignInPage]
class SignInRoute extends _i13.PageRouteInfo<void> {
  const SignInRoute()
      : super(
          SignInRoute.name,
          path: '/signIn',
        );

  static const String name = 'SignInRoute';
}

/// generated route for
/// [_i5.SignUpPage]
class SignUpRoute extends _i13.PageRouteInfo<void> {
  const SignUpRoute()
      : super(
          SignUpRoute.name,
          path: '/signUp',
        );

  static const String name = 'SignUpRoute';
}

/// generated route for
/// [_i6.EnterInformationPage]
class EnterInformationRoute extends _i13.PageRouteInfo<void> {
  const EnterInformationRoute()
      : super(
          EnterInformationRoute.name,
          path: '/enter_information',
        );

  static const String name = 'EnterInformationRoute';
}

/// generated route for
/// [_i7.HomePage]
class HomeRoute extends _i13.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: 'home',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i8.EmptyRouterPage]
class ExchangeTab extends _i13.PageRouteInfo<void> {
  const ExchangeTab({List<_i13.PageRouteInfo>? children})
      : super(
          ExchangeTab.name,
          path: 'exchange',
          initialChildren: children,
        );

  static const String name = 'ExchangeTab';
}

/// generated route for
/// [_i9.FriendPage]
class FriendRoute extends _i13.PageRouteInfo<void> {
  const FriendRoute()
      : super(
          FriendRoute.name,
          path: 'friend',
        );

  static const String name = 'FriendRoute';
}

/// generated route for
/// [_i10.QrDisplayPage]
class QrDisplayRoute extends _i13.PageRouteInfo<void> {
  const QrDisplayRoute()
      : super(
          QrDisplayRoute.name,
          path: '',
        );

  static const String name = 'QrDisplayRoute';
}

/// generated route for
/// [_i11.QrScanPage]
class QrScanRoute extends _i13.PageRouteInfo<QrScanRouteArgs> {
  QrScanRoute({_i14.Key? key})
      : super(
          QrScanRoute.name,
          path: 'scan',
          args: QrScanRouteArgs(key: key),
        );

  static const String name = 'QrScanRoute';
}

class QrScanRouteArgs {
  const QrScanRouteArgs({this.key});

  final _i14.Key? key;

  @override
  String toString() {
    return 'QrScanRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i12.RecievePage]
class RecieveRoute extends _i13.PageRouteInfo<void> {
  const RecieveRoute()
      : super(
          RecieveRoute.name,
          path: 'receive',
        );

  static const String name = 'RecieveRoute';
}
