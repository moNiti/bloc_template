extension StringValidator on String? {
  bool isNullOrEmpty() {
    return this == null || (this != null && this!.isEmpty);
  }
}
