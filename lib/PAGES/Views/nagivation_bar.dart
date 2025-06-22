import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travon/PAGES/controllers/home_actions.dart';
import 'package:travon/THEMES/style.dart';

class NavigationBar extends StatefulWidget {
  const NavigationBar({super.key});

  @override
  State<NavigationBar> createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  PageController pageController = PageController();
  final HomeController homeController = Get.find<HomeController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(18, 22, 33, 1),

      /// PageView for content
      body: Obx(() {
        // final index = homeController.homeModel.selectedIndex.value;
        return PageView(
          controller: homeController.homeModel.pageController,
          onPageChanged: (i) {
            homeController.homeModel.selectedIndex.value = i;
          },
          children: homeController.pages,
        );
      }),

      /// Bottom Navigation Bar
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: homeController.homeModel.selectedIndex.value,
          onTap: (index) {
            homeController.changeIndex(index);

            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (homeController.homeModel.pageController.hasClients) {
                homeController.homeModel.pageController.jumpToPage(index);
              }
            });
          },
          backgroundColor: Primary_colors.Light,
          selectedItemColor: Primary_colors.Color3,
          unselectedItemColor: Primary_colors.Color1,
          selectedLabelStyle: const TextStyle(fontSize: 10),
          unselectedLabelStyle: const TextStyle(fontSize: 10),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home, size: 20), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.notifications, size: 20), label: 'Notification'),
            BottomNavigationBarItem(icon: Icon(Icons.history, size: 20), label: 'History'),
          ],
        ),
      ),
    );
  }
}
