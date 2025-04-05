import 'package:bookia/core/utils/appcolour.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/core/widgets/custom_button.dart';
import 'package:bookia/features/checkout/data/model/request/place_order_request.dart';
import 'package:bookia/features/checkout/presentation/cubit/checkout_cubit.dart';
import 'package:bookia/features/checkout/presentation/cubit/checkout_states.dart';
import 'package:bookia/features/main/presentation/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class CheckoutSuccessScreen extends StatelessWidget {
  const CheckoutSuccessScreen({
    super.key,
    required this.goverbId,
    required this.name,
    required this.phone,
    required this.address,
    required this.email,
  });
  final int goverbId;
  final String name;
  final String phone;
  final String address;
  final String email;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              CheckoutCubit()..placeOrder(
                PlaceOrderRequest(
                  governorateid: goverbId,
                  name: name,
                  phone: phone,
                  address: address,
                  email: email,
                ),
              ),
      child: SafeArea(
        top: false,
        child: Scaffold(
          body: BlocBuilder<CheckoutCubit, CheckoutStates>(
            buildWhen:
                (previous, current) =>
                    current is PlaceOrderLoadingState ||
                    current is PlaceOrderSuccessState ||
                    current is PlaceOrderErrorState,
            builder: (context, state) {
              if (state is PlaceOrderSuccessState) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Lottie.asset(
                          'assets/images/success.json',
                          height: 200,
                          width: 200,
                          repeat: false,
                        ),
                        Text(
                          'SUCCESS!',
                          style: getHeaderTextStyle(fontSize: 36),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Your order will be delivered soon. Thank you for choosing our app!',
                          textAlign: TextAlign.center,
                          style: getBodyTextStyle(color: AppColours.grayColor),
                        ),
                        SizedBox(height: 20),
                        CustomButton(
                          text: 'Back to Home',
                          fontsize: 20,
                          onpressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MainScreen(),
                              ),
                            );
                          },
                          bcolor: AppColours.primaryColor,
                          tcolor: AppColours.backgroundColor,
                        ),
                      ],
                    ),
                  ),
                );
              } else if (state is PlaceOrderErrorState) {
                return Center(
                  child: Text(
                    'Error placing order. Please try again.',
                    style: getBodyTextStyle(color: AppColours.redColor),
                  ),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
