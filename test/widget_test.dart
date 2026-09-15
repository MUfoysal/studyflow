
import 'package:flutter_test/flutter_test.dart';
import 'package:study_flow/data/project_data.dart';

void main() {
  test('StudyFlow project data is available', () {
    expect(projects, isNotEmpty);
    expect(projects.first.title, 'StudyFlow');
  });
}
