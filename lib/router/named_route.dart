import 'package:flutter/material.dart';
import 'package:hacktheway2023/features/buy_products/screen/category_screen.dart';
import 'package:hacktheway2023/features/authentication/screen/login_screen.dart';
import 'package:hacktheway2023/features/authentication/screen/verify_otp.dart';
import 'package:hacktheway2023/features/dashboard/screen/dashboard_screen.dart';
import 'package:hacktheway2023/features/my_bids/screen/auction_detail_screen.dart';
import 'package:hacktheway2023/features/profile/screen/my_profile.dart';
import 'package:hacktheway2023/main.dart';

abstract class RouteName {
  RouteName._();

  // static const String loginScreen = '/loginScreen';
  static const String myProfileScreen = '/myProflileScreen';
  static const String dashboardScreen = '/dashboardScreen';

  // BUY PRODUCTS
  static const String categoryScreen = '/categoryScreen';

  ///AUTHENTICATION
  static const String sendOtpScreen = '/sendOtpScreen';
  static const String verifyOtpScreen = '/verifyOtpScreen';

  ///MY BIDS
  static const String auctionDetailsScreen = '/auctionDetailsScreen';
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

      ///AUTHENTICATION
      case RouteName.sendOtpScreen:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
          settings: settings,
        );

      case RouteName.verifyOtpScreen:
        arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (context) => VerifyOtpScreen(
            phoneNumber: arguments["phoneNumber"] as String,
          ),
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

      ///MY BIDS
      case RouteName.auctionDetailsScreen:
        arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (context) => AuctionDetailScreen(
            isMyBid: arguments['isMyBid'] as bool,
          ),
          settings: settings,
        );

      //BUY PRODUCUTS
      case RouteName.categoryScreen:
        arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (context) => CategoryScreen(
            title: arguments['title'] as String,
          ),
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
