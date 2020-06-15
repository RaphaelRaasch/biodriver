import 'package:biodriver/app/modules/login/widgets/custom_form.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'login_controller.dart';

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
    var sizeW = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              height: sizeW + sizeW / 2,
              child: Observer(
                builder: (context) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 200,
                      ),
                      CustomForm(
                        enabled: true,
                        hint: 'Email',
                        obscure: false,
                        onChanged: (value) {
                          controller.email = value;
                        },
                        prefix: Icon(Icons.email),
                        sufix: SizedBox(),
                        type: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      CustomForm(
                        enabled: true,
                        hint: 'Password',
                        obscure: true,
                        onChanged: (value) {
                          controller.password = value;
                        },
                        prefix: Icon(Icons.lock),
                        sufix: Icon(Icons.visibility),
                        type: TextInputType.text,
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      Container(
                        height: 80,
                        width: double.maxFinite,
                        child: FlatButton(
                          onPressed: () {
                            controller.login();
                          },
                          child: Text(
                            'ENTRAR',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                              shadows: [
                                Shadow(
                                  blurRadius: 5,
                                  color: Colors.grey,
                                  offset: Offset(2, 2),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              )),
        ),
      ),
    );
  }
}
