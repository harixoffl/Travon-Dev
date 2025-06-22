import 'package:get/get.dart';
import 'package:travon/PAGES/controllers/home_actions.dart';

mixin HomeService {
  void filterLists(HomeController homeController) {
    homeController.homeModel.filteredPickupList.value = homeController.homeModel.pickuplist.where((pickup) {
      final matchesFrom = pickup['from']!.toLowerCase().contains(homeController.homeModel.from_query.toLowerCase());
      final matchesTo = pickup['to']!.toLowerCase().contains(homeController.homeModel.to_query.toLowerCase());

      // If both queries are present, filter by both; otherwise, filter by whichever is present
      if (homeController.homeModel.from_query.isNotEmpty && homeController.homeModel.to_query.isNotEmpty) {
        return matchesFrom && matchesTo; // Both 'from' and 'to' must match
      } else if (homeController.homeModel.from_query.isNotEmpty) {
        return matchesFrom; // Only 'from' must match
      } else if (homeController.homeModel.to_query.isNotEmpty) {
        return matchesTo; // Only 'to' must match
      } else {
        return true; // If no query is provided, return all items
      }
    }).toList();

    homeController.homeModel.filteredDropList.value = homeController.homeModel.droplist.where((drop) {
      final matchesFrom = drop['from']!.toLowerCase().contains(homeController.homeModel.from_query.toLowerCase());
      final matchesTo = drop['to']!.toLowerCase().contains(homeController.homeModel.to_query.toLowerCase());

      if (homeController.homeModel.from_query.isNotEmpty && homeController.homeModel.to_query.isNotEmpty) {
        return matchesFrom && matchesTo;
      } else if (homeController.homeModel.from_query.isNotEmpty) {
        return matchesFrom;
      } else if (homeController.homeModel.to_query.isNotEmpty) {
        return matchesTo;
      } else {
        return true;
      }
    }).toList();
  }
}
