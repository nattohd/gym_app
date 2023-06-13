import 'package:flutter_test/flutter_test.dart';
import 'package:gym_app/config/helpers/validators_form.dart';

void main() {
  test('1 Test isValidEmail correct', () {
    expect(ValidatorsForm.isValidEmail('cristobal.herrerar@usm.cl'), true);
    expect(ValidatorsForm.isValidEmail('franco.mangini@usm.cl'), true);
    expect(ValidatorsForm.isValidEmail('sarita.gonzales@sansano.cl'), true);
  });
  test('2 Test isValidEmail incorrect', () {
    expect(
        ValidatorsForm.isValidEmail('cris tobal.herrerar@sansano.com'), false);
    expect(ValidatorsForm.isValidEmail('1cristobal.herrerar@usm.cl'), false);
    expect(ValidatorsForm.isValidEmail('_cris#tobal?.herrerar@usm.cl'), false);
    expect(ValidatorsForm.isValidEmail('cris tobal.herrerar@usm.cl'), false);
  });
}
