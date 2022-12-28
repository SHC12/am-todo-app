extension StringExtension on String? {
  /// Check if string is null or blank
  bool isBlank() {
    if (this == null) {
      return true;
    } else {
      if (this!.isEmpty) {
        return true;
      } else {
        return false;
      }
    }
  }

  /// Get first character of word(s)
  String? getFirstWordOfTitle({int countWord = 2}) {
    if (this != null) {
      List<String> splitWord = this!.split(' ');
      String initial = '';
      for (var i = 0; i < splitWord.length; i++) {
        if (i < countWord) {
          initial += splitWord[i][0];
        } else {
          break;
        }
      }
      String name = initial.toUpperCase();
      return name;
    } else {
      return '';
    }
  }
}
