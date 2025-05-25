import 'package:jaspr/jaspr.dart';

import 'card_title.dart';
import 'card_actions.dart';

class CardBody extends StatelessComponent {
  final String? classes;
  final CardTitle? cardTitle;
  final CardActions? cardActions;
  final List<Component>? children;
  const CardBody(this.children,
      {this.classes, this.cardTitle, this.cardActions, super.key});

  String nullCheckDefaults(String? classes, String defaultClasses) {
    return (classes != null) ? '$defaultClasses $classes' : defaultClasses;
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    String _classes = nullCheckDefaults(classes, 'card-body');
    List<Component> _children =
        (cardTitle != null) ? [cardTitle! as Component] : [];
    _children += (children != null) ? children! : [];
    _children += (cardActions != null) ? [cardActions as Component] : [];

    yield div(classes: _classes, _children);
  }
}
