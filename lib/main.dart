import 'dart:developer';

// import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hacktheway2023/common/cubit/common_widget_cubit.dart';
import 'package:hacktheway2023/common/cubit/common_widget_state.dart';
import 'package:hacktheway2023/config/get_it.dart';
import 'package:hacktheway2023/config/size_config.dart';
import 'package:hacktheway2023/constant/app_colors.dart';
import 'package:hacktheway2023/features/authentication/cubit/authentication_cubit.dart';
import 'package:hacktheway2023/features/authentication/cubit/authentication_state.dart';
import 'package:hacktheway2023/features/authentication/screen/splash_screen.dart';
import 'package:hacktheway2023/features/buy_products/cubit/buy_products_cubit.dart';
import 'package:hacktheway2023/features/buy_products/cubit/buy_producuts_state.dart';
import 'package:hacktheway2023/features/dashboard/screen/dashboard_screen.dart';
import 'package:hacktheway2023/features/my_bids/cubit/my_bids_cubit.dart';
import 'package:hacktheway2023/features/my_bids/cubit/my_bids_state.dart';
import 'package:hacktheway2023/features/onboarding/cubit/onboarding_cubit.dart';
import 'package:hacktheway2023/features/onboarding/cubit/onboarding_state.dart';
import 'package:hacktheway2023/features/profile/cubit/profile_cubit.dart';
import 'package:hacktheway2023/features/profile/cubit/profile_state.dart';
import 'package:hacktheway2023/features/sell_products/cubit/sell_products_cubit.dart';
import 'package:hacktheway2023/features/sell_products/cubit/sell_products_state.dart';
import 'package:hacktheway2023/router/named_route.dart';

void main() async {
  setupGetIt();
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  //
  // await MessagingServices.AwesomeNotificationsInit();
  // FirebaseMessaging.onBackgroundMessage(firebaseBackgroundHandler);
  //
  // MessagingServices.foregroundNotifications();
  // MessagingServices().getFCMToken();

  // To turn off landscape mode
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );

  // ErrorWidget.builder =
  //     (FlutterErrorDetails details) => const MaintenanceScreen();
  runApp(const MyApp());
}

// @pragma('vm:entry-point')
// Future<void> firebaseBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();
//   log('Handling a background message: message');
//   final RemoteNotification? notification = message.notification;
//   final AndroidNotification? android = message.notification?.android;
//   final AppleNotification? appleNotification = message.notification?.apple;
//
//   if (notification != null &&
//       (android != null || appleNotification != null) == true) {
//     AwesomeNotifications().createNotification(
//         content: NotificationContent(
//             id: 20,
//             channelKey: 'notifications',
//             title: message.notification?.title,
//             body: message.notification?.body));
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        ///AUTHENTICATION CUBIT
        BlocProvider(
            create: (BuildContext context) =>
                AuthenticationCubit(AuthInitial())),

        ///ONBOARDING CUBIT
        BlocProvider(
            create: (BuildContext context) =>
                OnboardingCubit(OnboardingInitial())),

        ///SELL PRODUCT - START AUCTION
        BlocProvider(
            create: (BuildContext context) =>
                SellProductsCubit(StartAuctionInitial())),

        ///BUY PRODUCT
        BlocProvider(
          create: (BuildContext context) => BuyProductsCubit(
            BuyProductsInitial(),
          ),
        ),

        ///MY BIDS
        BlocProvider(
          create: (BuildContext context) => MyBidsCubit(
            MyBidsInitial(),
          ),
        ),

        ///MY PROFILE
        BlocProvider(
          create: (BuildContext context) => ProfileCubit(
            ProfileInitial(),
          ),
        ),


        ///COMMON WIDGET
        BlocProvider(
          create: (BuildContext context) => CommonWidgetCubit(
            CommonWidgetInitial(),
          ),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 800),
        minTextAdapt: true,
        builder: (BuildContext context, Widget? child) {
          return LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return OrientationBuilder(
                builder: (BuildContext context, Orientation orientation) {
                  SizeConfig().init(constraints, orientation);
                  return MaterialApp(
                    debugShowCheckedModeBanner: false,
                    title: 'Auction Buddy',
                    onGenerateRoute: GenerateRoute.generateRoute,
                    initialRoute: '/',
                    theme: ThemeData(
                      fontFamily: 'Mulish',
                      scaffoldBackgroundColor: AppColors.kPureWhite,
                    ),
                    home: const SplashScreen(),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
