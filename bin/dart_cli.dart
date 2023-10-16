import 'dart:io';

import 'package:dart_cli/get_dependencies.dart' show getDependencies;

final commands = ['fvm', 'flutter', 'pub', 'add'];

void main(List<String> arguments) async {
  final useFVM = arguments.contains("--use-fvm");
  if (!useFVM) {
    commands.remove('fvm');
  }
  final executable = commands[0];
  final args = commands.getRange(1, commands.length - 1);

  final (dependencies, devDependencies) = getDependencies();
  final list = dependencies
      .map(
        (package) => Process.run(executable, [...args, package]),
      )
      .toList();
  final listD = devDependencies.map(
    (package) => Process.run(executable, [...args, '-d', package]),
  );
  await Future.wait([
    ...list,
    ...listD,
  ]);
}
