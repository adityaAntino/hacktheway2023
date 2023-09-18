import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hacktheway2023/common/custom_screen_loader.dart';
import 'package:hacktheway2023/common/primary_button.dart';
import 'package:hacktheway2023/config/size_config.dart';
import 'package:hacktheway2023/constant/app_colors.dart';
import 'package:hacktheway2023/constant/app_text_style.dart';
import 'package:hacktheway2023/constant/image_path.dart';
import 'package:hacktheway2023/features/authentication/cubit/authentication_cubit.dart';
import 'package:hacktheway2023/features/authentication/cubit/authentication_state.dart';
import 'package:hacktheway2023/router/named_route.dart';
import 'package:hacktheway2023/router/navigation_handler.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String mobileNumber = "";
  final GlobalKey<FormFieldState> mobileNoFormFieldKey =
      GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ///To unFocus Keyboard when tapped inside the scaffold
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(ImagePath.loginHalfCircleSvg),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Login Now', style: AppTextStyle.f24W500Grey500),
                      SizedBox(height: 13 * SizeConfig.heightMultiplier!),
                      Text(
                        'Enter mobile number to get an OTP',
                        style: AppTextStyle.f14W400greyAE,
                      ),
                      SizedBox(height: 24 * SizeConfig.heightMultiplier!),

                      ///ENTER MOBILE TEXT FIELD
                      Container(
                        height: 45 * SizeConfig.heightMultiplier!,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.grey3.withOpacity(0.5),
                            ),
                            borderRadius: BorderRadius.circular(
                                8 * SizeConfig.heightMultiplier!)),
                        child: Row(
                          children: [
                            Container(
                              color: AppColors.grey3.withOpacity(0.25),
                              padding: EdgeInsets.all(
                                  12 * SizeConfig.heightMultiplier!),
                              child: const Text(
                                '+91',
                                style: TextStyle(
                                    fontFamily: 'Mulish',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16),
                              ),
                            ),
                            Container(
                                color: AppColors.grey3.withOpacity(0.25),
                                width: 1),
                            Expanded(
                              child: TextFormField(
                                maxLength: 10,
                                key: mobileNoFormFieldKey,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                onChanged: (String? newValue) {
                                  setState(() {
                                    mobileNumber = newValue ?? '';
                                  });
                                },
                                validator: (String? value) {
                                  return (value ?? '').isNotEmpty
                                      ? null
                                      : 'Enter Valid Phone Number';
                                },
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                    suffixIcon: (mobileNumber.length > 9)
                                        ? const Icon(
                                            Icons.check,
                                            color: AppColors.darkGreen05,
                                          )
                                        : const SizedBox.shrink(),
                                    errorStyle: const TextStyle(
                                        color: AppColors.kPureWhite),
                                    counterText: '',
                                    border: InputBorder.none,
                                    hintStyle: AppTextStyle.f14W400Grey80,
                                    hintText: 'Enter 10 digit mobile number',
                                    contentPadding: EdgeInsets.only(
                                      left: 12 * SizeConfig.widthMultiplier!,
                                      right: 12 * SizeConfig.widthMultiplier!,
                                      top: 5 * SizeConfig.heightMultiplier!,
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 48 * SizeConfig.heightMultiplier!),

                      BlocBuilder<AuthenticationCubit, AuthenticationState>(
                        builder: (context, state) {
                          if (state is AuthLoading) {
                            return const CustomScreenLoader();
                          }
                          if (state is AuthSuccess) {
                            BulandDarwaza.pushNamed(context,
                                routeName: RouteName.verifyOtpScreen,
                                arguments: {"phoneNumber": mobileNumber});
                            context.read<AuthenticationCubit>().resetState();
                            Fluttertoast.showToast(msg: 'Success');
                          }
                          return PrimaryButton(
                              borderRadius: 24,
                              onTap: () {
                                if (mobileNumber.length >= 10) {
                                  mobileNoFormFieldKey.currentState?.save();
                                  context
                                      .read<AuthenticationCubit>()
                                      .sendOtp(phoneNumber: mobileNumber);
                                } else {
                                  Fluttertoast.showToast(
                                      msg:
                                          'Please Enter 10 Digit Mobile Number');
                                }
                              },
                              buttonColor: AppColors.kPureBlack,
                              buttonText: 'Next');
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
