enum OrderStatus { pending, accepted, outForDelivery, delivered, cancelled }

class OrderModel {
  final String id;
  final String customerId;
  final String providerId;
  final String itemTitle;
  final int amount;
  final OrderStatus status;
  final DateTime orderDate;

  const OrderModel({
    required this.id,
    required this.customerId,
    required this.providerId,
    required this.itemTitle,
    required this.amount,
    required this.status,
    required this.orderDate,
  });
}
