import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travon/PAGES/controllers/home_actions.dart';
import 'package:travon/THEMES/style.dart';

/// The main home page of the application containing a sidebar menu and dynamic content area.
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController pageController = PageController();
  final HomeController homeController = Get.find<HomeController>();

  bool showfull = true;
  @override
  void initState() {
    /// Add a listener to the side menu that changes the page when a menu item is selected

    super.initState();
    homeController.homeModel.pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(18, 22, 33, 1),

      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 300,
                  decoration: BoxDecoration(color: Primary_colors.Light, borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding: const EdgeInsets.only(),
                    child: Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 40,
                            child: TextFormField(
                              // controller: _fromController,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 10, color: Colors.white),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.transparent,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(color: Colors.transparent),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                hintText: 'From',
                                hintStyle: const TextStyle(fontSize: 10, color: Colors.grey),
                                border: const OutlineInputBorder(),
                              ),
                              onChanged: (value) {
                                // setState(() {
                                //   from_query = value;
                                //   filterLists();
                                // });
                              },
                            ),
                          ),
                        ),
                        const Icon(Icons.compare_arrows_outlined),
                        Expanded(
                          child: SizedBox(
                            height: 40,
                            child: TextFormField(
                              // controller: _toController,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 10, color: Colors.white),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.transparent,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(color: Colors.transparent),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                hintText: 'To',
                                hintStyle: const TextStyle(fontSize: 10, color: Colors.grey),
                                border: const OutlineInputBorder(),
                              ),
                              onChanged: (value) {
                                // setState(() {
                                //   to_query = value;
                                //   filterLists();
                                // });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // const SizedBox(width: 3),
                IconButton(
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                  icon: const Icon(Icons.filter_alt_outlined, color: Primary_colors.Color1),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
