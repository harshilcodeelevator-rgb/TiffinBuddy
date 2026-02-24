import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/auth_service.dart';
import '../../services/order_service.dart';
import '../../services/provider_service.dart';

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthService>();
    final providerService = context.watch<ProviderService>();
    final orderService = context.watch<OrderService>();

    final providers = providerService.allProviders;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Panel'),
        actions: [
          IconButton(onPressed: auth.logout, icon: const Icon(Icons.logout)),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: ListTile(
              title: const Text('Total Orders'),
              trailing: Text('${orderService.orders.length}'),
            ),
          ),
          Card(
            child: ListTile(
              title: const Text('Commission (15% sample)'),
              trailing: Text(
                '₹${(orderService.orders.fold<int>(0, (sum, o) => sum + o.amount) * 0.15).toStringAsFixed(0)}',
              ),
            ),
          ),
          const SizedBox(height: 12),
          const Text('Provider Approvals'),
          ...providers.map(
            (provider) => Card(
              child: ListTile(
                title: Text(provider.name),
                subtitle: Text(provider.isApproved ? 'Approved' : 'Pending KYC'),
                trailing: provider.isApproved
                    ? const Icon(Icons.check_circle, color: Colors.green)
                    : FilledButton(
                        onPressed: () => providerService.approveProvider(provider.id),
                        child: const Text('Approve'),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
