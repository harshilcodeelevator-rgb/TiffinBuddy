import 'package:flutter/material.dart';

import '../models/menu_item.dart';
import '../models/tiffin_provider.dart';

class ProviderService extends ChangeNotifier {
  final List<TiffinProviderModel> _providers = const [
    TiffinProviderModel(
      id: 'p1',
      name: 'Maa Ka Swad Tiffin',
      city: 'Surat',
      isApproved: true,
      rating: 4.6,
      monthlyPrice: 3200,
      cuisines: ['Gujarati', 'North Indian'],
    ),
    TiffinProviderModel(
      id: 'p2',
      name: 'Healthy Bowl Kitchen',
      city: 'Ahmedabad',
      isApproved: false,
      rating: 4.2,
      monthlyPrice: 3600,
      cuisines: ['Jain', 'Low Oil'],
    ),
  ];

  final List<MenuItemModel> _menu = const [
    MenuItemModel(
      id: 'm1',
      providerId: 'p1',
      day: 'Monday',
      mealType: 'Lunch',
      title: 'Roti, Dal, Rice, Bhindi Sabzi',
      price: 110,
    ),
    MenuItemModel(
      id: 'm2',
      providerId: 'p1',
      day: 'Tuesday',
      mealType: 'Dinner',
      title: 'Roti, Paneer Masala, Jeera Rice',
      price: 130,
    ),
  ];

  List<TiffinProviderModel> get approvedProviders =>
      _providers.where((p) => p.isApproved).toList();

  List<TiffinProviderModel> get allProviders => List.unmodifiable(_providers);

  List<MenuItemModel> menuForProvider(String providerId) =>
      _menu.where((m) => m.providerId == providerId).toList();

  void approveProvider(String providerId) {
    final index = _providers.indexWhere((provider) => provider.id == providerId);
    if (index == -1) return;

    final provider = _providers[index];
    _providers[index] = TiffinProviderModel(
      id: provider.id,
      name: provider.name,
      city: provider.city,
      isApproved: true,
      rating: provider.rating,
      monthlyPrice: provider.monthlyPrice,
      cuisines: provider.cuisines,
    );
    notifyListeners();
  }
}
