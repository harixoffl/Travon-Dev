import 'package:get/get.dart';
import 'package:travon/home/controllers/home_actions.dart';

mixin HomeService {
  final HomeController homeController = Get.find<HomeController>();
  void filterLists() {
    homeController.HomeModel.filteredPickupList.value = homeController.HomeModel.pickuplist.where((pickup) {
      final matchesFrom = pickup['from']!.toLowerCase().contains(homeController.HomeModel.from_query.toLowerCase());
      final matchesTo = pickup['to']!.toLowerCase().contains(homeController.HomeModel.to_query.toLowerCase());

      // If both queries are present, filter by both; otherwise, filter by whichever is present
      if (homeController.HomeModel.from_query.isNotEmpty && homeController.HomeModel.to_query.isNotEmpty) {
        return matchesFrom && matchesTo; // Both 'from' and 'to' must match
      } else if (homeController.HomeModel.from_query.isNotEmpty) {
        return matchesFrom; // Only 'from' must match
      } else if (homeController.HomeModel.to_query.isNotEmpty) {
        return matchesTo; // Only 'to' must match
      } else {
        return true; // If no query is provided, return all items
      }
    }).toList();

    homeController.HomeModel.filteredDropList.value = homeController.HomeModel.droplist.where((drop) {
      final matchesFrom = drop['from']!.toLowerCase().contains(homeController.HomeModel.from_query.toLowerCase());
      final matchesTo = drop['to']!.toLowerCase().contains(homeController.HomeModel.to_query.toLowerCase());

      if (homeController.HomeModel.from_query.isNotEmpty && homeController.HomeModel.to_query.isNotEmpty) {
        return matchesFrom && matchesTo;
      } else if (homeController.HomeModel.from_query.isNotEmpty) {
        return matchesFrom;
      } else if (homeController.HomeModel.to_query.isNotEmpty) {
        return matchesTo;
      } else {
        return true;
      }
    }).toList();
  }
}
