import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/order.dart';
import '../../services/auth_service.dart';
import '../../services/order_service.dart';

class ProviderDashboardScreen extends StatelessWidget {
  const ProviderDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthService>();
    final orderService = context.watch<OrderService>();

    final user = auth.currentUser!;
    final providerOrders =
        orderService.orders.where((order) => order.providerId == user.id).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Dashboard'),
        actions: [
          IconButton(onPressed: auth.logout, icon: const Icon(Icons.logout)),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('Welcome ${user.name}'),
          const SizedBox(height: 12),
          Card(
            child: ListTile(
              title: const Text('Earnings (sample)'),
              subtitle: Text('₹${providerOrders.fold<int>(0, (sum, o) => sum + o.amount)}'),
            ),
          ),
          const SizedBox(height: 10),
          const Text('Incoming Orders'),
          ...providerOrders.map(
            (order) => Card(
              child: ListTile(
                title: Text(order.itemTitle),
                subtitle: Text('Current: ${order.status.name}'),
                trailing: PopupMenuButton<OrderStatus>(
                  onSelected: (status) =>
                      orderService.updateStatus(order.id, status),
                  itemBuilder: (context) => OrderStatus.values
                      .map(
                        (status) => PopupMenuItem(
                          value: status,
                          child: Text(status.name),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
