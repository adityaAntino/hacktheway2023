import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hacktheway2023/common/common_appbar.dart';
import 'package:hacktheway2023/common/helper_function.dart';
import 'package:hacktheway2023/config/get_it.dart';
import 'package:hacktheway2023/config/size_config.dart';
import 'package:hacktheway2023/constant/app_colors.dart';
import 'package:hacktheway2023/constant/app_text_style.dart';
import 'package:hacktheway2023/constant/image_path.dart';
import 'package:hacktheway2023/features/authentication/modal/verify_otp_response_modal.dart';
import 'package:hacktheway2023/features/onboarding/modal/get_user_modal.dart';
import 'package:hacktheway2023/features/profile/cubit/profile_cubit.dart';
import 'package:hacktheway2023/features/profile/cubit/profile_state.dart';
import 'package:hacktheway2023/features/profile/widget/log_out_alert.dart';
import 'package:intl/intl.dart';

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
  UserData? userData;
  @override
  void initState() {
    context.read<ProfileCubit>().getUserDetails();
    userData = getIt.get<UserData>();
    // TODO: implement initState
    super.initState();
  }

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
          child: BlocConsumer<ProfileCubit, ProfileState>(
            listener: (context, state) {
              if (state is GetUserDetailsSuccess) {
                getIt.get<UserData>().fromModel(state.getUserDetails.data ?? UserData());
                userData = state.getUserDetails.data;
              }
            },
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ///PROFILE IMAGE
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
                  SizedBox(height: 28 * SizeConfig.heightMultiplier!),
                  Text(userData?.name ?? '',style: AppTextStyle.f20W700Grey500,),
                  SizedBox(height: 28 * SizeConfig.heightMultiplier!),

                  ///PERSONAL DETAILS
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ListTile(
                      onTap: () {
                        Fluttertoast.showToast(
                            msg: 'Personal Details Coming Soon');
                      },
                      leading: const Icon(Icons.houseboat_rounded),
                      title: const Text('Personal Details'),
                      trailing: const Icon(
                        Icons.chevron_right_sharp,
                      ),
                    ),
                  ),
                  SizedBox(height: 12 * SizeConfig.heightMultiplier!),

                  ///SETTING
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ListTile(
                      onTap: () {
                        Fluttertoast.showToast(msg: 'Settings Coming Soon');
                      },
                      leading: const Icon(Icons.settings),
                      title: const Text('Settings'),
                      trailing: const Icon(
                        Icons.chevron_right_sharp,
                      ),
                    ),
                  ),
                  SizedBox(height: 12 * SizeConfig.heightMultiplier!),

                  ///LOG OUT
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ListTile(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const LogoutAlert();
                          },
                        );
                      },
                      leading: const Icon(Icons.logout),
                      title: const Text('Log Out'),
                      trailing: const Icon(
                        Icons.chevron_right_sharp,
                      ),
                    ),
                  ),

                  const Spacer(),

                  Text('Account created: ${HelperFunction().formatDateddMMyyyyy(userData?.createdAt.toString() ?? '')}',style: AppTextStyle.f12W400grey80,),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

}
