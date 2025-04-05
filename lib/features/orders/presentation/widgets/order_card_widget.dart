import 'package:bookia/core/utils/appcolour.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/features/orders/data/model/response/get_orders/order.dart';
import 'package:flutter/material.dart';

class OrderCardWidget extends StatelessWidget {
  const OrderCardWidget({super.key, required this.order});
  final Order order;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColours.borderColor, width: 1),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 40,
            offset: Offset(0, 8),
          ),
        ],
        color: AppColours.backgroundColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Order No${order.orderCode}',
                  style: getBodyTextStyle(fontSize: 16),
                ),
                Text(
                  order.orderDate ?? '',
                  style: getBodyTextStyle(
                    fontSize: 14,
                    color: AppColours.grayColor,
                  ),
                ),
              ],
            ),
            Divider(color: AppColours.grayColor, thickness: 1),
            Row(
              children: [
                Text(
                  'Total Amount: ',
                  style: getBodyTextStyle(
                    fontSize: 14,
                    color: AppColours.grayColor,
                  ),
                ),
                Text(
                  order.total.toString(),
                  style: getBodyTextStyle(fontSize: 14),
                ),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Status:',
                  style: getBodyTextStyle(
                    fontSize: 14,
                    color: AppColours.grayColor,
                  ),
                ),
                Text(
                  order.status ?? '',
                  style: getBodyTextStyle(
                    fontSize: 14,
                    color: AppColours.primaryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
