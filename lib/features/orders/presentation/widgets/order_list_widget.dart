import 'package:bookia/core/utils/appcolour.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/features/orders/data/model/response/get_orders/order.dart';
import 'package:bookia/features/orders/presentation/cubit/orders_cubit.dart';
import 'package:bookia/features/orders/presentation/cubit/orders_states.dart';
import 'package:bookia/features/orders/presentation/widgets/order_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderListWidget extends StatelessWidget {
  const OrderListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersCubit, OrdersStates>(
      builder: (context, state) {
        List<Order>? orders = context.read<OrdersCubit>().orders?.data?.orders;

        if (state is OrdersSuccess) {
          return Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return OrderCardWidget(order: orders![index]);
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 10);
              },
              itemCount: orders?.length ?? 0,
            ),
          );
        } else if (state is OrdersLoading) {
          return const Center(
            child: CircularProgressIndicator(color: AppColours.primaryColor),
          );
        } else if (state is OrdersError) {
          return const Center(child: Text('Error loading orders'));
        } else {
          return Center(
            child: Text(
              'No orders found',
              style: getHeaderTextStyle(
                fontSize: 16,
                color: AppColours.grayColor,
              ),
            ),
          );
        }
      },
    );
  }
}
