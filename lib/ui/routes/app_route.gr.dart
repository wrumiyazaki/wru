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
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:wru/ui/create_card/enter_information/enter_information_page.dart'
    as _i2;
import 'package:wru/ui/xxx/xxx_page.dart' as _i1;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    XXXRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.XXXPage(),
      );
    },
    EnterInformationRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.EnterInformationPage(),
      );
    },
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/enter_information',
          fullMatch: true,
        ),
        _i3.RouteConfig(
          XXXRoute.name,
          path: '/xxx',
        ),
        _i3.RouteConfig(
          EnterInformationRoute.name,
          path: '/enter_information',
        ),
      ];
}

/// generated route for
/// [_i1.XXXPage]
class XXXRoute extends _i3.PageRouteInfo<void> {
  const XXXRoute()
      : super(
          XXXRoute.name,
          path: '/xxx',
        );

  static const String name = 'XXXRoute';
}

/// generated route for
/// [_i2.EnterInformationPage]
class EnterInformationRoute extends _i3.PageRouteInfo<void> {
  const EnterInformationRoute()
      : super(
          EnterInformationRoute.name,
          path: '/enter_information',
        );

  static const String name = 'EnterInformationRoute';
}
