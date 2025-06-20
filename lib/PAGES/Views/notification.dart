import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travon/PAGES/controllers/home_actions.dart';
import 'package:travon/THEMES/style.dart';


class Notificationpage extends StatefulWidget {
  const Notificationpage({super.key});

  @override
  State<Notificationpage> createState() => _NotificationpageState();
}

class _NotificationpageState extends State<Notificationpage> {
  final NotificationController notificationController = Get.find<NotificationController>();

 

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Primary_colors.Light,
        // appBar: AppBar(
        //   title: const Row(
        //     children: [
        //       // Icon(
        //       //   Icons.arrow_back,
        //       //   color: kblack, // Icon color
        //       //   size: 20, // Adjust size to fit in the circle
        //       // ),
        //     ],
        //   ),
        // ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "Notifications",
                style: TextStyle(fontSize: 18, color: Primary_colors.Color9),
              ),
            ),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: notificationController.notification.notificationData.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      key: Key(
                        notificationController.notification.notificationData[index].hashCode.toString(),
                      ),
                      direction: DismissDirection.endToStart,
                      background: Container(
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(right: 20),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(Icons.delete, color: Colors.white, size: 20),
                      ),
                      confirmDismiss: (direction) async {
                        return await showDialog<bool>(
                          context: context,
                          builder: (context) => AlertDialog(
                            backgroundColor: Primary_colors.Dark,
                            title: const Text(
                              "Delete Notification",
                              style: TextStyle(
                                fontSize: 16,
                                color: Primary_colors.Color1,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            content: const Text(
                              "Would you like to delete this notification?",
                              style: TextStyle(
                                fontSize: 12,
                                color: Primary_colors.Color7,
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.of(context).pop(false),
                                child: const Text("Cancel"),
                              ),
                              TextButton(
                                onPressed: () =>
                                    Navigator.of(context).pop(true),
                                child: const Text(
                                  "Delete",
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      onDismissed: (direction) {
                        notificationController.removeNotification(index);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: Colors.green,
                            content: Text(
                              "Notification deleted",
                              style: TextStyle(
                                fontSize: 12,
                                color: Primary_colors.Color1,
                              ),
                            ),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Primary_colors.Dark,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: CircleAvatar(
                                      backgroundColor: kgrey,
                                      radius: 20,
                                      child: const Icon(
                                        Icons.person,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Jaya Krishna",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Primary_colors.Color1,
                                          ),
                                        ),
                                        Text(
                                          "Requested a ride on  25/10/2024",
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: Primary_colors.Color7,
                                            fontStyle: FontStyle.italic
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              // Row(
                              //   children: [
                              //     IconButton(
                              //       onPressed: () {},
                              //       icon: const Icon(
                              //         Icons.thumb_up_outlined,
                              //         color: Colors.green,
                              //         size: 20,
                              //       ),
                              //     ),
                              //     const SizedBox(width: 20),
                              //     IconButton(
                              //       onPressed: () {},
                              //       icon: const Icon(
                              //         Icons.thumb_down_alt_outlined,
                              //         color: Colors.red,
                              //         size: 20,
                              //       ),
                              //     ),
                              //     const SizedBox(width: 15),
                              //   ],
                              // ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
