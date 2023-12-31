import 'dart:io';

import 'package:dart_cli/commons.dart';
import 'package:dart_cli/exception.dart';

void buildYAMLTemplate() {
  if (!isFlutterProjectRoot) {
    throw NotFlutterRootException();
  }

  final currentPath = Directory.current.path;
  final buildFilePath = '$currentPath/build.yaml';
  final buildFile = File(buildFilePath);
  final templateBuildFile =
      File('$cliRootPath/lib/build_yaml_template/build.yaml');
  if (!buildFile.existsSync()) {
    templateBuildFile.copySync(buildFilePath);
    return;
  }

  print('build.yaml is already exist. Please Enter "yes" if want to override');
  final confirmOverride = stdin.readLineSync() == 'yes';
  if (confirmOverride) {
    templateBuildFile.copySync(buildFilePath);
    print('Complete override');
  }
}
