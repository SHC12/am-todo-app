class Validation {
  String? validateNotNull(String? value, fieldName) {
    if (value == '') {
      return '$fieldName tidak boleh kosong';
    } else {
      return null;
    }
  }
}
