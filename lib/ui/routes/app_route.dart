import 'package:auto_route/auto_route.dart';
import 'package:wru/ui/routes/route_path.dart';
import 'package:wru/ui/xxx/exchange_page.dart';
import 'package:wru/ui/xxx/friend_page.dart';
import 'package:wru/ui/xxx/home_page.dart';
import 'package:wru/ui/xxx/tab_page.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(
      path: RoutePath.appRouteXXX,
      page: TabPage,
      children: [
        AutoRoute(path: 'home', page: HomePage, initial: true),
        AutoRoute(path: 'exchange', page: ExchangePage),
        AutoRoute(path: 'friend', page: FriendPage),
      ],
      initial: true,
    ),
  ],
)
class $AppRouter {}
