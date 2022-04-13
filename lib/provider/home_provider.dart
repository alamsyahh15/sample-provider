import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  /// ========== Property ============
  late TabController controller;

  /// ========= Initialized ==========
  void initialized(TickerProvider ticker) {
    controller = TabController(length: 2, vsync: ticker);
  }

  /// ======== Method ===========
  void setPage(int index) {
    controller.animateTo(index);
    notifyListeners();
  }
}
