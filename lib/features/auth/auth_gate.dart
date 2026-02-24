import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/app_user.dart';
import '../../services/auth_service.dart';
import '../admin/admin_dashboard_screen.dart';
import '../customer/customer_home_screen.dart';
import '../provider/provider_dashboard_screen.dart';
import 'login_screen.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthService>();
    final user = auth.currentUser;

    if (user == null) return const LoginScreen();

    switch (user.role) {
      case UserRole.customer:
        return const CustomerHomeScreen();
      case UserRole.provider:
        return const ProviderDashboardScreen();
      case UserRole.admin:
        return const AdminDashboardScreen();
    }
  }
}
