import 'package:flutter/material.dart';
import 'package:travon/THEMES/style.dart';

/// The main home page of the application containing a sidebar menu and dynamic content area.
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController pageController = PageController();

  bool showfull = true;
  @override
  void initState() {
    /// Add a listener to the side menu that changes the page when a menu item is selected

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Primary_colors.Dark,
      body: Padding(
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
          ],
        ),
      ),
    );
  }
}
