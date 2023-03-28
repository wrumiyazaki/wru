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
import 'package:auto_route/auto_route.dart' as _i16;
import 'package:auto_route/empty_router_widgets.dart' as _i9;
import 'package:flutter/material.dart' as _i17;
import 'package:wru/ui/create_card/pages/enter_information_page.dart' as _i7;
import 'package:wru/ui/create_card/pages/select_template_page.dart' as _i6;
import 'package:wru/ui/profile/profile_edit_page.dart' as _i3;
import 'package:wru/ui/profile/profile_page.dart' as _i2;
import 'package:wru/ui/signIn/sign_in_page.dart' as _i4;
import 'package:wru/ui/signUp/sign_up_page.dart' as _i5;
import 'package:wru/ui/tabs/exchange/qr_display_page.dart' as _i10;
import 'package:wru/ui/tabs/exchange/qr_scan_page.dart' as _i11;
import 'package:wru/ui/tabs/exchange/received_interface_page.dart' as _i12;
import 'package:wru/ui/tabs/exchange/reicive_page.dart' as _i13;
import 'package:wru/ui/tabs/friend/friend_page.dart' as _i14;
import 'package:wru/ui/tabs/friend/memo_edit_page.dart' as _i15;
import 'package:wru/ui/tabs/home/home_page.dart' as _i8;
import 'package:wru/ui/tabs/tab_page.dart' as _i1;

class AppRouter extends _i16.RootStackRouter {
  AppRouter([_i17.GlobalKey<_i17.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i16.PageFactory> pagesMap = {
    TabRoute.name: (routeData) {
      return _i16.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.TabPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i16.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.ProfilePage(),
      );
    },
    ProfileEditRoute.name: (routeData) {
      return _i16.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i3.ProfileEditPage(),
      );
    },
    SignInRoute.name: (routeData) {
      return _i16.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i4.SignInPage(),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i16.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i5.SignUpPage(),
      );
    },
    SelectTemplateRoute.name: (routeData) {
      return _i16.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i6.SelectTemplatePage(),
      );
    },
    EnterInformationRoute.name: (routeData) {
      return _i16.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i7.EnterInformationPage(),
      );
    },
    HomeRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return _i16.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i8.HomePage(key: args.key),
      );
    },
    ExchangeTab.name: (routeData) {
      return _i16.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i9.EmptyRouterPage(),
      );
    },
    FriendTab.name: (routeData) {
      return _i16.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i9.EmptyRouterPage(),
      );
    },
    QrDisplayRoute.name: (routeData) {
      return _i16.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i10.QrDisplayPage(),
      );
    },
    QrScanRoute.name: (routeData) {
      final args = routeData.argsAs<QrScanRouteArgs>(
          orElse: () => const QrScanRouteArgs());
      return _i16.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i11.QrScanPage(key: args.key),
      );
    },
    ReceivedInterfaceRoute.name: (routeData) {
      final args = routeData.argsAs<ReceivedInterfaceRouteArgs>();
      return _i16.AdaptivePage<String>(
        routeData: routeData,
        child: _i12.ReceivedInterfacePage(
          key: args.key,
          info: args.info,
        ),
      );
    },
    RecieveRoute.name: (routeData) {
      final args = routeData.argsAs<RecieveRouteArgs>();
      return _i16.AdaptivePage<String>(
        routeData: routeData,
        child: _i13.RecievePage(
          key: args.key,
          info: args.info,
        ),
      );
    },
    FriendRoute.name: (routeData) {
      final args = routeData.argsAs<FriendRouteArgs>(
          orElse: () => const FriendRouteArgs());
      return _i16.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i14.FriendPage(key: args.key),
      );
    },
    MemoEditRoute.name: (routeData) {
      return _i16.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i15.MemoEditPage(),
      );
    },
  };

  @override
  List<_i16.RouteConfig> get routes => [
        _i16.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/tab',
          fullMatch: true,
        ),
        _i16.RouteConfig(
          TabRoute.name,
          path: '/tab',
          children: [
            _i16.RouteConfig(
              HomeRoute.name,
              path: 'home',
              parent: TabRoute.name,
            ),
            _i16.RouteConfig(
              ExchangeTab.name,
              path: 'exchange',
              parent: TabRoute.name,
              children: [
                _i16.RouteConfig(
                  QrDisplayRoute.name,
                  path: '',
                  parent: ExchangeTab.name,
                ),
                _i16.RouteConfig(
                  QrScanRoute.name,
                  path: 'scan',
                  parent: ExchangeTab.name,
                ),
                _i16.RouteConfig(
                  ReceivedInterfaceRoute.name,
                  path: 'receiveInterface',
                  parent: ExchangeTab.name,
                ),
                _i16.RouteConfig(
                  RecieveRoute.name,
                  path: 'receive',
                  parent: ExchangeTab.name,
                ),
              ],
            ),
            _i16.RouteConfig(
              FriendTab.name,
              path: 'friend',
              parent: TabRoute.name,
              children: [
                _i16.RouteConfig(
                  FriendRoute.name,
                  path: '',
                  parent: FriendTab.name,
                ),
                _i16.RouteConfig(
                  MemoEditRoute.name,
                  path: 'memoedit',
                  parent: FriendTab.name,
                ),
              ],
            ),
          ],
        ),
        _i16.RouteConfig(
          ProfileRoute.name,
          path: '/profile',
        ),
        _i16.RouteConfig(
          ProfileEditRoute.name,
          path: '/profile',
        ),
        _i16.RouteConfig(
          SignInRoute.name,
          path: '/signIn',
        ),
        _i16.RouteConfig(
          SignUpRoute.name,
          path: '/signUp',
        ),
        _i16.RouteConfig(
          SelectTemplateRoute.name,
          path: '/select_template',
        ),
        _i16.RouteConfig(
          EnterInformationRoute.name,
          path: '/enter_information',
        ),
      ];
}

