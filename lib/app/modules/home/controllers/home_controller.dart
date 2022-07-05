import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/interceptors/get_modifiers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getxfirstproject/app/routes/app_pages.dart';
import 'package:http/http.dart' as http;
import 'package:getxfirstproject/app/data/tenant.dart' as tenantMap;

class HomeController extends GetxController {
  //TODO: Implement HomeController
  final count = 0.obs;
  final getStorage = GetStorage();

  // RxString tenant = "".obs;
  // RxString alias = "".obs;
  // RxString apiUrl = "".obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  getOrganization(alias, tenant) async {
    final params = jsonEncode({'alias': alias});
    String apiUrl = tenantMap.tenantURL['apiURL'][tenant];
    Uri url = Uri.https(
        apiUrl, '/api/organization/tenantOrganization', {'json': params});
    getStorage.write('apiUrl',apiUrl);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      // getStorage.write('tenantData', response.body);
      // getStorage.write('tenant', tenant);

      if (response.body.isNotEmpty) {
        final result = await Get.toNamed(Routes.LOGIN, arguments: jsonDecode(response.body));
      }
    }
  }
}
