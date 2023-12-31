import 'package:flutter/material.dart';
import 'package:hacktheway2023/features/authentication/screen/splash_screen.dart';
import 'package:hacktheway2023/features/buy_products/screen/category_screen.dart';
import 'package:hacktheway2023/features/authentication/screen/login_screen.dart';
import 'package:hacktheway2023/features/authentication/screen/verify_otp.dart';
import 'package:hacktheway2023/features/buy_products/screen/place_a_bid_screen.dart';
import 'package:hacktheway2023/features/dashboard/screen/dashboard_screen.dart';
import 'package:hacktheway2023/features/my_bids/screen/auction_detail_screen.dart';
import 'package:hacktheway2023/features/my_bids/screen/payment_screen.dart';
import 'package:hacktheway2023/features/onboarding/screen/onboarding_screen.dart';
import 'package:hacktheway2023/features/profile/screen/my_profile.dart';
import 'package:hacktheway2023/features/sell_products/modal/get_auctions_modal.dart';
import 'package:hacktheway2023/features/sell_products/screen/sell_auction_detail_screen.dart';
import 'package:hacktheway2023/features/sell_products/screen/sell_product_screen.dart';
import 'package:hacktheway2023/main.dart';

abstract class RouteName {
  RouteName._();

  // static const String loginScreen = '/loginScreen';
  static const String myProfileScreen = '/myProflileScreen';
  static const String dashboardScreen = '/dashboardScreen';

  // BUY PRODUCTS
  static const String categoryScreen = '/categoryScreen';
  static const String placeABidScreen = '/placeABidScreen';

  ///AUTHENTICATION
  static const String sendOtpScreen = '/sendOtpScreen';
  static const String verifyOtpScreen = '/verifyOtpScreen';

  ///ONBOARDING
  static const String onboardingScreen = '/onboardingScreen';

  ///MY BIDS
  static const String auctionDetailsScreen = '/auctionDetailsScreen';
  static const String paymentScreen = '/paymentScreen';

  ///SELL PRODUCT
  static const String sellProductScreen = '/sellProductScreen';
  static const String sellAuctionDetailScreen = '/sellAuctionDetailScreen';
}

mixin GenerateRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final String? route = settings.name;
    final arguments = settings.arguments;
    switch (route) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
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

      ///ONBOARDING
      case RouteName.onboardingScreen:
        return MaterialPageRoute(
          builder: (context) => const OnboardingScreen(),
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
            productDetails: arguments['productDetails'] as Map<String, dynamic>,
            isWon: arguments['isWon'] as bool,
          ),
          settings: settings,
        );
      case RouteName.paymentScreen:
        arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (context) => PaymentScreen(
            amount: arguments['amount'] as String,
          ),
        );

      //BUY PRODUCTS
      case RouteName.categoryScreen:
        arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (context) => CategoryScreen(
            title: arguments['title'] as String,
          ),
          settings: settings,
        );
      case RouteName.placeABidScreen:
        arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (context) => PlaceABidScreen(
            id: arguments['id'] as String,
            baseAmount: arguments['baseAmount'] as String,
          ),
        );

      ///SELL PRODUCT
      case RouteName.sellProductScreen:
        return MaterialPageRoute(
          builder: (context) => const SellProductScreen(),
          settings: settings,
        );
      case RouteName.sellAuctionDetailScreen:
        arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (context) => SellAuctionDetailScreen(
            auctionDetail: arguments['auctionDetail'] as Datum,
          ),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
          settings: settings,
        );
    }
  }
}
