import 'package:apprappi/src/models/response_api.dart';
import 'package:apprappi/src/provider/users_provider.dart';
import 'package:apprappi/src/utils/my_snackbar.dart';
import 'package:flutter/material.dart';

class LoginController {

  BuildContext context;
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  UsersProvider usersProvider = new UsersProvider();


  Future init(BuildContext context) async{
    this.context = context;
    await usersProvider.init(context);
  }

  void goToRegisterPage() {
    Navigator.pushNamed(context, 'register');
  }

  void login() async{
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    ResponseApi responseApi = await usersProvider.login(email, password);
    print('Respuesta: ${responseApi.toJson()}');
    MySnackBar.show(context, responseApi.message);

    print('EMAIL: $email');
    print('Password: $password');

  }

}