import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';

class LoginScreen extends StatelessWidget {
  static MaterialPage page() {
    return MaterialPage(
        name: FooderlichPages.loginPath,
        key: ValueKey(FooderlichPages.loginPath),
        child:  LoginScreen());
  }

  final String? username;
  final String? password;

   LoginScreen({
    Key? key,
    this.username,
    this.password,
  }) : super(key: key);

  final Color rwColor = Color.fromARGB(255, 235, 31, 31);
  final TextStyle focusedStyle = const TextStyle(color: Color(0xffa21313));
  final TextStyle unfocusedStyle = const TextStyle(color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 249, 245, 245),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 250,
                child: Image(
                  image: AssetImage('assets/fooderlich_assets/initial.png'),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              buildTextfield(
                username ?? 'username',
                textStyle: TextStyle(color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
              buildTextfield(
                password ?? 'password',
                textStyle: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 10),
              buildButton(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget buildButton(BuildContext context) {
    return SizedBox(
      height: 55,
      child: MaterialButton(
        color: rwColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: const Text(
          'Login',
          style: TextStyle(color: Colors.black),
        ),
        onPressed: () async {
          Provider.of<AppStateManager>(context, listen: false)
              .login('mockUsername', 'mockPassword');
        },
      ),
    );
  }

  Widget buildTextfield(String hintText, {required TextStyle textStyle}) {
    return TextField(
      cursorColor: rwColor,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 177, 10, 46),
            width: 5.0,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 177, 10, 46)),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(height: 0.5),
      ),
    );
  }
}
