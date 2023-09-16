import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hacktheway2023/common/common_appbar.dart';
import 'package:hacktheway2023/common/primary_button.dart';
import 'package:hacktheway2023/config/get_it.dart';
import 'package:hacktheway2023/config/size_config.dart';
import 'package:hacktheway2023/constant/app_colors.dart';
import 'package:hacktheway2023/constant/image_path.dart';
import 'package:hacktheway2023/constant/string_constant.dart';
import 'package:hacktheway2023/features/profile/widget/log_out_alert.dart';
import 'package:hacktheway2023/router/named_route.dart';
import 'package:hacktheway2023/router/navigation_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProfileScreen extends StatefulWidget {
  final bool isBack;
  const MyProfileScreen({
    Key? key,
    this.isBack = true,
  }) : super(key: key);

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        parentContext: context,
        isLead: false,
        title: 'My Profile',
        appBarBgColor: AppColors.kPureBlack,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundColor: AppColors.transparent,
                      foregroundImage: AssetImage(ImagePath.userProfile),
                    ),
                    Container(
                        decoration: const BoxDecoration(
                            color: AppColors.blackDA,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0))),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.camera_alt),
                        ))
                  ],
                ),
              ),
              SizedBox(height: 48 * SizeConfig.heightMultiplier!),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: ListTile(
                  onTap: () {
                    Fluttertoast.showToast(msg: 'Coming Soon');
                  },
                  leading: const Icon(Icons.houseboat_rounded),
                  title: const Text('Personal Details'),
                  trailing: const Icon(
                    Icons.chevron_right_sharp,
                  ),
                ),
              ),
              const Spacer(),
              PrimaryButton(
                  borderRadius: 4,
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const LogoutAlert();
                      },
                    );
                  },
                  buttonColor: AppColors.kPureBlack,
                  buttonText: 'Log out')
            ],
          ),
        ),
      ),
    );
  }
}
