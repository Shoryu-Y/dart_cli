import 'dart:io';

final dependenciesFile = 'dependencies.json';

void main() {
  final selfFilePath = Platform.script.path;
  final projectPath = Directory(selfFilePath).parent.parent.path;
  final dependenciesFilePath = '$projectPath/lib/$dependenciesFile';
  final file = File(dependenciesFilePath);
}

void hoge() {
  final settingsFile = File(dependenciesFile);
  if (!settingsFile.existsSync()) {
    settingsFile.createSync();
  }

  final currentValue = settingsFile.readAsStringSync();
  String? newValue;
  if (currentValue.isEmpty) {
    print('Prease enter Flutter SDK full path.');
    newValue = stdin.readLineSync();
  } else {
    print('Enter new full path or press Enter-Key to use the current value. / $currentValue');
    newValue = stdin.readLineSync();
  }

  if (newValue != null) {
    settingsFile.writeAsStringSync(newValue);
  }

  final result = newValue ?? currentValue;
  print('Flutter SDK full path is set to $result');
}

