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
import 'package:flutter/material.dart' as _i10;
import 'package:wru/ui/profile/profile_edit_page.dart' as _i3;
import 'package:wru/ui/profile/profile_page.dart' as _i2;
import 'package:wru/ui/signIn/sign_in_page.dart' as _i4;
import 'package:wru/ui/signUp/sign_up_page.dart' as _i5;
import 'package:wru/ui/tabs/exchange/exchange_page.dart' as _i7;
import 'package:wru/ui/tabs/friend/friend_page.dart' as _i8;
import 'package:wru/ui/tabs/home/home_page.dart' as _i6;
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
    SignInRoute.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i4.SignInPage(),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i5.SignUpPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i6.HomePage(),
      );
    },
    ExchangeRoute.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i7.ExchangePage(),
      );
    },
    FriendRoute.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i8.FriendPage(),
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
              ExchangeRoute.name,
              path: 'exchange',
              parent: TabRoute.name,
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
        _i9.RouteConfig(
          SignInRoute.name,
          path: '/signIn',
        ),
        _i9.RouteConfig(
          SignUpRoute.name,
          path: '/signUp',
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
/// [_i4.SignInPage]
class SignInRoute extends _i9.PageRouteInfo<void> {
  const SignInRoute()
      : super(
          SignInRoute.name,
          path: '/signIn',
        );

  static const String name = 'SignInRoute';
}

/// generated route for
/// [_i5.SignUpPage]
class SignUpRoute extends _i9.PageRouteInfo<void> {
  const SignUpRoute()
      : super(
          SignUpRoute.name,
          path: '/signUp',
        );

  static const String name = 'SignUpRoute';
}

/// generated route for
/// [_i6.HomePage]
class HomeRoute extends _i9.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: 'home',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i7.ExchangePage]
class ExchangeRoute extends _i9.PageRouteInfo<void> {
  const ExchangeRoute()
      : super(
          ExchangeRoute.name,
          path: 'exchange',
        );

  static const String name = 'ExchangeRoute';
}

/// generated route for
/// [_i8.FriendPage]
class FriendRoute extends _i9.PageRouteInfo<void> {
  const FriendRoute()
      : super(
          FriendRoute.name,
          path: 'friend',
        );

  static const String name = 'FriendRoute';
}
