
import 'package:apprappi/src/utils/my_colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  LoginController _con = new LoginController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
       _con.init(context);
     });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : Container(
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(
                top: -80,
                left: -100,
                child: _circleLogin()
            ),
            Positioned(
                child: _textLogin(),
                top: 60,
                left: 25,
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  _imageBanner(),
                  _textFieldEmail(),
                  _textFieldPassword(),
                  _buttonLogin(),
                  _textDontHaveAccount(),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
  Widget _textLogin(){
    return Text(
      'Login',
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 36
      ),
    );
  }


  Widget _textDontHaveAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
            '¿No tienes una cuenta?',
            style: TextStyle(
                fontWeight: FontWeight.bold
            )
        ),
        SizedBox(width: 7),
        GestureDetector(
          onTap: _con.goToRegisterPage,
          child: Text(
            'Registrate',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: MyColors.primaryColor
            ),
          ),
        ),
      ],
    );
  }

  Widget _buttonLogin() {
    return  Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      child: ElevatedButton(
          onPressed: _con.login,
          child: Text('INGRESAR'),
          style: ElevatedButton.styleFrom(
            primary: MyColors.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)
            ),
            padding: EdgeInsets.symmetric(vertical: 15)
          ),
      ),
    );
  }


  Widget _textFieldPassword() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      decoration: BoxDecoration(
          color: MyColors.primaryOpacityColor,
          borderRadius: BorderRadius.circular(30)
      ),
      child: TextField(
        controller: _con.passwordController,
        obscureText: true,
        decoration: InputDecoration(
            hintText: 'Contraseña',
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(15),
            hintStyle: TextStyle(
                color: MyColors.primaryColorDark
            ),
            prefixIcon: Icon(
              Icons.lock,
              color: MyColors.primaryColor,

        )
        ),
      ),
    );
  }

  Widget _textFieldEmail(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      decoration: BoxDecoration(
        color: MyColors.primaryOpacityColor,
        borderRadius: BorderRadius.circular(30)
      ),
      child: TextField(
        controller: _con.emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            hintText: 'Correo Electronico',
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(15),
            hintStyle: TextStyle(
              color: MyColors.primaryColorDark
            ),
            prefixIcon: Icon(
              Icons.email,
              color: MyColors.primaryColor,
              )
        ),
      ),
    );
  }

  Widget _circleLogin() {
    return Container(
      width: 240,
      height: 240,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: MyColors.primaryColor
      ),
    );
  }

  Widget _imageBanner() {
    return Container(
      margin: EdgeInsets.only(
          top: 100,
          bottom: MediaQuery.of(context).size.height * 0.10
      ),
      child: Image.asset(
        'assets/img/delivery.png',
        width: 200,
        height: 200,
      ),
    );
  }
}
