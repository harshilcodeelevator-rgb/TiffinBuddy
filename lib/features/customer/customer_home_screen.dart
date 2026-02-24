import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/auth_service.dart';
import '../../services/order_service.dart';
import '../../services/provider_service.dart';

class CustomerHomeScreen extends StatelessWidget {
  const CustomerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthService>();
    final providerService = context.watch<ProviderService>();
    final orderService = context.watch<OrderService>();

    final user = auth.currentUser!;
    final providers = providerService.approvedProviders;

    return Scaffold(
      appBar: AppBar(
        title: Text('Hi, ${user.name}'),
        actions: [
          IconButton(onPressed: auth.logout, icon: const Icon(Icons.logout)),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('Location: ${user.location ?? '-'}'),
          const SizedBox(height: 10),
          const Text('Available Tiffin Providers'),
          const SizedBox(height: 8),
          ...providers.map(
            (provider) => Card(
              child: ListTile(
                title: Text(provider.name),
                subtitle: Text(
                  '${provider.city} • ₹${provider.monthlyPrice}/month • ⭐${provider.rating}',
                ),
                trailing: FilledButton(
                  onPressed: () {
                    final menu = providerService.menuForProvider(provider.id);
                    if (menu.isEmpty) return;
                    orderService.placeOrder(
                      customerId: user.id,
                      providerId: provider.id,
                      itemTitle: menu.first.title,
                      amount: menu.first.price,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Sample order placed successfully')),
                    );
                  },
                  child: const Text('Order'),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Text('My Orders'),
          ...orderService.orders
              .where((o) => o.customerId == user.id)
              .map(
                (order) => ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(order.itemTitle),
                  subtitle: Text(order.status.name),
                  trailing: Text('₹${order.amount}'),
                ),
              ),
        ],
      ),
    );
  }
}
