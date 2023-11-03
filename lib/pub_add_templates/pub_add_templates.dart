import 'dart:io';

import 'package:dart_cli/commons.dart';
import 'package:dart_cli/pub_add_templates/get_dependencies.dart';

Future<void> pubAddTemplates({required bool useFVM}) async {
  if (!isFlutterProjectRoot) {
    return;
  }

  final (executable, arguments) = getCommands(useFVM: useFVM);
  final (dependencies, devDependencies) = getDependencies();
  final list = dependencies.map(
    (package) => Process.run(executable, [...arguments, package]),
  );
  final listD = devDependencies.map(
    (package) => Process.run(executable, [...arguments, '-d', package]),
  );

  await Future.wait([
    ...list,
    ...listD,
  ]);
}

(String, List<String>) getCommands({required bool useFVM}) {
  final commands = ['fvm', 'flutter', 'pub', 'add'];
  if (!useFVM) {
    commands.remove('fvm');
  }

  final executable = commands[0];
  final arguments = commands.getRange(1, commands.length).toList();
  return (executable, arguments);
}
