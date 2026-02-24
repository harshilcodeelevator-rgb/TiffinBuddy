class TiffinProviderModel {
  final String id;
  final String name;
  final String city;
  final bool isApproved;
  final double rating;
  final int monthlyPrice;
  final List<String> cuisines;

  const TiffinProviderModel({
    required this.id,
    required this.name,
    required this.city,
    required this.isApproved,
    required this.rating,
    required this.monthlyPrice,
    required this.cuisines,
  });
}
