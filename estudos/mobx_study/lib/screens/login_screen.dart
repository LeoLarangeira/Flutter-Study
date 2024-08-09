import 'package:flutter/material.dart';
import 'package:mobx_study/screens/list_screen.dart';
import 'package:mobx_study/stores/login_store.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isObscure = false;

  LoginStore loginStore = LoginStore();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.all(32),
                child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 16,
                    child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              TextFormField(
                                  validator: (val) {
                                    if (val == null ||
                                        val.isEmpty ||
                                        !val.contains("@")) {
                                      return "Enter a valid email";
                                    }
                                    return null;
                                  },
                                  onChanged: loginStore.setEmail,
                                  obscureText: false,
                                  decoration: const InputDecoration(
                                    hintText: "e-mail",
                                    icon: Icon(Icons.mail),
                                    hintStyle: TextStyle(color: Colors.black45),
                                  )),
                              const Padding(padding: EdgeInsets.all(16)),
                              TextFormField(
                                obscureText: isObscure,
                                onChanged: loginStore.setPassword,
                                decoration: InputDecoration(
                                  hintText: "password",
                                  icon: const Icon(Icons.lock),
                                  hintStyle:
                                      const TextStyle(color: Colors.black45),
                                  suffixIcon: IconButton(
                                      icon: Icon(
                                        isObscure
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          isObscure = !isObscure;
                                        });
                                      }),
                                ),
                              ),
                              const Padding(padding: EdgeInsets.all(16)),
                              Observer(
                                builder: (_) {
                                  return TextButton(
                                      style: TextButton.styleFrom(
                                          foregroundColor: Colors.white,
                                          disabledBackgroundColor:
                                              Theme.of(context)
                                                  .primaryColor
                                                  .withAlpha(100),
                                          backgroundColor:
                                              Colors.deepPurpleAccent),
                                      onPressed: loginStore.isFormvalid
                                          ? () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const ListScreen()));
                                            }
                                          : null,
                                      child: const Text('Login'));
                                },
                              )
                            ]))))));
  }
}
