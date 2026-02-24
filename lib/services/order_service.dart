import 'package:flutter/material.dart';

import '../models/order.dart';

class OrderService extends ChangeNotifier {
  final List<OrderModel> _orders = [];

  List<OrderModel> get orders => List.unmodifiable(_orders);

  void placeOrder({
    required String customerId,
    required String providerId,
    required String itemTitle,
    required int amount,
  }) {
    _orders.insert(
      0,
      OrderModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        customerId: customerId,
        providerId: providerId,
        itemTitle: itemTitle,
        amount: amount,
        status: OrderStatus.pending,
        orderDate: DateTime.now(),
      ),
    );
    notifyListeners();
  }

  void updateStatus(String orderId, OrderStatus newStatus) {
    final index = _orders.indexWhere((o) => o.id == orderId);
    if (index == -1) return;

    final old = _orders[index];
    _orders[index] = OrderModel(
      id: old.id,
      customerId: old.customerId,
      providerId: old.providerId,
      itemTitle: old.itemTitle,
      amount: old.amount,
      status: newStatus,
      orderDate: old.orderDate,
    );
    notifyListeners();
  }
}
