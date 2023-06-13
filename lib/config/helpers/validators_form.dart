class PasswordErrors {
  static const String isEmpty = 'Debe ingresar una contraseña';
  static const String isLeastLength =
      'La contraseña debe ser mayor a 8 caracteres';
  static const String isSpecialCaracters =
      'La contraseña debe contener al menos un caracter especial.';

  PasswordErrors();
}

class ValidatorsForm {
  static bool isValidEmail(value) {
    return RegExp(r"^[a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@(usm|sansano)\.cl$")
        .hasMatch(value);
  }

  static bool isPasswordDefined(String value) {
    return value.isEmpty;
  }

  static List<String> isCorrectFormatPassword(String value) {
    final errors = [
      PasswordErrors.isEmpty,
      PasswordErrors.isLeastLength,
      PasswordErrors.isSpecialCaracters,
    ];

    if (value.isNotEmpty) {
      errors.remove(PasswordErrors.isEmpty);
    }
    if (value.length >= 8) {
      errors.remove(PasswordErrors.isLeastLength);
    }
    RegExp regexCaractSpecial = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
    if (!regexCaractSpecial.hasMatch(value)) {
      errors.remove(PasswordErrors.isSpecialCaracters);
    }
    return errors;
  }
}
