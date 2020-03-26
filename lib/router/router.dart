import 'package:ben_demistim/utils/string_const.dart';
import 'package:ben_demistim/widgets/pages/SplashScreen.dart';
import 'package:ben_demistim/widgets/pages/entryPage.dart';
import 'package:ben_demistim/widgets/pages/home.dart';
import 'package:ben_demistim/widgets/pages/home_page.dart';
import 'package:ben_demistim/widgets/pages/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case StringConstant.route_sign_in:
        return MaterialPageRoute(
          builder: (_) => SplashScreen(),
        );
      case StringConstant.route_login:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case StringConstant.route_homePage:
        return MaterialPageRoute(builder: (_) => HomePage());
      case StringConstant.route_home:
        return MaterialPageRoute(builder: (_) => Home());
      case StringConstant.route_entry:
        return MaterialPageRoute(builder: (_) => Entries());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text(StringConstant.error_widget_not_found),
                  ),
                ));
    }
  }
}
