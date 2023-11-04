import 'dart:async';

import 'package:dart_cli/ast/ast.dart';
import 'package:dart_cli/build_yaml_template/build_yaml_template.dart';
import 'package:dart_cli/pub_add_templates/pub_add_templates.dart';
import 'package:dart_cli/analysis_options_template/analysis_options_template.dart';

FutureOr main(List<String> arguments) async {
  // astExample();
  final useFVM = arguments.contains('--use-fvm');
  await pubAddTemplates(useFVM: useFVM);
  buildYAMLTemplate();
  analysisOptionsTemplate();
}
