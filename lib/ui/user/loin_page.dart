import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_course/api/http_api.dart';
import 'package:flutter_course/provider/user_provider.dart';
import 'package:flutter_course/util/helper.dart';
import 'package:provider/provider.dart';
import '../../constrant/route_path.dart';
import '../../model/user.dart';
import '../common/custom_button_widget.dart';
import '../common/custom_textfield_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController textUsername = TextEditingController();
  TextEditingController textPassword = TextEditingController();
  bool isShowPassword = true;
  bool isChecked = false;
  UserProvider? userProvider;

  Future<void> login(
      {required String userName, required String password}) async {
    final Map<String, dynamic> params = <String, dynamic>{};
    params['username'] = userName;
    params['password'] = password;

    await HttpApi.post('api/login', body: params).then((value) {
      print(value?.statusCode);
      if (value?.statusCode == 200) {
        var a = jsonDecode(value!.body);
        User user = User.fromJson(a);
        // save the user to the provider
        userProvider!.setUser(user);
        Navigator.pushNamed(context, RoutePath.home);
      } else {
        Helpers.warningDialog(context, message: "Invalid username or password");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    userProvider ??= Provider.of<UserProvider>(context);
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              height: 500,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 10,
                child: Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 30),
                      CustomTextFieldWidget(
                        label: 'Username',
                        prefixIcon: const Icon(Icons.person),
                        text: textUsername,
                      ),
                      CustomTextFieldWidget(
                        label: 'Password',
                        prefixIcon: const Icon(Icons.lock),
                        text: textPassword,
                        suffixIcon: Icons.remove_red_eye_sharp,
                        obscureText: isShowPassword,
                        onPressed: () {
                          setState(() {
                            if (isShowPassword) {
                              isShowPassword = false;
                            } else {
                              isShowPassword = true;
                            }
                          });
                        },
                      ),
                      Row(
                        children: [
                          Container(
                            child: Checkbox(
                              value: isChecked,
                              onChanged: (value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              },
                            ),
                          ),
                          Text('Remember me'),
                        ],
                      ),
                      CustomButtonWidget(
                        onPressed: () {
                          if (textUsername.text.isEmpty) {
                            Helpers.warningDialog(context,
                                message: "Username is required");
                          } else if (textPassword.text.isEmpty) {
                            Helpers.warningDialog(context,
                                message: "Password is required");
                          } else {
                            login(
                                userName: textUsername.text,
                                password: textPassword.text);
                          }
                        },
                        color: Theme.of(context).primaryColor,
                        label: 'Login',
                        textColor: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}