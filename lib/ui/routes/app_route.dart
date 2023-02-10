import 'package:auto_route/auto_route.dart';
import 'package:wru/ui/routes/route_path.dart';
import 'package:wru/ui/xxx/tab_page.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(
      path: RoutePath.appRouteXXX,
      page: TabPage,
      initial: true,
    ),
  ],
)
class $AppRouter {}
