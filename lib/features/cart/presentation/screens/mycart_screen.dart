import 'package:bookia/core/utils/appcolour.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/core/widgets/custom_button.dart';
import 'package:bookia/core/widgets/dialogs.dart';
import 'package:bookia/features/cart/data/model/request/cart_request.dart';
import 'package:bookia/features/cart/data/model/response/cart_response/cart_item.dart';
import 'package:bookia/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:bookia/features/cart/presentation/cubit/cart_states.dart';
import 'package:bookia/features/cart/presentation/widgets/cart_list.dart';
import 'package:bookia/features/checkout/presentation/screens/checkout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MycartScreen extends StatelessWidget {
  MycartScreen({super.key});
  String? total;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit()..getCart(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('My Cart', style: getHeaderTextStyle()),
          centerTitle: true,
        ),
        body: BlocBuilder<CartCubit, CartStates>(
          buildWhen:
              (_, state) =>
                  state is CartLoading ||
                  state is CartError ||
                  state is CartSuccess ||
                  state is CartRemoveSuccess,
          builder: (context, state) {
            if (state is CartLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColours.primaryColor,
                ),
              );
            } else if (state is CartError) {
              return showErrorToast(context, 'Something went wrong');
            }
            List<CartItem> cartItems =
                context.read<CartCubit>().cart?.data?.cartItems ?? [];
            if (cartItems.isEmpty) {
              return Center(
                child: Image.asset(
                  'assets/images/empty.png',
                  color: AppColours.primaryColor,
                ),
              );
            }
            total = context.read<CartCubit>().cart?.data?.total;
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 8.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CartList(
                    cartItems: cartItems,
                    onRemove: (index) {
                      context.read<CartCubit>().removeCart(
                        CartRequest(itemId: cartItems[index].itemId),
                      );
                    },
                    onAdd: (index) {
                      context.read<CartCubit>().updateCart(
                        CartRequest(
                          itemId: cartItems[index].itemId,
                          quantity: cartItems[index].itemQuantity! + 1,
                        ),
                      );
                    },
                    onMinus: (index) {
                      context.read<CartCubit>().updateCart(
                        CartRequest(
                          itemId: cartItems[index].itemId,
                          quantity: cartItems[index].itemQuantity! - 1,
                        ),
                      );
                    },
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total:',
                        style: getBodyTextStyle(color: AppColours.grayColor),
                      ),
                      Text('$total \$', style: getBodyTextStyle()),
                    ],
                  ),
                  SizedBox(height: 20),
                  CustomButton(
                    text: 'Checkout',
                    fontsize: 20,
                    onpressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CheckoutScreen(total: total!),
                        ),
                      );
                    },
                    bcolor: AppColours.primaryColor,
                    tcolor: AppColours.backgroundColor,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
