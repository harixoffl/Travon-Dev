import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeModel {
  // var selectedIndex = 0.obs;
  // var pageController = PageController();
  // final pagename = "Login".obs;
  // Controllers remain normal, but their values can be updated through observers if needed
  final TextEditingController dateController = TextEditingController();
  final TextEditingController fromController = TextEditingController();
  final TextEditingController toController = TextEditingController();

  // Make lists observable
  final RxList<Map<String, dynamic>> filteredPickupList = <Map<String, dynamic>>[].obs;
  final RxList<Map<String, dynamic>> filteredDropList = <Map<String, dynamic>>[].obs;

  // Make strings observable
  final RxString from_query = ''.obs;
  final RxString to_query = ''.obs;

  final pickuplist = <Map<String, dynamic>>[
    {
      'name': 'Arun Kumar',
      'Vehicle_type': 'Car',
      'Vehicle_name': 'Honda Civic',
      'date': '10th Oct 24',
      'amount': 15000,
      'from': 'Gandhipuram',
      'to': 'RS Puram',
      'profile_image': 'https://randomuser.me/api/portraits/men/1.jpg',
      'seats_available': 4,
    },
    {
      'name': 'Meena Rajan',
      'Vehicle_type': 'Bike',
      'Vehicle_name': 'Yamaha FZ',
      'date': '15th Sep 24',
      'amount': 5000,
      'from': 'Saravanampatti',
      'to': 'Peelamedu',
      'profile_image': 'https://randomuser.me/api/portraits/women/1.jpg',
      'seats_available': 2,
    },
    // ... (rest of the entries)
  ].obs;

  final droplist = <Map<String, dynamic>>[
    {
      'name': 'Arjun Kumar',
      'date': '12th Oct 24',
      'from': 'Gandhipuram',
      'to': 'RS Puram',
      'profile_image': 'https://randomuser.me/api/portraits/men/6.jpg', // Arjun Kumar
    },
    {
      'name': 'Lakshmi Narayanan',
      'date': '20th Sep 24',
      'from': 'Peelamedu',
      'to': 'Saravanampatti',
      'profile_image': 'https://randomuser.me/api/portraits/women/6.jpg', // Lakshmi Narayanan
    },
    {
      'name': 'Meena R',
      'date': '7th Aug 24',
      'from': 'Singanallur',
      'to': 'Saibaba Colony',
      'profile_image': 'https://randomuser.me/api/portraits/women/7.jpg', // Meena R
    },
    {
      'name': 'Ravi Shankar',
      'date': '15th Jul 24',
      'from': 'Ukkadam',
      'to': 'Vadavalli',
      'profile_image': 'https://randomuser.me/api/portraits/men/7.jpg', // Ravi Shankar
    },
    {
      'name': 'Anitha R',
      'date': '22nd Oct 24',
      'from': 'Kuniyamuthur',
      'to': 'Peelamedu',
      'profile_image': 'https://randomuser.me/api/portraits/women/8.jpg', // Anitha R
    },
    {
      'name': 'Vijay Kumar',
      'date': '30th Sep 24',
      'from': 'KNG Pudur',
      'to': 'Selvapuram',
      'profile_image': 'https://randomuser.me/api/portraits/men/8.jpg', // Vijay Kumar
    },
    {
      'name': 'Sita Devi',
      'date': '8th Oct 24',
      'from': 'Peelamedu',
      'to': 'Gandhipuram',
      'profile_image': 'https://randomuser.me/api/portraits/women/9.jpg', // Sita Devi
    },
    {
      'name': 'Rajesh B',
      'date': '14th Aug 24',
      'from': 'Tidel Park',
      'to': 'Race Course',
      'profile_image': 'https://randomuser.me/api/portraits/men/9.jpg', // Rajesh B
    },
    {
      'name': 'Priya S',
      'date': '25th Sep 24',
      'from': 'Chinniyampalayam',
      'to': 'Peelamedu',
      'profile_image': 'https://randomuser.me/api/portraits/women/10.jpg', // Priya S
    },
    {
      'name': 'Karthik S',
      'date': '5th Nov 24',
      'from': 'Thudiyalur',
      'to': 'Eachanari',
      'profile_image': 'https://randomuser.me/api/portraits/men/10.jpg', // Karthik S
    },
  ].obs;

  final scheduleList = <Map<String, dynamic>>[
    {'date': '18th Oct 24', 'person_name': 'John Doe', 'pickup_or_drop': 'Pickup'},
    {'date': '19th Oct 24', 'person_name': 'Jane Smith', 'pickup_or_drop': 'Drop'},
    // Add more entries as needed
  ].obs;
}
