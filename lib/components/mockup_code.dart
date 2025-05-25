import 'package:jaspr/jaspr.dart';

String nullCheckDefaults(String? classes, String defaultClasses) {
  return (classes != null) ? '$defaultClasses $classes' : defaultClasses;
}

Component mockupCode(
  final List<Component>? children, {
  final String? classes,
  final String? id,
  final Key? key,
  final Styles? styles,
  final Map<String, String>? attributes,
  final Map<String, EventCallback>? events,
}) {
  String _classes = nullCheckDefaults(classes, 'mockup-code');
  print(_classes);
  return DomComponent(
    tag: 'div',
    classes: _classes,
    styles: styles,
    attributes: attributes,
    id: id,
    key: key,
    events: events,
    children: children,
  );
}
