import 'package:flutter/material.dart';

import 'informations_page.dart';
import 'login_page.dart';

class PageRoutes {
  static const String loginPage = '/loginPage';
  static const String informationsPage = '/informationsPage';

  static buildRoute(RouteSettings settings) {
    String name = settings.name ?? '';
    Uri uri = Uri.parse(name);

    switch (uri.path) {
      case loginPage:
        return MaterialPageRoute(
          builder: (context) => const LoginPage(),
          settings: settings,
        );

      case informationsPage:
        return MaterialPageRoute(
          builder: (context) => const InformationsPage(),
          settings: settings,
        );
    }
  }
}
