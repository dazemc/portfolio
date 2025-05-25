import 'package:jaspr/jaspr.dart';

class MockupCode extends StatelessComponent {
  final String? classes;
  final List<Component>? children;
  const MockupCode(this.children, {this.classes, super.key});

  String nullCheckDefaults(String? classes, String defaultClasses) {
    return (classes != null) ? '$defaultClasses $classes' : defaultClasses;
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    String _classes = nullCheckDefaults(classes, 'mockup-code');
    yield div(classes: _classes, children ?? []);
  }
}
