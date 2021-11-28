import 'package:form_field_validator/form_field_validator.dart';

class PhoneValidator extends TextFieldValidator {
  /// regex pattern to validate email inputs.
  final Pattern _pattern = r"\d{10}";

  PhoneValidator({required String errorText}) : super(errorText);

  @override
  bool isValid(String? value) =>
      hasMatch(_pattern.toString(), value!, caseSensitive: false);

  // @override
  // bool isValid(String value) =>
  //     hasMatch(_emailPattern.toString(), value, caseSensitive: false);
}
