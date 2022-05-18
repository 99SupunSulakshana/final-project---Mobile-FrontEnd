import 'package:final_project/provider/AuthProvider/auth_provider.dart';
import 'package:final_project/screens/authentication/login.dart';
import 'package:final_project/utils/routers.dart';
import 'package:final_project/utils/snack_message.dart';
import 'package:final_project/widgets/button.dart';

import 'package:final_project/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();

  @override
  void dispose() {
    _email.clear();
    _password.clear();
    _firstName.clear();
    _lastName.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Register'),
          leading: const Icon(
            Icons.app_registration,
          )),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
                padding: const EdgeInsets.only(
                    top: 50.0, left: 15.0, right: 15.0, bottom: 75.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Image(
                      image: AssetImage("assets/images/png03.png"),
                      height: 200.0,
                      fit: BoxFit.cover,
                    ),
                    customTextField(
                      lable: "First Name",
                      controller: _firstName,
                      hint: 'Enter your first name',
                    ),
                    customTextField(
                      lable: "Last Name",
                      controller: _lastName,
                      hint: 'Enter your Last Name',
                    ),

                    customTextField(
                      lable: "Email Address",
                      controller: _email,
                      hint: 'Enter you valid email address',
                    ),
                    customTextField(
                      lable: "Password",
                      controller: _password,
                      hint: 'Enter your secured password',
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
                        text: 'Register',
                        tap: () {
                          if (_email.text.isEmpty ||
                              _password.text.isEmpty ||
                              _firstName.text.isEmpty ||
                              _lastName.text.isEmpty) {
                            showMessage(
                                message: "All fields are required",
                                context: context);
                       
                          } else {
                            auth.registerUser(
                                firstName: _firstName.text.trim(),
                                lastName: _lastName.text.trim(),
                                email: _email.text.trim(),
                                password: _password.text.trim(),
                                context: context);
                   
                          }
                        },
                        context: context,
                        status: auth.isLoading,
                      );
                    }),
                    const Divider(
                      thickness: 2,
                      indent: 20,
                      endIndent: 20,
                      color: Color.fromARGB(255, 196, 196, 196),
                      height: 20,
                    ),
                    const Text("By login you are agreeing to the"),
                    const Text("Terms & Conditions and Privacy Policy"),

                    const SizedBox(
                      height: 5.0,
                    ),

                    GestureDetector(
                      onTap: () {
                        PageNavigator(ctx: context)
                            .nextPage(page: const LoginPage());
                      },
                      child: const Text('Already have an account ? Login'),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
