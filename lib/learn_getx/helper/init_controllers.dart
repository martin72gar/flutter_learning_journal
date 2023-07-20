import 'package:flutter_application_1/learn_getx/controllers/list_controller.dart';
import 'package:flutter_application_1/learn_getx/controllers/tap_controller.dart';
import 'package:get/get.dart';

Future<void> init() async {
  Get.lazyPut(() => TapController());
  Get.lazyPut(() => ListController());
}
