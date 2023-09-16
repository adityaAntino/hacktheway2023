import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hacktheway2023/common/commo_appbar.dart';
import 'package:hacktheway2023/common/primary_button.dart';
import 'package:hacktheway2023/config/size_config.dart';
import 'package:hacktheway2023/constant/app_colors.dart';
import 'package:hacktheway2023/constant/app_text_style.dart';
import 'package:hacktheway2023/features/authentication/cubit/authentication_cubit.dart';
import 'package:hacktheway2023/features/authentication/cubit/authentication_state.dart';
import 'package:hacktheway2023/features/authentication/widget/auth_otp.dart';
import 'package:hacktheway2023/router/named_route.dart';
import 'package:hacktheway2023/router/navigation_handler.dart';

class VerifyOtpScreen extends StatefulWidget {
  final String phoneNumber;
  const VerifyOtpScreen({super.key, required this.phoneNumber});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final TextEditingController pinController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ///To unFocus Keyboard when tapped inside the scaffold
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: CommonAppBar(
          isLead: true,
          title: '',
          appBarBgColor: AppColors.kPureWhite,
          parentContext: context,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20 * SizeConfig.heightMultiplier!),
              Text(
                'Confirm OTP',
                style: AppTextStyle.f20W700Grey500,
              ),
              SizedBox(height: 20 * SizeConfig.heightMultiplier!),
              Text(
                'A Verification code has been sent to +91-${widget.phoneNumber}',
                style: AppTextStyle.f14W400Black,
              ),
              SizedBox(height: 44 * SizeConfig.heightMultiplier!),
              Text(
                'Enter OTP below',
                style: AppTextStyle.f14W400Black,
              ),
              SizedBox(height: 20 * SizeConfig.heightMultiplier!),
              AutoOtp(
                  pincontroller: pinController,
                  focusNode: focusNode,
                  onChanged: (val) {
                    setState(() {});
                  }),
              SizedBox(
                height: 48 * SizeConfig.heightMultiplier!,
              ),
              BlocBuilder<AuthenticationCubit, AuthenticationState>(
                builder: (context, state) {
                  if (state is OtpSuccess) {
                    BulandDarwaza.pushReplacementNamed(context,
                        routeName: RouteName.dashboardScreen);
                    context
                        .read<AuthenticationCubit>().resetState();
                  } else if (state is OtpFailed) {
                    Fluttertoast.showToast(msg: 'Failed to Validate OTP');
                    context
                        .read<AuthenticationCubit>().resetState();
                  }
                  return PrimaryButton(
                      onTap: () {
                        if (pinController.text.length < 6) {
                          Fluttertoast.showToast(msg: 'Please enter valid otp');
                        } else {
                          context.read<AuthenticationCubit>().verifyOtp(
                              phoneNo: widget.phoneNumber,
                              otp: pinController.text);
                        }
                      },
                      buttonColor: AppColors.kPureBlack,
                      buttonText: 'Submit');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
