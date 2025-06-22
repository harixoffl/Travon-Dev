import 'package:get/get.dart';
import 'package:travon/PAGES/models/constants/history_constants.dart';

class HistoryController extends GetxController {
  var historyConstants = HistoryConstants();

  void removeHistoryData(int index) {
    historyConstants.historyData.removeAt(index);
  }

  @override
  void onInit() {
    super.onInit();
    loadInitialHistoryData(); // 👈 load hardcoded values
  }

  void loadInitialHistoryData() {
    historyConstants.historyData.value = [
      {
        'name': 'John Doe',
        'date': '2024-10-05',
        'fromLocation': 'New York',
        'toLocation': 'Los Angeles',
      },
      {
        'name': 'Jane Smith',
        'date': '2024-09-28',
        'fromLocation': 'Chicago',
        'toLocation': 'Houston',
      },
      {
        'name': 'David Brown',
        'date': '2024-10-01',
        'fromLocation': 'San Francisco',
        'toLocation': 'Miami',
      },
      {
        'name': 'Emma Wilson',
        'date': '2024-09-22',
        'fromLocation': 'Dallas',
        'toLocation': 'Seattle',
      },
      {
        'name': 'Michael Johnson',
        'date': '2024-09-15',
        'fromLocation': 'Boston',
        'toLocation': 'Atlanta',
      },
      {
        'name': 'Lucy Miller',
        'date': '2024-09-08',
        'fromLocation': 'Denver',
        'toLocation': 'Washington',
      },
      {
        'name': 'James Davis',
        'date': '2024-08-29',
        'fromLocation': 'Phoenix',
        'toLocation': 'Philadelphia',
      },
      {
        'name': 'Sophia Martinez',
        'date': '2024-08-15',
        'fromLocation': 'San Diego',
        'toLocation': 'Las Vegas',
      },
      {
        'name': 'Christopher Anderson',
        'date': '2024-07-30',
        'fromLocation': 'Austin',
        'toLocation': 'Orlando',
      },
      {
        'name': 'Mia Thomas',
        'date': '2024-07-12',
        'fromLocation': 'Detroit',
        'toLocation': 'San Antonio',
      },
    ];
  }
}
