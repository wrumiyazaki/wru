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
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:wru/ui/signIn/sign_in_page.dart' as _i2;
import 'package:wru/ui/signUp/sign_up_page.dart' as _i3;
import 'package:wru/ui/xxx/xxx_page.dart' as _i1;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    XXXRoute.name: (routeData) {
      return _i4.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.XXXPage(),
      );
    },
    SignInRoute.name: (routeData) {
      return _i4.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.SignInPage(),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i4.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i3.SignUpPage(),
      );
    },
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/signUp',
          fullMatch: true,
        ),
        _i4.RouteConfig(
          XXXRoute.name,
          path: '/xxx',
        ),
        _i4.RouteConfig(
          SignInRoute.name,
          path: '/signIn',
        ),
        _i4.RouteConfig(
          SignUpRoute.name,
          path: '/signUp',
        ),
      ];
}

/// generated route for
/// [_i1.XXXPage]
class XXXRoute extends _i4.PageRouteInfo<void> {
  const XXXRoute()
      : super(
          XXXRoute.name,
          path: '/xxx',
        );

  static const String name = 'XXXRoute';
}

/// generated route for
/// [_i2.SignInPage]
class SignInRoute extends _i4.PageRouteInfo<void> {
  const SignInRoute()
      : super(
          SignInRoute.name,
          path: '/signIn',
        );

  static const String name = 'SignInRoute';
}

/// generated route for
/// [_i3.SignUpPage]
class SignUpRoute extends _i4.PageRouteInfo<void> {
  const SignUpRoute()
      : super(
          SignUpRoute.name,
          path: '/signUp',
        );

  static const String name = 'SignUpRoute';
}
