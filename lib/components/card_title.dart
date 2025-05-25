import 'package:jaspr/jaspr.dart';

class CardTitle extends StatelessComponent {
  final int? header;
  final String? classes;
  final List<Component>? children;
  const CardTitle(this.children, {this.classes, this.header, super.key});

  String nullCheckDefaults(String? classes, String defaultClasses) {
    return (classes != null) ? '$defaultClasses $classes' : defaultClasses;
  }

  Component _header(int? header, List<Component> children, String classes) {
    switch (header) {
      case 1:
        return h1(classes: classes, children);
      case 2:
        return h2(classes: classes, children);
      case 3:
        return h3(classes: classes, children);
      case 4:
        return h4(classes: classes, children);
      case 5:
        return h5(classes: classes, children);
      case 6:
        return h6(classes: classes, children);
    }
    return h2(classes: classes, children);
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    String _classes = nullCheckDefaults(classes, 'card-title');
    List<Component> _children = (children != null) ? children! : [];

    yield _header(header, _children, _classes);
  }
}
