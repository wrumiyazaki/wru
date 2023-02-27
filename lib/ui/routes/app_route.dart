import 'package:auto_route/auto_route.dart';
import 'package:wru/ui/create_card/enter_information/enter_information_page.dart';
import 'package:wru/ui/create_card/select_template/select_template_page.dart';
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
      path: RoutePath.appRouteSelectTemplate,
      page: SelectTemplatePage,
      initial: true,
    ),
    AutoRoute(
      path: RoutePath.appRouteEnterInformation,
      page: EnterInformationPage,
    )
  ],
)
class $AppRouter {}
