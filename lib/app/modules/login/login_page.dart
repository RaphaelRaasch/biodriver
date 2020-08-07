import 'package:biodriver/app/modules/login/widgets/custom_form.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'login_controller.dart';
import 'widgets/custom_form.widget.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    double sh = MediaQuery.of(context).size.height;
    double sw = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Observer(
        builder: (context) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: sh * 0.6,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: sw * 0.02),
                  height: sh * 0.4,
                  child: Column(
                    children: [
                      CustomForm(
                          sufix: SizedBox(),
                          prefix: Icon(Icons.email),
                          hint: 'EMAIL',
                          obscure: false,
                          enabled: true,
                          onChanged: (value) {
                            controller.email = value;
                          },
                          type: TextInputType.emailAddress),
                      SizedBox(
                        height: sh * 0.03,
                      ),
                      CustomForm(
                        sufix: SizedBox(),
                        prefix: Icon(Icons.lock),
                        hint: 'PASSWORD',
                        obscure: true,
                        enabled: true,
                        onChanged: (value) {
                          controller.password = value;
                        },
                        type: TextInputType.text,
                      ),
                      Expanded(
                        child: SizedBox(),
                      ),
                      Container(
                        height: sh * 0.08,
                        width: sw * 0.6,
                        child: controller.loading == false
                            ? FlatButton(
                                onPressed: () {
                                  controller.login();
                                },
                                child: Text(
                                  'Acessar',
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: sh * 0.02,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            : Center(
                                child: CircularProgressIndicator(),
                              ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
