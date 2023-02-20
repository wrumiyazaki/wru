import 'package:auto_route/auto_route.dart';
import 'package:wru/ui/create_card/create_card_page.dart';
import 'package:wru/ui/routes/route_path.dart';
import 'package:wru/ui/xxx/xxx_page.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(
      path: RoutePath.appRouteXXX,
      page: XXXPage,
      // initial: true,
    ),
    AutoRoute(
      path: RoutePath.appRouteCreateCard,
      page: CreateCardPage,
      initial: true,
    ),
  ],
)
class $AppRouter {}
