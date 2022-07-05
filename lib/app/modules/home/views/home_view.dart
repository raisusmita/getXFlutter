import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  GlobalKey<FormState> myFormKey = GlobalKey<FormState>();
  TextEditingController tenantFieldController = TextEditingController();
  TextEditingController aliasFieldController = TextEditingController();
  String tenant = "";
  String alias = "";
  String apiUrl = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: _myFormWidget(),
      ),
    );
  }

  Widget _tenantFieldWidget() {
    return TextFormField(
        controller: tenantFieldController,
        onChanged: (value) {
          tenant = value;
        },
        textInputAction: TextInputAction.next,
        validator: (value) {
          if (value == null || value!.isEmpty) {
            return 'this is required field';
          }
          return null;
        });
  }

  Widget _aliasFieldWidget() {
    return TextFormField(
        controller: aliasFieldController,
        onChanged: (value) {
          alias = value!;
        },
        // keyboardType: TeaaaxtInputType.number,
        validator: (value) {
          if (value == null || value!.isEmpty) {
            return 'this is required field';
          }
          return null;
        });
  }

  Widget _applyButton() {
    return ElevatedButton(
        onPressed: () {
          if (myFormKey.currentState!.validate()) {
            controller.getOrganization(alias, tenant);
          }
        },
        child: Text('Apply'));
  }

  Widget _myFormWidget() {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: myFormKey,
          child: Column(children: [
            Text('Tenant'),
            _tenantFieldWidget(),
            Text('Alias'),
            _aliasFieldWidget(),
            _applyButton()
          ]),
        ));
  }
}
