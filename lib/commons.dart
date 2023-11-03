import 'dart:io';

String get cliRootPath {
  final cliFilePath = Platform.script.path; // .../dart_cli/bin/dart_cli.dart
  return Directory(cliFilePath).parent.parent.path; // .../dart_cli
}

bool get isFlutterProjectRoot {
  final currentPath = Directory.current.path;
  final pubspecFile = File('$currentPath/pubspec.yaml');
  final libDir = Directory('$currentPath/lib');
  if (!pubspecFile.existsSync() || !libDir.existsSync()) {
    print('Here is not Flutter project root directory!'
        'Please execute at Flutter project root.');
    return false;
  }

  final pubspecContent = pubspecFile.readAsStringSync();
  return pubspecContent.contains('flutter');
}
