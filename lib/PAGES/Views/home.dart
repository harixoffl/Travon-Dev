import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travon/THEMES/style.dart';
import 'package:travon/home/controllers/home_actions.dart';
import 'package:travon/home/services/home_service.dart';

/// The main home page of the application containing a sidebar menu and dynamic content area.
class MyHomePage extends StatefulWidget with HomeService {
  MyHomePage({super.key});
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final HomeController homeController = Get.find<HomeController>();
  PageController pageController = PageController();

  bool showfull = true;
  @override
  void initState() {
    /// Add a listener to the side menu that changes the page when a menu item is selected
    homeController.HomeModel.filteredPickupList.value = homeController.HomeModel.pickuplist;
    homeController.HomeModel.filteredDropList.value = List.from(homeController.HomeModel.droplist);

    // Listen for changes in the "From" TextFormField
    homeController.HomeModel.fromController.addListener(() {
      widget.filterLists();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Primary_colors.Dark,

      body: DefaultTabController(
        length: 2,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Container(
                width: 400,
                decoration: BoxDecoration(color: Primary_colors.Light, borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.only(),
                  child: Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 40,
                          child: TextFormField(
                            controller: homeController.HomeModel.fromController,
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
                              homeController.update_fromQuery(value);
                              widget.filterLists();
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
                            controller: homeController.HomeModel.toController,
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
                              homeController.update_toQuery(value);
                              widget.filterLists();
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
              const SizedBox(height: 20),
              Container(
                // decoration: BoxDecoration(borderRadius: BorderRadius.circular(7), color: Primary_colors.Color3),
                child: const Padding(
                  padding: EdgeInsets.all(5),
                  child: TabBar(
                    // labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 22, 31, 158)),
                    // indicator: BoxDecoration(),
                    // unselectedLabelColor: Colors.white,
                    // dividerHeight: 0,
                    tabs: [
                      Text(
                        'DRIVERS',
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, fontFamily: 'Poppins', letterSpacing: 1),
                      ),
                      Text(
                        'PASSENGERS',
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, fontFamily: 'Poppins', letterSpacing: 1),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 10),
              Expanded(
                // height: 500, // Limit the height for scrolling
                child: Obx(() {
                  return TabBarView(children: [pickup_widget(context, homeController.HomeModel.filteredPickupList), Drop_widget(context, homeController.HomeModel.filteredDropList)]);
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget pickup_widget(BuildContext context, List<Map<String, dynamic>> pickupList) {
    return ListView.builder(
      itemCount: homeController.HomeModel.filteredPickupList.length,
      itemBuilder: (context, index) {
        final pickup = homeController.HomeModel.filteredPickupList[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 8),
          child: Container(
            decoration: BoxDecoration(color: kPrimaryLightColor, borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              leading: CircleAvatar(backgroundImage: NetworkImage(pickup['profile_image'])),
              title: Text(pickup['name'], style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              subtitle: Text('${pickup['from']} → ${pickup['to']} \n${pickup['date']}', style: const TextStyle(fontSize: 10)),
              trailing: IconButton(
                onPressed: () {
                  // showSchedulePopup(context, scheduleList);
                },
                icon: const Icon(Icons.person_add_alt_1, color: kPrimaryColor),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget Drop_widget(BuildContext context, List<Map<String, dynamic>> dropList) {
    return ListView.builder(
      itemCount: homeController.HomeModel.filteredDropList.length,
      itemBuilder: (context, index) {
        final drop = homeController.HomeModel.filteredDropList[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 8),
          child: Container(
            decoration: BoxDecoration(color: kPrimaryLightColor, borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              leading: CircleAvatar(backgroundImage: NetworkImage(drop['profile_image'])),
              title: Text(drop['name'], style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              subtitle: Text('${drop['from']} → ${drop['to']} \n${drop['date']}', style: const TextStyle(fontSize: 10)),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.person_add_alt_1, color: kPrimaryColor),
              ),
            ),
          ),
        );
      },
    );
  }
}
