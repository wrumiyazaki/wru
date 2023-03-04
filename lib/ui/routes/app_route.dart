import 'package:auto_route/auto_route.dart';
import 'package:wru/ui/create_card/pages/enter_information_page.dart';
import 'package:wru/ui/create_card/pages/select_template_page.dart';
import 'package:wru/ui/profile/profile_edit_page.dart';
import 'package:wru/ui/profile/profile_page.dart';
import 'package:wru/ui/routes/route_path.dart';
import 'package:wru/ui/signIn/sign_in_page.dart';
import 'package:wru/ui/signUp/sign_up_page.dart';
import 'package:wru/ui/tabs/exchange/exchange_page.dart';
import 'package:wru/ui/tabs/friend/friend_page.dart';
import 'package:wru/ui/tabs/home/home_page.dart';
import 'package:wru/ui/tabs/tab_page.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(
      path: RoutePath.appRouteSelectTemplate,
      page: SelectTemplatePage,
      initial: true,
    ),
    AutoRoute(
      path: RoutePath.appRouteTab,
      page: TabPage,
      children: [
        //ネストする必要がある
        AutoRoute(path: 'home', page: HomePage, children: []),
        AutoRoute(path: 'exchange', page: ExchangePage),
        AutoRoute(path: 'friend', page: FriendPage),
      ],
      initial: true,
    ),
    AutoRoute(
      path: RoutePath.appRouteProfile,
      page: ProfilePage,
    ),
    AutoRoute(
      path: RoutePath.appRouteProfile,
      page: ProfileEditPage,
    ),
    AutoRoute(
      path: RoutePath.appRoutSignIn,
      page: SignInPage,
      // initial: true,
    ),
    AutoRoute(
      path: RoutePath.appRoutSignUp,
      page: SignUpPage,
      // initial: true,
    ),
    AutoRoute(
      path: RoutePath.appRouteEnterInformation,
      page: EnterInformationPage,
    )
  ],
)
class $AppRouter {}
