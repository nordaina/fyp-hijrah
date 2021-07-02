import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '/dashboard/main-menu.dart';
import '/routing/route_names.dart';
import '/views/about/about_view.dart';
import '/views/authentication/login_view.dart';
import '/views/authentication/signup_view.dart';
import '/views/episodes/episodes_view.dart';
import '/views/home/home_view.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginViewRoute:
      return _getPageRoute(LoginView(), settings.name);
    case SignUpViewRoute:
      return _getPageRoute(SignUpView(), settings.name);
    case LandingRoute:
      return _getPageRoute(HomeView(), settings.name);
    case AboutRoute:
      return _getPageRoute(AboutView(), settings.name);
    case EpisodesRoute:
      return _getPageRoute(EpisodesView(), settings.name);
    case HomeRoute:
      return _getPageRoute(MenuScreen(), settings.name);
    default:
      return _getPageRoute(HomeView(), settings.name);
  }
}

PageRoute _getPageRoute(Widget child, String routeName) {
  return _FadeRoute(child: child, routeName: routeName);
}

class _FadeRoute extends PageRouteBuilder {
  final Widget child;
  final String routeName;
  _FadeRoute({this.child, this.routeName})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              child,
          settings: RouteSettings(name: routeName),
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}
