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
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/material.dart' as _i12;
import 'package:wru/ui/create_card/pages/enter_information_page.dart' as _i7;
import 'package:wru/ui/create_card/pages/select_template_page.dart' as _i1;
import 'package:wru/ui/profile/profile_edit_page.dart' as _i4;
import 'package:wru/ui/profile/profile_page.dart' as _i3;
import 'package:wru/ui/signIn/sign_in_page.dart' as _i5;
import 'package:wru/ui/signUp/sign_up_page.dart' as _i6;
import 'package:wru/ui/tabs/exchange/exchange_page.dart' as _i9;
import 'package:wru/ui/tabs/friend/friend_page.dart' as _i10;
import 'package:wru/ui/tabs/home/home_page.dart' as _i8;
import 'package:wru/ui/tabs/tab_page.dart' as _i2;

class AppRouter extends _i11.RootStackRouter {
  AppRouter([_i12.GlobalKey<_i12.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    SelectTemplateRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.SelectTemplatePage(),
      );
    },
    TabRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.TabPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i3.ProfilePage(),
      );
    },
    ProfileEditRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i4.ProfileEditPage(),
      );
    },
    SignInRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i5.SignInPage(),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i6.SignUpPage(),
      );
    },
    EnterInformationRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i7.EnterInformationPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i8.HomePage(),
      );
    },
    ExchangeRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i9.ExchangePage(),
      );
    },
    FriendRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i10.FriendPage(),
      );
    },
  };

  @override
  List<_i11.RouteConfig> get routes => [
        _i11.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/signUp',
          fullMatch: true,
        ),
        _i11.RouteConfig(
          SelectTemplateRoute.name,
          path: '/select_template',
        ),
        _i11.RouteConfig(
          TabRoute.name,
          path: '/tab',
          children: [
            _i11.RouteConfig(
              HomeRoute.name,
              path: 'home',
              parent: TabRoute.name,
            ),
            _i11.RouteConfig(
              ExchangeRoute.name,
              path: 'exchange',
              parent: TabRoute.name,
            ),
            _i11.RouteConfig(
              FriendRoute.name,
              path: 'friend',
              parent: TabRoute.name,
            ),
          ],
        ),
        _i11.RouteConfig(
          ProfileRoute.name,
          path: '/profile',
        ),
        _i11.RouteConfig(
          ProfileEditRoute.name,
          path: '/profile',
        ),
        _i11.RouteConfig(
          SignInRoute.name,
          path: '/signIn',
        ),
        _i11.RouteConfig(
          SignUpRoute.name,
          path: '/signUp',
        ),
        _i11.RouteConfig(
          EnterInformationRoute.name,
          path: '/enter_information',
        ),
      ];
}

/// generated route for
/// [_i1.SelectTemplatePage]
class SelectTemplateRoute extends _i11.PageRouteInfo<void> {
  const SelectTemplateRoute()
      : super(
          SelectTemplateRoute.name,
          path: '/select_template',
        );

  static const String name = 'SelectTemplateRoute';
}

/// generated route for
/// [_i2.TabPage]
class TabRoute extends _i11.PageRouteInfo<void> {
  const TabRoute({List<_i11.PageRouteInfo>? children})
      : super(
          TabRoute.name,
          path: '/tab',
          initialChildren: children,
        );

  static const String name = 'TabRoute';
}

/// generated route for
/// [_i3.ProfilePage]
class ProfileRoute extends _i11.PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: '/profile',
        );

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i4.ProfileEditPage]
class ProfileEditRoute extends _i11.PageRouteInfo<void> {
  const ProfileEditRoute()
      : super(
          ProfileEditRoute.name,
          path: '/profile',
        );

  static const String name = 'ProfileEditRoute';
}

/// generated route for
/// [_i5.SignInPage]
class SignInRoute extends _i11.PageRouteInfo<void> {
  const SignInRoute()
      : super(
          SignInRoute.name,
          path: '/signIn',
        );

  static const String name = 'SignInRoute';
}

/// generated route for
/// [_i6.SignUpPage]
class SignUpRoute extends _i11.PageRouteInfo<void> {
  const SignUpRoute()
      : super(
          SignUpRoute.name,
          path: '/signUp',
        );

  static const String name = 'SignUpRoute';
}

/// generated route for
/// [_i7.EnterInformationPage]
class EnterInformationRoute extends _i11.PageRouteInfo<void> {
  const EnterInformationRoute()
      : super(
          EnterInformationRoute.name,
          path: '/enter_information',
        );

  static const String name = 'EnterInformationRoute';
}

/// generated route for
/// [_i8.HomePage]
class HomeRoute extends _i11.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: 'home',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i9.ExchangePage]
class ExchangeRoute extends _i11.PageRouteInfo<void> {
  const ExchangeRoute()
      : super(
          ExchangeRoute.name,
          path: 'exchange',
        );

  static const String name = 'ExchangeRoute';
}

/// generated route for
/// [_i10.FriendPage]
class FriendRoute extends _i11.PageRouteInfo<void> {
  const FriendRoute()
      : super(
          FriendRoute.name,
          path: 'friend',
        );

  static const String name = 'FriendRoute';
}
