import 'package:flutter/material.dart';
import 'package:travon/THEMES/style.dart';

class profilepage extends StatefulWidget {
  const profilepage({super.key});

  @override
  State<profilepage> createState() => _profilepageState();
}

class _profilepageState extends State<profilepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    CircleAvatar(radius: 40, backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-ZRAmm8lfuGhxCuW0gF1UICbwr1N6iHD37Td_NTC4aNTq_Q55cO24nXM&s')),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            profilename,
                            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: kPrimaryLightColor),
                          ),
                          Text('Coimbatore', style: TextStyle(fontSize: 13, color: Color.fromARGB(255, 142, 254, 146))),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                TextButton.icon(
                  icon: const Icon(Icons.phone_android_outlined, color: Colors.black),
                  onPressed: () {},
                  label: const Text(
                    'Phone',
                    style: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 45),
                  child: Text(
                    '9837678909',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: kPrimaryLightColor),
                  ),
                ),
                const SizedBox(height: 10),
                TextButton.icon(
                  icon: const Icon(Icons.email, color: Colors.black),
                  onPressed: () {},
                  label: const Text(
                    'Email',
                    style: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 45),
                  child: Text(
                    'vijay@gmail.com',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: kPrimaryLightColor),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: TextButton.icon(
              icon: const Icon(Icons.exit_to_app, color: Color.fromARGB(255, 0, 0, 0)),
              onPressed: () {},
              label: const Text(
                'Logout',
                style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
