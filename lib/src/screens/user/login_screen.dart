import 'package:flutter/material.dart';
import 'package:gym_app/src/providers/user_provider.dart';
import 'package:gym_app/src/screens/user/widgets/form.dart';
import 'package:gym_app/src/screens/user/widgets/header_login.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailCtrl = TextEditingController();
    TextEditingController passwordCtrl = TextEditingController();
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      body: Column(children: [
        const HeaderLogin(),
        FormWidget(
          formKey: formKey,
          controllers: [emailCtrl, passwordCtrl],
        ),
        const SizedBox(height: 20),
        _ButtonInitLogin(
          formKey: formKey,
          controllers: [emailCtrl, passwordCtrl],
        )
      ]),
    );
  }
}

class _ButtonInitLogin extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final List<TextEditingController> controllers;
  const _ButtonInitLogin({required this.formKey, required this.controllers});

  @override
  State<_ButtonInitLogin> createState() => _ButtonInitLoginState();
}

class _ButtonInitLoginState extends State<_ButtonInitLogin> {
  @override
  Widget build(BuildContext context) {
    final userProvider = context.watch<UserProvider>();
    return Expanded(
        child: Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          width: double.infinity,
          child: FilledButton.icon(
            style: ButtonStyle(
              shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              padding: const MaterialStatePropertyAll(
                EdgeInsets.symmetric(vertical: 25),
              ),
            ),
            onPressed: () async {
              final email = widget.controllers[0].text;
              final password = widget.controllers[1].text;
              await userProvider.loginWithMicrosoftProvider();
              // if (widget.formKey.currentState!.validate() &&
              //     userProvider.status.value != AuthStatus.authenticating) {
              //   await userProvider.loginWithEmailAndPassword(email, password);
              // }
            },
            label: userProvider.status.value == AuthStatus.authenticating
                ? const CircularProgressIndicator(
                    color: Colors.white,
                  )
                : const Icon(Icons.keyboard_arrow_right_outlined),
            icon: userProvider.status.value == AuthStatus.authenticating
                ? Container()
                : const Text('Ingresar'),
          ),
        ),
      ],
    ));
  }
}
