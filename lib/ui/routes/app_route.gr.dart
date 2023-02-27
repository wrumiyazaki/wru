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
import 'package:wru/ui/create_card/pages/enter_information_page.dart' as _i3;
import 'package:wru/ui/create_card/pages/select_template_page.dart' as _i2;
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
    SelectTemplateRoute.name: (routeData) {
      return _i4.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.SelectTemplatePage(),
      );
    },
    EnterInformationRoute.name: (routeData) {
      return _i4.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i3.EnterInformationPage(),
      );
    },
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/select_template',
          fullMatch: true,
        ),
        _i4.RouteConfig(
          XXXRoute.name,
          path: '/xxx',
        ),
        _i4.RouteConfig(
          SelectTemplateRoute.name,
          path: '/select_template',
        ),
        _i4.RouteConfig(
          EnterInformationRoute.name,
          path: '/enter_information',
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
/// [_i2.SelectTemplatePage]
class SelectTemplateRoute extends _i4.PageRouteInfo<void> {
  const SelectTemplateRoute()
      : super(
          SelectTemplateRoute.name,
          path: '/select_template',
        );

  static const String name = 'SelectTemplateRoute';
}

/// generated route for
/// [_i3.EnterInformationPage]
class EnterInformationRoute extends _i4.PageRouteInfo<void> {
  const EnterInformationRoute()
      : super(
          EnterInformationRoute.name,
          path: '/enter_information',
        );

  static const String name = 'EnterInformationRoute';
}
