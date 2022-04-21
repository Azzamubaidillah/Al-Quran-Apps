import 'package:get/get.dart';

import '../controllers/pray_time_controller.dart';

class PrayTimeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PrayTimeController>(
      () => PrayTimeController(),
    );
  }
}
