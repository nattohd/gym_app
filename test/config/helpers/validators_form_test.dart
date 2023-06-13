import 'package:flutter_test/flutter_test.dart';
import 'package:gym_app/config/helpers/validators_form.dart';

void main() {
  test('1 Test isValidEmail', () {
    expect(ValidatorsForm.isValidEmail('cristobal.herrerar@usm.cl'), true);
    expect(ValidatorsForm.isValidEmail('franco.mangini@usm.cl'), true);
    expect(ValidatorsForm.isValidEmail('sarita.gonzales@sansano.cl'), true);

    // Todos los de abajo deberian ser rechazados
    expect(
        ValidatorsForm.isValidEmail('cris tobal.herrerar@sansano.com'), false);
    expect(ValidatorsForm.isValidEmail('1cristobal.herrerar@usm.cl'), false);
    expect(ValidatorsForm.isValidEmail('_cris#tobal?.herrerar@usm.cl'), false);
    expect(ValidatorsForm.isValidEmail('cris tobal.herrerar@usm.cl'), false);
  });
  test('2 Test isCorrectFormatPassword', () {
    //Esta constrañseña cumple con todas las condiciones, por tanto ningun error
    final errors1 = ValidatorsForm.isCorrectFormatPassword('#holacomoestas');
    expect(errors1.isEmpty, true);

    // Si la contraseña tiene menor lenght que 8 deberia tener su respectivo error
    final errors2 = ValidatorsForm.isCorrectFormatPassword('#holas');
    expect(errors2.contains(PasswordErrors.isLeastLength), true);

    // Si la contraseña esta vacia deberian haber 3 errores
    final errors3 = ValidatorsForm.isCorrectFormatPassword('');
    expect(errors3.length == 3, true);
  });
}
