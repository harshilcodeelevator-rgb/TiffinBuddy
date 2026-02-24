enum UserRole { customer, provider, admin }

class AppUser {
  final String id;
  final String name;
  final String phone;
  final UserRole role;
  final String? location;

  const AppUser({
    required this.id,
    required this.name,
    required this.phone,
    required this.role,
    this.location,
  });
}
