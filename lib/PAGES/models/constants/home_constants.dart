import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeConstants extends GetxController {
  var selectedIndex = 0.obs;
  var  pageController = PageController();
}

class NotificationConstants extends GetxController{
  var notificationData=<Map<String, dynamic>>[].obs;
}

class HistoryConstants extends GetxController {
  var historyData=<Map<String, dynamic>>[].obs;

  
}
