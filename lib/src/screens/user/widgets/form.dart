import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/config/helpers/validators_form.dart';
import 'package:gym_app/src/screens/user/widgets/input_form.dart';

class FormWidget extends StatefulWidget {
  final GlobalKey<FormState> formKey;

  const FormWidget({super.key, required this.formKey});
  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  String errorText = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final colors = Theme.of(context).colorScheme;
    final textStyle = Theme.of(context).textTheme;
    final isDarkMode = Brightness.dark == Theme.of(context).brightness;

    return Form(
      key: widget.formKey,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        margin: const EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 10),
        width: size.width,
        height: size.height * 0.45,
        decoration: BoxDecoration(
          color:
              isDarkMode ? const Color.fromARGB(255, 21, 21, 21) : Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: isDarkMode
                  ? const Color.fromARGB(255, 184, 183, 183).withOpacity(0.2)
                  : const Color.fromARGB(255, 39, 38, 38).withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 20,
              offset: const Offset(0, 4), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 20, top: 5),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Inicio de sesión',
                        style: textStyle.titleLarge,
                      )
                    ],
                  ),
                ],
              ),
            ),
            InputForm(
                text: 'Correo electronico',
                controller: emailCtrl,
                textInputType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Indique su email';
                  }
                  if (ValidatorsForm.isValidEmail(value)) {
                    return null;
                  } else {
                    return 'Ingrese un formato de email valido';
                  }
                }),
            const SizedBox(height: 25),
            InputForm(
              passObscure: true,
              enableEyeMode: true,
              text: 'Contraseña',
              controller: passwordCtrl,
              validator: (value) {
                if (ValidatorsForm.isPasswordDefined(value!)) {
                  return 'Debes ingresar una contraseña';
                }
              },
            ),
            const Spacer(),
            Expanded(
              child: InkWell(
                onTap: () {},
                child: Text(
                  '¿Olvidaste tu contraseña?',
                  style: TextStyle(
                    color: colors.surfaceTint,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}
