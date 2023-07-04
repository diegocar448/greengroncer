import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:greengrocer/src/pages/orders/controller/all_orders_controller.dart';
import 'package:greengrocer/src/pages/orders/view/components/order_tile.dart';

class OrdersTab extends StatelessWidget {
  //const OrdersTab({super.key});
  const OrdersTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pedidos'),
      ),
      body: GetBuilder<AllOrdersController>(
        builder: (controller) {
          return GetBuilder<AllOrdersController>(
            builder: (controller) {
              return RefreshIndicator(
                onRefresh: () => controller.getAllOrders(),
                child: ListView.separated(
                  padding: const EdgeInsets.all(16),
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (controller, index) => const SizedBox(
                    height: 10,
                  ),
                  itemBuilder: (_, index) =>
                      OrderTile(order: controller.allOrders[index]),
                  itemCount: controller.allOrders.length,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
