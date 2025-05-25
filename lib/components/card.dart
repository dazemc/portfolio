import 'package:jaspr/jaspr.dart';
import 'card_body.dart';

class Card extends StatelessComponent {
  final String? classes;
  final CardBody? cardBody;
  final List<Component>? children;
  const Card(this.children, {this.classes, this.cardBody, super.key});

  String nullCheckDefaults(String? classes, String defaultClasses) {
    return (classes != null) ? '$defaultClasses $classes' : defaultClasses;
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    String _classes = nullCheckDefaults(classes, 'card');
    List<Component> _children = (children != null) ? children! : [];
    _children += (cardBody != null) ? [cardBody as Component] : [];

    yield div(classes: _classes, _children);
  }
}
