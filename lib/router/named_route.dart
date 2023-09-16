import 'package:flutter/material.dart';
import 'package:hacktheway2023/features/home_screen/screen/dashboard_screen.dart';
import 'package:hacktheway2023/features/home_screen/screen/my_profile.dart';
import 'package:hacktheway2023/main.dart';

abstract class RouteName {
  RouteName._();

  static const String loginScreen = '/loginScreen';
  static const String myProfileScreen = '/myProflileScreen';
  static const String dashboardScreen = '/dashboardScreen';
}

mixin GenerateRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final String? route = settings.name;
    final arguments = settings.arguments;
    switch (route) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const MyHomePage(title: ''),
          settings: settings,
        );
      case RouteName.dashboardScreen:
        return MaterialPageRoute(
          builder: (context) => const DashboardScreeen(),
          settings: settings,
        );
      case RouteName.myProfileScreen:
        return MaterialPageRoute(
          builder: (context) => const MyProfileScreen(),
          settings: settings,
        );
      // case RouteName.pledgeSubmitScreen:
      //   arguments as Map<String, dynamic>;
      //   return MaterialPageRoute(
      //     builder: (context) => PledgeSubmitScreen(
      //         title: arguments["title"] as String,
      //         name: arguments["name"] as String,
      //         mobileNumber: arguments["mobileNumber"] as String),
      //   );

      default:
        return MaterialPageRoute(
          builder: (context) => const MyHomePage(title: ''),
          settings: settings,
        );
    }
  }
}
