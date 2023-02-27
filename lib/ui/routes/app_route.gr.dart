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
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:wru/ui/create_card/create_card_page.dart' as _i2;
import 'package:wru/ui/create_card/create_card_state.dart' as _i7;
import 'package:wru/ui/create_card/create_card_view_model.dart' as _i8;
import 'package:wru/ui/create_card/enter_information/enter_information_page.dart'
    as _i4;
import 'package:wru/ui/create_card/select_template/select_template_page.dart'
    as _i3;
import 'package:wru/ui/xxx/xxx_page.dart' as _i1;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    XXXRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.XXXPage(),
      );
    },
    CreateCardRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.CreateCardPage(),
      );
    },
    SelectTemplateRoute.name: (routeData) {
      final args = routeData.argsAs<SelectTemplateRouteArgs>();
      return _i5.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i3.SelectTemplatePage(
          state: args.state,
          viewModel: args.viewModel,
          key: args.key,
        ),
      );
    },
    EnterInformationRoute.name: (routeData) {
      final args = routeData.argsAs<EnterInformationRouteArgs>();
      return _i5.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i4.EnterInformationPage(
          state: args.state,
          viewModel: args.viewModel,
          key: args.key,
        ),
      );
    },
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/create_card',
          fullMatch: true,
        ),
        _i5.RouteConfig(
          XXXRoute.name,
          path: '/xxx',
        ),
        _i5.RouteConfig(
          CreateCardRoute.name,
          path: '/create_card',
        ),
        _i5.RouteConfig(
          SelectTemplateRoute.name,
          path: '/select_template',
        ),
        _i5.RouteConfig(
          EnterInformationRoute.name,
          path: '/enter_information',
        ),
      ];
}

/// generated route for
/// [_i1.XXXPage]
class XXXRoute extends _i5.PageRouteInfo<void> {
  const XXXRoute()
      : super(
          XXXRoute.name,
          path: '/xxx',
        );

  static const String name = 'XXXRoute';
}

/// generated route for
/// [_i2.CreateCardPage]
class CreateCardRoute extends _i5.PageRouteInfo<void> {
  const CreateCardRoute()
      : super(
          CreateCardRoute.name,
          path: '/create_card',
        );

  static const String name = 'CreateCardRoute';
}

/// generated route for
/// [_i3.SelectTemplatePage]
class SelectTemplateRoute extends _i5.PageRouteInfo<SelectTemplateRouteArgs> {
  SelectTemplateRoute({
    required _i7.CreateCardState state,
    required _i8.CreateCardViewModel viewModel,
    _i6.Key? key,
  }) : super(
          SelectTemplateRoute.name,
          path: '/select_template',
          args: SelectTemplateRouteArgs(
            state: state,
            viewModel: viewModel,
            key: key,
          ),
        );

  static const String name = 'SelectTemplateRoute';
}

class SelectTemplateRouteArgs {
  const SelectTemplateRouteArgs({
    required this.state,
    required this.viewModel,
    this.key,
  });

  final _i7.CreateCardState state;

  final _i8.CreateCardViewModel viewModel;

  final _i6.Key? key;

  @override
  String toString() {
    return 'SelectTemplateRouteArgs{state: $state, viewModel: $viewModel, key: $key}';
  }
}

/// generated route for
/// [_i4.EnterInformationPage]
class EnterInformationRoute
    extends _i5.PageRouteInfo<EnterInformationRouteArgs> {
  EnterInformationRoute({
    required _i7.CreateCardState state,
    required _i8.CreateCardViewModel viewModel,
    _i6.Key? key,
  }) : super(
          EnterInformationRoute.name,
          path: '/enter_information',
          args: EnterInformationRouteArgs(
            state: state,
            viewModel: viewModel,
            key: key,
          ),
        );

  static const String name = 'EnterInformationRoute';
}

class EnterInformationRouteArgs {
  const EnterInformationRouteArgs({
    required this.state,
    required this.viewModel,
    this.key,
  });

  final _i7.CreateCardState state;

  final _i8.CreateCardViewModel viewModel;

  final _i6.Key? key;

  @override
  String toString() {
    return 'EnterInformationRouteArgs{state: $state, viewModel: $viewModel, key: $key}';
  }
}
