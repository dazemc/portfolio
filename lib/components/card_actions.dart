import 'package:jaspr/jaspr.dart';

class CardActions extends StatelessComponent {
  final List<Component>? children;
  final String? classes;

  const CardActions(this.children, {this.classes, super.key});

  String nullCheckDefaults(String? classes, String defaultClasses) {
    return (classes != null) ? '$defaultClasses $classes' : defaultClasses;
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    String _classes = nullCheckDefaults(classes, 'card-actions');
    yield div(classes: _classes, children ?? []);
  }
}
