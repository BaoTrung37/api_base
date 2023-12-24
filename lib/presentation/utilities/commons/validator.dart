import 'package:form_validator/form_validator.dart';

class Validator extends ValidationBuilder {
  static final emailRegExp = RegExp(
      r'^[a-zA-Z0-9_\-+/!%]+(\.[a-zA-Z0-9_\-+/!%]+)*[a-zA-Z0-9_\-+/!%]*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9.-]+)?$');

  @override
  ValidationBuilder required([String? message]) {
    final error = message ?? 'Must be fill the blank';

    // Handle execute required validation first before other validations
    validations.insert(
      0,
      (value) => (value == null || value.isEmpty) ? error : null,
    );
    return this;
  }

  @override
  ValidationBuilder email([String? message]) {
    final error = message ?? 'Not email';
    return add(
      (value) => (value == null || emailRegExp.hasMatch(value)) ? null : error,
    );
  }

  @override
  ValidationBuilder minLength(int minLength, [String? message]) {
    final error = message ?? 'Min Length: $minLength';
    return add(
      (value) => (value != null && value.length < minLength) ? error : null,
    );
  }

  @override
  ValidationBuilder maxLength(int maxLength, [String? message]) {
    final error = message ?? 'Min Length: $maxLength';
    return add(
      (value) => (value != null && value.length > maxLength) ? error : null,
    );
  }
}
