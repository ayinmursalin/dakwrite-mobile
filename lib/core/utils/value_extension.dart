extension StringExt on String {
  String? nullIfEmpty() {
    if (isEmpty) return null;

    return this;
  }

  String getFileName() {
    if (isEmpty) return '';

    final last = split('/').last;
    if (last.contains('.')) {
      return last.replaceAll('-', '_');
    }

    return '';
  }

  String replaceIfEmpty(String replacement) {
    if (isEmpty) {
      return replacement;
    }

    return this;
  }
}

extension DynamicExt on dynamic {
  bool isTrue() {
    return this != null && this is bool && this == true;
  }
}
