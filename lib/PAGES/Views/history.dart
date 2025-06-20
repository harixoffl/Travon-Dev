import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travon/PAGES/controllers/home_actions.dart';
import 'package:travon/THEMES/style.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final HistoryController historyController = Get.find<HistoryController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Primary_colors.Light,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "History",
                style: TextStyle(fontSize: 18, color: Primary_colors.Color9),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount:
                    historyController.historyConstants.historyData.length,
                itemBuilder: (context, index) {
                  final item =
                      historyController.historyConstants.historyData[index];
                  return Padding(
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
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item['name']!,
                                      style: const TextStyle(
                                        color: Primary_colors.Color1,
                                        fontSize: 12,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      '${item['fromLocation']} → ${item['toLocation']} \n${item['date']}',
                                      style: const TextStyle(
                                        fontSize: 10,
                                        color: Primary_colors.Color7,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ), // Container(
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text("Details"),
                                      content: SizedBox(
                                        height: 100,
                                        child: Column(
                                          // mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Column(
                                                  children: [
                                                    const Icon(
                                                      Icons.location_on,
                                                      color: Colors.red,
                                                    ), // From point
                                                    const SizedBox(
                                                      height: 8,
                                                    ), // Space between point and text
                                                    Text(
                                                      item['fromLocation']!,
                                                      style: const TextStyle(
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Image.asset(
                                                  'assets/images/arrow.png',
                                                  width: 25,
                                                  height: 30,
                                                  // color: Colors.grey,
                                                ),
                                                Column(
                                                  children: [
                                                    const Icon(
                                                      Icons.location_on,
                                                      color: Colors.green,
                                                    ), // To point
                                                    const SizedBox(
                                                      height: 8,
                                                    ), // Space between point and text
                                                    Text(
                                                      item['toLocation']!,
                                                      style: const TextStyle(
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      actions: [
                                        TextButton(
                                          child: const Text("Close"),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: MouseRegion(
                                cursor: SystemMouseCursors
                                    .click, // 👈 shows hand cursor on hover
                                child: GestureDetector(
                                  onTap: () {
                                    // 👉 Your onClick function here
                                    print("View clicked");
                                  },
                                  child: const Text(
                                    'View',
                                    style: TextStyle(
                                      color: Primary_colors.Color3,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                      // optional: to show it's clickable
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // // ElevatedButton(
                          // //   style: const ButtonStyle(backgroundColor: WidgetStatePropertyAll(kPrimaryColor), padding: WidgetStatePropertyAll(EdgeInsets.only(top: 0, bottom: 0))),
                          // //   onPressed: () {
                          // //     // );
                          // //   },
                          // //   child: const Text(
                          // //     "View",
                          // //     style: TextStyle(color: Colors.white, fontSize: 10),
                          // //   ),
                          // ),
                        ],
                      ),
                    ),
                  );

                  // Card(
                  //   color: kPrimaryLightColor,
                  //   margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  //   child: ListTile(
                  //     leading: CircleAvatar(
                  //       backgroundColor: kgrey,
                  //       radius: 30,
                  //       child: const Icon(
                  //         Icons.person,
                  //         color: Colors.grey,
                  //         size: 30,
                  //       ),
                  //     ),
                  //     title: Text(
                  //       item['name']!,
                  //       style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 14),
                  //       overflow: TextOverflow.ellipsis,
                  //     ),
                  //     subtitle: Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         // Text(
                  //         //   'Date: ${item['date']}',
                  //         //   style: const TextStyle(color: Color.fromARGB(255, 94, 93, 93), fontSize: 10),
                  //         // ),
                  //         // const SizedBox(height: 4),
                  // Text(
                  //   '${item['fromLocation']} → ${item['toLocation']} \n${item['date']}',
                  //   style: const TextStyle(fontSize: 10),
                  // ),
                  //         // Text(
                  //         //   'From: ${item['fromLocation']}',
                  //         //   style: const TextStyle(color: Color.fromARGB(255, 94, 93, 93), fontSize: 10),
                  //         // ),
                  //         // Text(
                  //         //   'To: ${item['toLocation']}',
                  //         //   style: const TextStyle(color: Color.fromARGB(255, 94, 93, 93), fontSize: 10),
                  //         // ),
                  //       ],
                  //     ),
                  //     trailing:
                  // ElevatedButton(
                  //       style: const ButtonStyle(backgroundColor: WidgetStatePropertyAll(kPrimaryColor)),
                  //       onPressed: () {
                  //         showDialog(
                  //           context: context,
                  //           builder: (BuildContext context) {
                  //             return AlertDialog(
                  //               title: const Text("Details"),
                  //               content: Column(
                  //                 // mainAxisSize: MainAxisSize.min,
                  //                 children: [
                  //                   Row(
                  //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //                     children: [
                  //                       Column(
                  //                         children: [
                  //                           const Icon(Icons.location_on, color: Colors.red), // From point
                  //                           const SizedBox(height: 8), // Space between point and text
                  //                           Text(
                  //                             item['fromLocation']!,
                  //                             style: const TextStyle(fontSize: 16),
                  //                           ),
                  //                         ],
                  //                       ),
                  //                       Image.asset(
                  //                         'assets/images/arrow.png',
                  //                         width: 25,
                  //                         height: 30,
                  //                         // color: Colors.grey,
                  //                       ),
                  //                       Column(
                  //                         children: [
                  //                           const Icon(Icons.location_on, color: Colors.green), // To point
                  //                           const SizedBox(height: 8), // Space between point and text
                  //                           Text(
                  //                             item['toLocation']!,
                  //                             style: const TextStyle(fontSize: 16),
                  //                           ),
                  //                         ],
                  //                       ),
                  //                     ],
                  //                   ),
                  //                 ],
                  //               ),
                  //               actions: [
                  //                 TextButton(
                  //                   child: const Text("Close"),
                  //                   onPressed: () {
                  //                     Navigator.of(context).pop();
                  //                   },
                  //                 ),
                  //               ],
                  //             );
                  //           },
                  //         );
                  //       },
                  //       child: const Text(
                  //         "View",
                  //         style: TextStyle(color: Colors.white),
                  //       ),
                  //     ),
                  //   ),
                  // );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
