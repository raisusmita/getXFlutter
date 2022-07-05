import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  TextEditingController tenantFieldController = TextEditingController();
  TextEditingController aliasFieldController = TextEditingController();
  String username = "";
  String password = "";
  String alias = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginView'),
        centerTitle: true,
      ),
      body: Center(
        child: _loginFormWidget(),
      ),
    );
  }

  Widget _usernameFieldWidget() {
    return TextFormField(
        controller: tenantFieldController,
        onChanged: (value) {
          username = value!;
        },
        textInputAction: TextInputAction.next,
        validator: (value) {
          if (value == null || value!.isEmpty) {
            return 'this is required field';
          }
          return null;
        });
  }

  Widget _passwordFieldWidget() {
    return TextFormField(
        controller: aliasFieldController,
        onChanged: (value) {
          password = value!;
        },
        // keyboardType: TeaaaxtInputType.number,
        validator: (value) {
          if (value == null || value!.isEmpty) {
            return 'this is required field';
          }
          return null;
        });
  }

  // Widget _logoWidget() {
  //   return Image(image: AssetImage('assets/images/zenople_logo.png'));
  // }

  Widget _login() {
    return ElevatedButton(
        onPressed: () {
          if (loginFormKey.currentState!.validate()) {
            controller.login(username, password);
          }
        },
        child: Text('LOGIN'));
  }

  Widget _loginFormWidget() {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: loginFormKey,
          child: Column(children: [
            // _logoWidget(),
            Text('Username'),
            _usernameFieldWidget(),
            Text('Password'),
            _passwordFieldWidget(),
            _login()
          ]),
        ));
  }
}
