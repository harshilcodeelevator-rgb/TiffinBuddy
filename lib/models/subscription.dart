class SubscriptionModel {
  final String id;
  final String customerId;
  final String providerId;
  final DateTime startDate;
  final DateTime endDate;
  final bool isPaused;

  const SubscriptionModel({
    required this.id,
    required this.customerId,
    required this.providerId,
    required this.startDate,
    required this.endDate,
    required this.isPaused,
  });
}
