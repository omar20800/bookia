import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/features/orders/presentation/cubit/orders_cubit.dart';
import 'package:bookia/features/orders/presentation/widgets/order_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Orders', style: getHeaderTextStyle()),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: BlocProvider(
        create: (context) => OrdersCubit()..getOrders(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Center(child: Column(children: [OrderListWidget()])),
        ),
      ),
    );
  }
}
