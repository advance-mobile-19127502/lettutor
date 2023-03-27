class CustomException implements Exception {
  final String? _message;

  CustomException([this._message]);

  @override
  String toString() {
    return "$_message";
  }
}
