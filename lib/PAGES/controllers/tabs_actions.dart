import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travon/PAGES/Views/history.dart';
import 'package:travon/PAGES/Views/home.dart';
import 'package:travon/PAGES/Views/notification.dart';
import 'package:travon/PAGES/models/constants/tab_constants.dart';

class TabsController extends GetxController {
  var tabModel = TabModel();

  void changeIndex(int index) {
    tabModel.selectedIndex.value = index;
    // tabConstants.pageController.jumpToPage(index);
  }

  final List<Widget> pages = [MyHomePage(), Notificationpage(), HistoryPage()];

  // @override
  // void onInit() {
  //   super.onInit();
  //   tabModel.pageController = PageController(); // initialize it
  // }

  @override
  void onClose() {
    tabModel.pageController.dispose();
    super.onClose();
  }
}