/// generated route for
/// [_i1.TabPage]
class TabRoute extends _i16.PageRouteInfo<void> {
  const TabRoute({List<_i16.PageRouteInfo>? children})
      : super(
          TabRoute.name,
          path: '/tab',
          initialChildren: children,
        );

  static const String name = 'TabRoute';
}

/// generated route for
/// [_i2.ProfilePage]
class ProfileRoute extends _i16.PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: '/profile',
        );

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i3.ProfileEditPage]
class ProfileEditRoute extends _i16.PageRouteInfo<void> {
  const ProfileEditRoute()
      : super(
          ProfileEditRoute.name,
          path: '/profile',
        );

  static const String name = 'ProfileEditRoute';
}

/// generated route for
/// [_i4.SignInPage]
class SignInRoute extends _i16.PageRouteInfo<void> {
  const SignInRoute()
      : super(
          SignInRoute.name,
          path: '/signIn',
        );

  static const String name = 'SignInRoute';
}

/// generated route for
/// [_i5.SignUpPage]
class SignUpRoute extends _i16.PageRouteInfo<void> {
  const SignUpRoute()
      : super(
          SignUpRoute.name,
          path: '/signUp',
        );

  static const String name = 'SignUpRoute';
}

/// generated route for
/// [_i6.SelectTemplatePage]
class SelectTemplateRoute extends _i16.PageRouteInfo<void> {
  const SelectTemplateRoute()
      : super(
          SelectTemplateRoute.name,
          path: '/select_template',
        );

  static const String name = 'SelectTemplateRoute';
}

/// generated route for
/// [_i7.EnterInformationPage]
class EnterInformationRoute extends _i16.PageRouteInfo<void> {
  const EnterInformationRoute()
      : super(
          EnterInformationRoute.name,
          path: '/enter_information',
        );

  static const String name = 'EnterInformationRoute';
}

