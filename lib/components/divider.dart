import 'package:jaspr/jaspr.dart';

enum DividerDirection {
  vertical(' divider-vertical'),
  horziontal(' divider-horizontal');

  final String value;
  const DividerDirection(this.value);
  @override
  String toString() => value;
}

enum DividerPlacement {
  start(' divider-start'),
  center(''),
  end(' divider-end');

  final String value;
  const DividerPlacement(this.value);
  @override
  String toString() => value;
}

enum DividerColor {
  neutral(' divider-neutral'),
  primary(' divider-primary'),
  secondary(' divider-secondary'),
  accent(' divider-accent'),
  success(' divider-success'),
  warning(' divider-warning'),
  info(' divider-info'),
  error(' divider-error');

  final String value;
  const DividerColor(this.value);
  @override
  String toString() => value;
}

class Divider extends StatelessComponent {
  final String? classes;
  final List<Component>? children;
  final DividerDirection? direction;
  final DividerPlacement? placement;
  final DividerColor? color;
  const Divider(this.children,
      {this.classes, this.direction, this.placement, this.color, super.key});

  String nullAttr(dynamic attr) => attr != null ? attr.toString() : '';

  String getDirection() => nullAttr(direction);
  String getPlacement() => nullAttr(placement);
  String getColor() => nullAttr(color);

  String nullCheckDefaults(String? classes, String defaultClasses) {
    return (classes != null) ? '$defaultClasses $classes' : defaultClasses;
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    String _classes = nullCheckDefaults(classes, 'divider');
    _classes += getDirection();
    _classes += getPlacement();
    _classes += getColor();

    print(_classes);
    yield div(classes: _classes, children ?? []);
  }
}
