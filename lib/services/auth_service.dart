import 'package:flutter/material.dart';

import '../models/app_user.dart';

class AuthService extends ChangeNotifier {
  AppUser? _currentUser;
  bool _loading = false;

  AppUser? get currentUser => _currentUser;
  bool get isLoading => _loading;

  Future<void> mockOtpLogin({
    required String name,
    required String phone,
    required UserRole role,
    String? location,
  }) async {
    _loading = true;
    notifyListeners();

    await Future.delayed(const Duration(milliseconds: 500));

    _currentUser = AppUser(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      phone: phone,
      role: role,
      location: location,
    );

    _loading = false;
    notifyListeners();
  }

  void logout() {
    _currentUser = null;
    notifyListeners();
  }
}
