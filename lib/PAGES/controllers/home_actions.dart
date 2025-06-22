import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travon/PAGES/Views/history.dart';
import 'package:travon/PAGES/Views/home.dart';
import 'package:travon/PAGES/Views/notification.dart';
import 'package:travon/PAGES/models/constants/home_constants.dart';

class HomeController extends GetxController {
  var homeModel = HomeModel();

  // void changeIndex(int index) {
  //   homeModel.selectedIndex.value = index;
  //   // homeConstants.pageController.jumpToPage(index);
  // }

  void update_fromQuery(String value) {
    homeModel.from_query.value = value;
  }

  void update_toQuery(String value) {
    homeModel.to_query.value = value;
  }

  final List<Widget> pages = [MyHomePage(), Notificationpage(), HistoryPage()];

  // @override
  // void onInit() {
  //   super.onInit();
  //   homeModel.pageController = PageController(); // initialize it
  // }

  // @override
  // void onClose() {
  //   homeModel.pageController.dispose();
  //   super.onClose();
  // }
}
