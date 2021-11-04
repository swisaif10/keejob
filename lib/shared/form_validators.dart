import 'package:flutter/cupertino.dart';

class CustomerFormValidator {
  static FormFieldValidator<T> backendValidation<T>(
    BuildContext context, {
    required String fieldName,
    required Map<String, dynamic>? backendErrors,
  }) {
    return (T? valueCandidate) {
      if (backendErrors != null && backendErrors.containsKey(fieldName)) {
        return backendErrors[fieldName].join('\n');
      }
      return null;
    };
  }
}
