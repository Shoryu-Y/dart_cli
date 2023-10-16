import 'dart:io';

import 'package:dart_cli/commons.dart';

void analysisOptionsTemplate() {
  if (!isFlutterProjectRoot) {
    print('Here is not Flutter Project Root Directory!'
        'Please execute at Flutter Project Root.');
    return;
  }

  final currentPath = Directory.current.path;
  final analysisFilePath = '$currentPath/analysis_options.yaml';
  final analysisFile = File(analysisFilePath);
  final templateAnalysisFile =
      File('$cliRootPath/lib/analysis_options_template/analysis_options.yaml');
  if (!analysisFile.existsSync()) {
    templateAnalysisFile.copySync(analysisFilePath);
    return;
  }

  print('analysis_options.yaml is already exist. Please Enter "yes" if want to override');
  final confirmOverride = stdin.readLineSync() == 'yes';
  if (confirmOverride) {
    templateAnalysisFile.copySync(analysisFilePath);
    print('Complete override');
  }
}
