import 'package:flutter_test/flutter_test.dart';
import 'package:gym_app/config/helpers/validators_form.dart';
import 'package:gym_app/infrastructure/models/reservas_model.dart';
import 'package:gym_app/infrastructure/repositories/auth_repository.dart';
import 'package:gym_app/infrastructure/repositories/reserva_repository.dart';

void main() {
  // Test aportados al Sprint 1 ⤵
  test('1 Test isValidEmail', () {
    //Todos los test de arriba debieran ser aprobados
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
  test('3 Test is correct calc of fechas y dias', () {
    // test no se pudo llevar a cabo, esto comentado en el pdf "Test unitarios aportados al sprint 1"
  });

  // Test aportados al Sprint 1 ⤴

  //Test aportados al Sprint 2  - 1/3 ⤵
  test('4 Test isCorrectRut', () {
    final errors1 = ValidatorsForm.isCorrectRut('20.440.649-9');
    expect(errors1.isEmpty, true);
    final errors2 = ValidatorsForm.isCorrectRut('20.440.649-8');
    expect(errors2.contains(RutErrors.isInvalidRut), true);
    final errors3 = ValidatorsForm.isCorrectRut('204406499');
    expect(errors3.contains(RutErrors.isIncorrectStructure), true);
  });
}
