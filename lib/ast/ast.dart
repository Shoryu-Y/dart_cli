import 'dart:async';
import 'dart:io';

import 'package:analyzer/dart/analysis/analysis_context_collection.dart';
import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:dart_cli/commons.dart';

FutureOr<void> astExample() async {
  final path = '$cliRootPath/lib/ast/example_widget.dart';

  final result = await AnalysisContextCollection(includedPaths: [path])
      .contextFor(path)
      .currentSession
      .getResolvedUnit(path);

  if (result is! ResolvedUnitResult) {
    print('not ResolvedUnitResult');
    return;
  }
  final topNodes = result.unit.sortedDirectivesAndDeclarations;
  final types = topNodes.map((e) => e.runtimeType);
  print('ResolvedUnit: $types');

  final importDirectiveNode = topNodes[0] as ImportDirective;
  final exampleWidgetClassDeclarationNode = topNodes[1] as ClassDeclaration;
  final exampleWidgetStateClassDeclarationNode = topNodes[2] as ClassDeclaration;

  // print('${importDirectiveNode.childEntities.map((e) => e.runtimeType)}');

  print('${exampleWidgetClassDeclarationNode.declaredElement.runtimeType}');
  print('${exampleWidgetClassDeclarationNode.childEntities.map((e) => e.runtimeType)}');
}
