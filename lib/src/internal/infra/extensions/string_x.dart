extension StringX on String {
  String get toSnakeCase {
    final exp = RegExp(r'(?<=[a-z\d])[A-Z]');
    return toString()
        .replaceAllMapped(exp, (Match m) => ('_${m.group(0)}'))
        .toLowerCase();
  }
}
