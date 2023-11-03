final class NotFlutterRootException implements Exception {
  const NotFlutterRootException();

  String get message => '''Here is not Flutter project root directory! Please execute at Flutter project root.''';

  @override
  String toString() {
    return message;
  }
}
