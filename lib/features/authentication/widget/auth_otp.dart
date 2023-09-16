import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacktheway2023/config/size_config.dart';
import 'package:hacktheway2023/constant/app_colors.dart';
import 'package:hacktheway2023/constant/app_text_style.dart';
import 'package:hacktheway2023/features/authentication/cubit/authentication_cubit.dart';
import 'package:hacktheway2023/features/authentication/cubit/authentication_state.dart';
import 'package:pinput/pinput.dart';

class AutoOtp extends StatelessWidget {
  final TextEditingController pincontroller;
  final FocusNode focusNode;
  final Function(String) onChanged;
  const AutoOtp(
      {Key? key,
      required this.pincontroller,
      required this.focusNode,
      required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationCubit, AuthenticationState>(
      builder: (context, state) {
        final PinTheme defaultPinTheme = PinTheme(
          width: 73 * SizeConfig.widthMultiplier!,
          height: 73 * SizeConfig.widthMultiplier!,
          textStyle: AppTextStyle.f24W700Grey500.copyWith(
            color: state is OtpFailed
                ? AppColors.baseRed
                : state is AuthSuccess
                    ? AppColors.darkGreen05
                    : AppColors.grey500,
          ),
          decoration: BoxDecoration(
            color: AppColors.kPureWhite,
            borderRadius: BorderRadius.circular(2),
            border: Border.all(
              color: state is OtpFailed
                  ? AppColors.baseRed
                  : state is AuthSuccess
                      ? AppColors.darkGreen05
                      : AppColors.grey500,
            ),
          ),
        );
        return Center(
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: Pinput(
              androidSmsAutofillMethod:
                  AndroidSmsAutofillMethod.smsUserConsentApi,
              length: 6,
              preFilledWidget: const Text('-'),
              controller: pincontroller,
              onChanged: onChanged,
              focusNode: focusNode,
              listenForMultipleSmsOnAndroid: true,
              defaultPinTheme: defaultPinTheme,
              validator: (value) {
                return (value ?? "").isEmpty || (value ?? '').length != 6
                    ? 'Invalid Otp'
                    : null;
              },
              // ),
            ),
          ),
        );
      },
    );
  }
}
