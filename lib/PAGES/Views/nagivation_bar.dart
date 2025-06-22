import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travon/PAGES/controllers/tabs_actions.dart';
import 'package:travon/THEMES/style.dart';

class Bottom_Bar extends StatefulWidget {
  const Bottom_Bar({super.key});

  @override
  State<Bottom_Bar> createState() => _Bottom_BarState();
}

class _Bottom_BarState extends State<Bottom_Bar> {
  final TabsController tabController = Get.find<TabsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(18, 22, 33, 1),

      /// PageView for content
      body: PageView(
        controller: tabController.tabModel.pageController,
        onPageChanged: (i) {
          /// Guard to avoid triggering unnecessary rebuilds
          if (tabController.tabModel.selectedIndex.value != i) {
            tabController.tabModel.selectedIndex.value = i;
          }
        },
        children: tabController.pages,
      ),

      /// Bottom Navigation Bar
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: tabController.tabModel.selectedIndex.value,
          onTap: (index) {
            tabController.changeIndex(index);

            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (tabController.tabModel.pageController.hasClients) {
                tabController.tabModel.pageController.jumpToPage(index);
              }
            });
          },
          backgroundColor: Primary_colors.Light,
          selectedItemColor: Primary_colors.Color3,
          unselectedItemColor: Primary_colors.Color1,
          selectedLabelStyle: const TextStyle(fontSize: 10),
          unselectedLabelStyle: const TextStyle(fontSize: 10),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.tab, size: 20), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.notifications, size: 20), label: 'Notification'),
            BottomNavigationBarItem(icon: Icon(Icons.history, size: 20), label: 'History'),
          ],
        ),
      ),
    );
  }
}
