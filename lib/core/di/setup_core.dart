import 'package:flutx_core/core/debug_print.dart';
import 'package:get/get.dart';

import '../base/base_controller.dart';
import '../network/api_client.dart';
import '../network/services/auth_storage_service.dart';
import '../utils/getx_helper.dart';

void setupCore() {
  DPrint.info("setupCore");
  Get.getOrPut(() => BaseController());
  Get.getOrPutLazy(() => ApiClient(), fenix: true);
  Get.getOrPutLazy(() =>  AuthStorageService());

  // Get.getOrPutLazy(() => AuthenticateCheckService(Get.find(), Get.find()));
}
