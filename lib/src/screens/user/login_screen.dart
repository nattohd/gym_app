import 'package:flutter/material.dart';
import 'package:gym_app/src/screens/user/widgets/form.dart';
import 'package:gym_app/src/screens/user/widgets/header_login.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      body: Column(children: [
        const HeaderLogin(),
        FormWidget(
          formKey: formKey,
        ),
        const SizedBox(height: 20),
        _ButtonInitLogin(formKey: formKey)
      ]),
    );
  }
}

class _ButtonInitLogin extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  const _ButtonInitLogin({required this.formKey});

  @override
  State<_ButtonInitLogin> createState() => _ButtonInitLoginState();
}

class _ButtonInitLoginState extends State<_ButtonInitLogin> {
  @override
  Widget build(BuildContext context) {
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
            onPressed: () {
              if (widget.formKey.currentState!.validate()) {
                setState(() {});
              }
            },
            label: const Icon(Icons.keyboard_arrow_right_outlined),
            icon: const Text('Ingresar'),
          ),
        ),
      ],
    ));
  }
}
