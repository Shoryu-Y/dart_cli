import 'dart:convert';
import 'dart:io';

const dependenciesJsonFile = 'dependencies.json';

const defaultDependencies = [
  'flutter_riverpod',
  'freezed_annotation',
];

const defaultDevDependencies = [
  'pedantic_mono',
  'freezed',
  'json_serializable',
  'build_runner',
];

const dependenciesKey = 'dependencies';
const devDependenciesKey = 'dev_dependencies';

void main() {
  final (dependencies, devDependencies) = getDependencies();
}

(List<String>, List<String>) getDependencies() {
  final selfFilePath = Platform.script.path;
  final projectPath = Directory(selfFilePath).parent.parent.path;
  final dependenciesFilePath = '$projectPath/lib/$dependenciesJsonFile';
  final file = File(dependenciesFilePath);

  late final String dependenciesJson;
  if (!file.existsSync()) {
    dependenciesJson = _getDefaultDependenciesJson();
    file.createSync();
    file.writeAsStringSync(dependenciesJson);
  } else {
    dependenciesJson = file.readAsStringSync();
  }

  final values = json.decode(dependenciesJson) as Map<String, dynamic>;
  final dependencies = (values[dependenciesKey] as List<dynamic>)
      .map((e) => e as String)
      .toList();
  final devDependencies = (values[devDependenciesKey] as List<dynamic>)
      .map((e) => e as String)
      .toList();
  print('dependencies: $dependencies');
  print('dev_dependencies: $devDependencies');
  return (dependencies, devDependencies);
}

String _getDefaultDependenciesJson() {
  final defaultValues = {
    dependenciesKey: defaultDependencies,
    devDependenciesKey: defaultDevDependencies,
  };
  return json.encode(defaultValues);
}
