import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travon/PAGES/controllers/history_actions.dart';
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
              child: Obx(() {
                return ListView.builder(
                  itemCount:
                      historyController.historyConstants.historyData.length,
                  itemBuilder: (context, index) {
                    final item =
                        historyController.historyConstants.historyData[index];
                    return Dismissible(
                      key: Key(
                        historyController
                            .historyConstants
                            .historyData[index]
                            .hashCode
                            .toString(),
                      ),
                      direction: DismissDirection.endToStart,
                      background: Container(
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(right: 20),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.delete,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                      confirmDismiss: (direction) async {
                        return await showDialog<bool>(
                          context: context,
                          builder: (context) => AlertDialog(
                            backgroundColor: Primary_colors.Dark,
                            title: const Text(
                              "Delete History",
                              style: TextStyle(
                                fontSize: 16,
                                color: Primary_colors.Color1,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            content: const Text(
                              "Would you like to delete this item from history?",
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
                        historyController.removeHistoryData(index);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: Colors.green,
                            content: Text(
                              "Item deleted from History",
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
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                                      MainAxisAlignment
                                                          .spaceEvenly,
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
                                                          style:
                                                              const TextStyle(
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
                                                          style:
                                                              const TextStyle(
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
                                        showViewHistory(context);
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
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

void showViewHistory(BuildContext context) {
  // final GlobalKey _invoiceCopyKey = GlobalKey();
  // final GlobalKey _voucherCopyKey = GlobalKey();
  // final GlobalKey _GSTcopyKey = GlobalKey();
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        // insetPadding: EdgeInsets.all(20),
        child: Container(
          width: 250,
           padding: EdgeInsets.all(8),
          // constraints: BoxConstraints(minWidth: 300, maxWidth: 500),
          decoration: BoxDecoration(
            color: Primary_colors.Light,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          // child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Primary_colors.Color3,
                      Primary_colors.Color3.withOpacity(0.8),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        // color: Colors.white.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.history,
                        color: Colors.green,
                        size: 26,
                      ),
                    ),
                    const SizedBox(width: 5),
                    const Text(
                      'Detailed History',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: Primary_font_size.Text8,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.only(right: 16, left: 16),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Primary_colors.Dark,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Primary_colors.Dark, width: 1),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      // ✅ use Flexible inside scroll views
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: Primary_colors.Color3.withOpacity(0.1),
                                  shape: BoxShape.circle,
                                ),
                                child: const CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Primary_colors.Color3,
                                  child: Icon(
                                    Icons.person,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                            ],
                          ),
                          const SizedBox(height: 12),
                        ],
                      ),
                    ),

                    // Container(
                    //   height: 250,
                    //   width: 0.5,
                    //   color: Colors.grey[500],
                    //   margin: const EdgeInsets.all(20),
                    // ),

                    // const SizedBox(height: 15,),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
