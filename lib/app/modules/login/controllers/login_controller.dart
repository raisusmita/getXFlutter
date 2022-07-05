import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getxfirstproject/app/data/tenant.dart' as tenantMap;
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  //TODO: Implement LoginController
  final getStorage = GetStorage();
  dynamic organizationData;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    this.organizationData = Get.arguments;
    print(this.organizationData);
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

  login(username, password) async {
    var tenantData = jsonDecode(getStorage.read('tenantData'));
    int organizationId = tenantData['OrganizationId'];
    var tenant = getStorage.read('tenant');

    print(organizationId);
    // /api/Account/Login
    final params = {
      'organizationId': this.organizationData['OrganizationId'],
      'username': username,
      'password': password
    };

    final encodedParams=jsonEncode(params);
    print(encodedParams);

    String apiUrl = tenantMap.tenantURL['apiURL'][tenant];
    final headers = {'AllowAnonymous': 'true','content-type':'application/json'};
    Uri url = Uri.https('zenoplemasternextapi.aqore.com', '/api/Account/Login');
    final response = await http.post(url, headers: headers, body: encodedParams);
    if (response.statusCode == 200) {
      print(response);
    }
  }
}
