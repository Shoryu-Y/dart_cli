import 'package:dart_cli/pub_add_templates.dart';
import 'package:test/test.dart';

void main() {
  test('getCommands', () {
    expect(
      getCommands(useFVM: true).$1,
      'fvm',
    );
    expect(
      getCommands(useFVM: false).$1,
      'flutter',
    );
  });
}
