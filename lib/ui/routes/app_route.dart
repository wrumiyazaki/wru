import 'package:auto_route/auto_route.dart';
import 'package:wru/ui/routes/route_path.dart';
import 'package:wru/ui/signIn/sign_in_page.dart';
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
      path: RoutePath.appRoutSignIn,
      page: SignInPage,
      initial: true,
    )
  ],
)
class $AppRouter {}
