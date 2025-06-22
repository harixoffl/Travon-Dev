import 'package:get/get.dart';
import 'package:travon/IAM/views/IAM.dart';

import 'route_names.dart';

class AppRoutes {
  static final routes = [GetPage(name: RouteNames.IAM, page: () => const IAM())];
}
