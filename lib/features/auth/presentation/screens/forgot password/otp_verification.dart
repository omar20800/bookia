// ignore_for_file: prefer_const_constructors

import 'package:bookia/core/colors/appcolour.dart';
import 'package:bookia/core/functions/validation.dart';
import 'package:bookia/core/widgets/back_button.dart';
import 'package:bookia/core/widgets/custom_button.dart';
import 'package:bookia/core/widgets/dialogs.dart';
import 'package:bookia/features/auth/data/model/request/auth_request.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_states.dart';
import 'package:bookia/features/auth/presentation/widgets/register_login.dart';
import 'package:bookia/features/auth/presentation/widgets/welcome_text.dart';
import 'package:bookia/features/auth/presentation/screens/forgot%20password/reset_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';

class OtpVerification extends StatelessWidget {
  OtpVerification({super.key, required this.email});

  final String email;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: SafeArea(
        top: false,
        child: Scaffold(
          body: BlocConsumer<AuthCubit, AuthStates>(
            listener: (context, state) {
              if (state is AuthError) {
                Navigator.pop(context);
                showErrorToast(context, state.message);
              } else if (state is AuthLoading) {
                showLoadingDialog(context);
              } else if (state is AuthSuccess) {
                Navigator.pop(context);
                showSuccessToast(context, 'Valid Code');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) =>
                            ResetPassword(otp: int.parse(otpController.text)),
                  ),
                );
              } else if (state is AuthCodeResent) {
                Navigator.pop(context);
                showSuccessToast(context, 'Code Resent Successfully');
              }
            },
            builder: (context, state) {
              var cubit = context.read<AuthCubit>();
              return Form(
                key: _formKey,
                child: CustomScrollView(
                  slivers: [
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 55,
                          left: 24,
                          right: 24,
                          bottom: 24,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BackButtonTile(),
                            SizedBox(height: 20),
                            WelcomeText(text: 'OTP Verification'),
                            Text(
                              'Enter the verification code we just sent on your email address.',
                              style: TextStyle(
                                fontFamily: 'DM Serif Display',
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: AppColours.grayColor,
                              ),
                            ),
                            SizedBox(height: 30),
                            Pinput(
                              controller: otpController,
                              errorPinTheme: PinTheme(
                                width: 70,
                                height: 60,
                                textStyle: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Urbanist',
                                  fontWeight: FontWeight.w700,
                                  color: AppColours.darkColor,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColours.lightGrayColor,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: AppColours.redColor,
                                    width: 1.2,
                                  ),
                                ),
                              ),
                              focusedPinTheme: PinTheme(
                                width: 70,
                                height: 60,
                                textStyle: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Urbanist',
                                  fontWeight: FontWeight.w700,
                                  color: AppColours.darkColor,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColours.lightGrayColor,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: AppColours.primaryColor,
                                    width: 1.2,
                                  ),
                                ),
                              ),
                              validator: (value) => otpValid(value),
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              length: 6,
                              defaultPinTheme: PinTheme(
                                width: 70,
                                height: 60,
                                textStyle: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Urbanist',
                                  fontWeight: FontWeight.w700,
                                  color: AppColours.darkColor,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColours.lightGrayColor,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: AppColours.borderColor,
                                    width: 1.2,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 30),
                            CustomButton(
                              text: 'Verify',
                              onpressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  cubit.verifyCode(
                                    AuthRequest(
                                      verifyCode: int.parse(otpController.text),
                                    ),
                                  );
                                }
                              },
                              bcolor: AppColours.primaryColor,
                              tcolor: AppColours.backgroundColor,
                            ),
                            Expanded(child: SizedBox()),
                            RegisterLogin(
                              onPressed: () {
                                cubit.resendCode(AuthRequest(email: email));
                              },
                              text: 'Didn\'t received code? ',
                              textButton: 'Resend',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
