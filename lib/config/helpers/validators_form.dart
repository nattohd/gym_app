class ValidatorsForm {
  static bool isValidEmail(value) {
    return RegExp(r"^[a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@(usm|sansano)\.cl$")
        .hasMatch(value);
  }

  static dynamic isCorrectFormatPassword(String value) {
    if (value.isEmpty) {
      return 'Debe ingresar una contraseña';
    }
    if (value.length < 8) {
      return 'La contraseña debe ser mayor a 8 caracteres';
    }
    RegExp regexCaractSpecial = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
    if (!regexCaractSpecial.hasMatch(value)) {
      return 'La contraseña debe contener al menos un caracter especial.';
    }
    return true;
  }
}
