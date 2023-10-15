import 'dart:io';

import 'edit_dependencies.dart' show getDependencies;

void main(List<String> arguments) async {
  final (dependencies, devDependencies) = getDependencies();

  final list = dependencies
      .map(
        (package) => Process.run('fvm', ['flutter', 'pub', 'add', package]),
      )
      .toList();
  final listD = devDependencies.map(
    (package) => Process.run('fvm', ['flutter', 'pub', 'add', '-d', package]),
  );
  list.addAll(listD);
  await Future.wait(list);
}