/// generated route for
/// [_i8.HomePage]
class HomeRoute extends _i16.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({_i17.Key? key})
      : super(
          HomeRoute.name,
          path: 'home',
          args: HomeRouteArgs(key: key),
        );

  static const String name = 'HomeRoute';
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key});

  final _i17.Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i9.EmptyRouterPage]
class ExchangeTab extends _i16.PageRouteInfo<void> {
  const ExchangeTab({List<_i16.PageRouteInfo>? children})
      : super(
          ExchangeTab.name,
          path: 'exchange',
          initialChildren: children,
        );

  static const String name = 'ExchangeTab';
}

/// generated route for
/// [_i9.EmptyRouterPage]
class FriendTab extends _i16.PageRouteInfo<void> {
  const FriendTab({List<_i16.PageRouteInfo>? children})
      : super(
          FriendTab.name,
          path: 'friend',
          initialChildren: children,
        );

  static const String name = 'FriendTab';
}

/// generated route for
/// [_i10.QrDisplayPage]
class QrDisplayRoute extends _i16.PageRouteInfo<void> {
  const QrDisplayRoute()
      : super(
          QrDisplayRoute.name,
          path: '',
        );

  static const String name = 'QrDisplayRoute';
}

/// generated route for
/// [_i11.QrScanPage]
class QrScanRoute extends _i16.PageRouteInfo<QrScanRouteArgs> {
  QrScanRoute({_i17.Key? key})
      : super(
          QrScanRoute.name,
          path: 'scan',
          args: QrScanRouteArgs(key: key),
        );

  static const String name = 'QrScanRoute';
}

class QrScanRouteArgs {
  const QrScanRouteArgs({this.key});

  final _i17.Key? key;

  @override
  String toString() {
    return 'QrScanRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i12.ReceivedInterfacePage]
class ReceivedInterfaceRoute
    extends _i16.PageRouteInfo<ReceivedInterfaceRouteArgs> {
  ReceivedInterfaceRoute({
    _i17.Key? key,
    required String info,
  }) : super(
          ReceivedInterfaceRoute.name,
          path: 'receiveInterface',
          args: ReceivedInterfaceRouteArgs(
            key: key,
            info: info,
          ),
        );

  static const String name = 'ReceivedInterfaceRoute';
}

class ReceivedInterfaceRouteArgs {
  const ReceivedInterfaceRouteArgs({
    this.key,
    required this.info,
  });

  final _i17.Key? key;

  final String info;

  @override
  String toString() {
    return 'ReceivedInterfaceRouteArgs{key: $key, info: $info}';
  }
}

/// generated route for
/// [_i13.RecievePage]
class RecieveRoute extends _i16.PageRouteInfo<RecieveRouteArgs> {
  RecieveRoute({
    _i17.Key? key,
    required String info,
  }) : super(
          RecieveRoute.name,
          path: 'receive',
          args: RecieveRouteArgs(
            key: key,
            info: info,
          ),
        );

  static const String name = 'RecieveRoute';
}

class RecieveRouteArgs {
  const RecieveRouteArgs({
    this.key,
    required this.info,
  });

  final _i17.Key? key;

  final String info;

  @override
  String toString() {
    return 'RecieveRouteArgs{key: $key, info: $info}';
  }
}

/// generated route for
/// [_i14.FriendPage]
class FriendRoute extends _i16.PageRouteInfo<FriendRouteArgs> {
  FriendRoute({_i17.Key? key})
      : super(
          FriendRoute.name,
          path: '',
          args: FriendRouteArgs(key: key),
        );

  static const String name = 'FriendRoute';
}

class FriendRouteArgs {
  const FriendRouteArgs({this.key});

  final _i17.Key? key;

  @override
  String toString() {
    return 'FriendRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i15.MemoEditPage]
class MemoEditRoute extends _i16.PageRouteInfo<void> {
  const MemoEditRoute()
      : super(
          MemoEditRoute.name,
          path: 'memoedit',
        );

  static const String name = 'MemoEditRoute';
}
