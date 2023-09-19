import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hacktheway2023/common/common_appbar.dart';
import 'package:hacktheway2023/common/common_text_field.dart';
import 'package:hacktheway2023/common/custom_screen_loader.dart';
import 'package:hacktheway2023/common/primary_button.dart';
import 'package:hacktheway2023/config/size_config.dart';
import 'package:hacktheway2023/constant/app_colors.dart';
import 'package:hacktheway2023/constant/app_text_style.dart';
import 'package:hacktheway2023/constant/image_path.dart';
import 'package:hacktheway2023/features/onboarding/cubit/onboarding_cubit.dart';
import 'package:hacktheway2023/features/onboarding/cubit/onboarding_state.dart';
import 'package:hacktheway2023/router/named_route.dart';
import 'package:hacktheway2023/router/navigation_handler.dart';

enum Gender { male, female, none }

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final TextEditingController _nameCtrl = TextEditingController();
  final TextEditingController _emailCtrl = TextEditingController();
  Gender _selectedGender = Gender.none;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ///To unFocus Keyboard when tapped inside the scaffold
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: CommonAppBar(
          isLead: false,
          title: 'Profile Details',
          appBarBgColor: AppColors.kPureBlack,
          parentContext: context,
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  SizedBox(height: 32 * SizeConfig.heightMultiplier!),

                  ///NAME
                  Text('Name', style: AppTextStyle.f16W600Black0E),
                  SizedBox(height: 8 * SizeConfig.heightMultiplier!),
                  CommonTextField(
                      textEditingController: _nameCtrl,
                      hintText: 'e.g Kshitij Bajpai'),
                  SizedBox(height: 16 * SizeConfig.heightMultiplier!),

                  ///EMAIL
                  Text('Email', style: AppTextStyle.f16W600Black0E),
                  SizedBox(height: 8 * SizeConfig.heightMultiplier!),
                  CommonTextField(
                    textEditingController: _emailCtrl,
                    textInputType: TextInputType.emailAddress,
                    hintText: 'e.g something@gmail.com',
                  ),
                  SizedBox(height: 16 * SizeConfig.heightMultiplier!),

                  ///GENDER
                  Text('Gender', style: AppTextStyle.f16W600Black0E),
                  Row(
                    children: [
                      Radio(
                          value: Gender.male,
                          groupValue: _selectedGender,
                          onChanged: (value) {
                            setState(() {
                              _selectedGender = value!;
                            });
                          }),
                      Text(
                        'Male',
                        style: AppTextStyle.f14W600Black9A,
                      ),
                      SizedBox(
                        width: 24 * SizeConfig.widthMultiplier!,
                      ),
                      Radio(
                          value: Gender.female,
                          groupValue: _selectedGender,
                          onChanged: (value) {
                            setState(() {
                              _selectedGender = value!;
                            });
                          }),
                      Text(
                        'Female',
                        style: AppTextStyle.f14W600Black9A,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<OnboardingCubit, OnboardingState>(
            builder: (context, state) {
              if (state is OnboardingLoading) {
                return const CustomScreenLoader();
              }
              if (state is OnboardingSuccess) {
                BulandDarwaza.pushReplacementNamed(context,
                    routeName: RouteName.dashboardScreen);
              }
              return PrimaryButton(
                onTap: () {
                  if (_nameCtrl.text.isEmpty) {
                    Fluttertoast.showToast(
                        msg: 'Please Enter Name to continue');
                  } else if (_emailCtrl.text.isEmpty) {
                    Fluttertoast.showToast(
                        msg: 'Please Enter Email to continue');
                  } else if (_selectedGender == Gender.none) {
                    Fluttertoast.showToast(
                        msg: 'Please Select Gender to continue');
                  } else {
                    context.read<OnboardingCubit>().updateUserDetail(
                        name: _nameCtrl.text,
                        email: _emailCtrl.text,
                        gender: _selectedGender.name);
                  }
                },
                buttonText: 'Continue',
                buttonColor: AppColors.kPureBlack,
              );
            },
          ),
        ),
      ),
    );
  }
}
