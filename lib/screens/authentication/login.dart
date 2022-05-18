// ignore_for_file: unused_import

import 'package:final_project/provider/AuthProvider/auth_provider.dart';
import 'package:final_project/screens/authentication/register.dart';
import 'package:final_project/utils/routers.dart';
import 'package:final_project/utils/snack_message.dart';
import 'package:final_project/widgets/button.dart';
import 'package:final_project/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  void dispose() {
    _email.clear();
    _password.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login '),
        leading: const Icon(Icons.login),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    const Image(
                      image: AssetImage("assets/images/png03.png"),
                      height: 200.0,
                      fit: BoxFit.cover,
                    ),

                    customTextField(
                      lable: "Login Email",
                      controller: _email,
                      hint: 'Enter you valid email address',
                      
                    ),
                    customTextField(
                      lable: 'Login Password',
                      controller: _password,
                      hint: 'Enter your secured password',
                    ),
                    const Text(
                      'Frogot password ?', 
                      textAlign: TextAlign.center,
                    ),

                    ///Button
                    Consumer<AuthenticationProvider>(
                        builder: (context, auth, child) {
                      WidgetsBinding.instance!.addPostFrameCallback((_) {
                        if (auth.resMessage != '') {
                          showMessage(
                              message: auth.resMessage, context: context);

                          ///Clear the response message to avoid duplicate
                          auth.clear();
                        }
                      });
                      return customButton(
                        text: 'Login',
                        tap: () {
                          if (_email.text.isEmpty || _password.text.isEmpty) {
                            showMessage(
                                message: "All fields are required !",
                                context: context);
                            dispose();
                          } else {
                            auth.LoginUser(
                                context: context,
                                email: _email.text.trim(),
                                password: _password.text.trim());
                          }
                        },
                        context: context,
                        status: auth.isLoading,
                      );
                    }),

                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const RegisterPage()));
                          },
                          child: Container(
                            height: 30.0,
                            width: 30.0,
                            child: const Icon(
                              Icons.apple,
                              size: 20.0,
                            ),
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(40)),
                                // ignore: prefer_const_literals_to_create_immutables
                                boxShadow: [
                                  const BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(5.0, 5.0),
                                    blurRadius: 15.0,
                                    spreadRadius: 1.0,
                                  ),
                                  const BoxShadow(
                                      color: Colors.white,
                                      offset: Offset(-5.0, -5.0),
                                      blurRadius: 15.0,
                                      spreadRadius: 1.0)
                                ]),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const RegisterPage()));
                          },
                          child: Container(
                            height: 30.0,
                            width: 30.0,
                            child: const Icon(
                              Icons.facebook,
                              size: 20.0,
                            ),
                            decoration: BoxDecoration(
                                color: Colors.blue.shade900,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(40)),
                                // ignore: prefer_const_literals_to_create_immutables
                                boxShadow: [
                                  const BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(5.0, 5.0),
                                    blurRadius: 15.0,
                                    spreadRadius: 1.0,
                                  ),
                                  const BoxShadow(
                                      color: Colors.white,
                                      offset: Offset(-5.0, -5.0),
                                      blurRadius: 15.0,
                                      spreadRadius: 1.0)
                                ]),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const RegisterPage()));
                          },
                          child: Container(
                            height: 30.0,
                            width: 30.0,
                            child: const Icon(
                              Icons.apple,
                              size: 20.0,
                              color: Colors.white,
                            ),
                            decoration: BoxDecoration(
                                color: Colors.deepOrange.shade900,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(40)),
                                // ignore: prefer_const_literals_to_create_immutables
                                boxShadow: [
                                  const BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(5.0, 5.0),
                                    blurRadius: 15.0,
                                    spreadRadius: 1.0,
                                  ),
                                  const BoxShadow(
                                      color: Colors.white,
                                      offset: Offset(-5.0, -5.0),
                                      blurRadius: 15.0,
                                      spreadRadius: 1.0)
                                ]),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Divider(
                      thickness: 2,
                      indent: 20,
                      endIndent: 20,
                      color: Color.fromARGB(255, 196, 196, 196),
                      height: 20,
                    ),
                    const Text(
                      "By login you are agreeing to the",
                      style: TextStyle(color: Colors.grey),
                    ),
                    const Text(
                      "Terms & Conditions and Privacy Policy",
                      style: TextStyle(color: Colors.grey),
                    ),
                    GestureDetector(
                      onTap: () {
                        PageNavigator(ctx: context)
                            .nextPage(page: const RegisterPage());
                      },
                      child: const Text(
                        "Don't have an account? Register",
                        style: TextStyle(color: Colors.black87),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
