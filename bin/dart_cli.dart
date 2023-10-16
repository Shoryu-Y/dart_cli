import 'dart:async';

import 'package:dart_cli/pub_add_templates.dart';

FutureOr main(List<String> arguments) async {
  final useFVM = arguments.contains('--use-fvm');
  await pubAddTemplates(useFVM: useFVM);
}
