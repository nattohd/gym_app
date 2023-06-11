class ValidatorsForm {
  static bool isValidEmail(value) {
    return RegExp(r"^[a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@(usm|sansano)\.cl$")
        .hasMatch(value);
  }

  static bool isCorrectFormatPassword(String value) {
    // Añade las validaciones de contraseña aqui

    // Pregunta si la contraseña esta vacia ⬇️
    return value.isEmpty;
  }
}
