import 'package:jaspr/jaspr.dart';

enum ButtonColor {
  neutral('btn-neutral'),
  primary('btn-primary'),
  secondary('btn-secondary'),
  accent('btn-accent'),
  info('btn-info'),
  success('btn-success'),
  warning('btn-warning'),
  error('btn-error'),
  none('');

  final String value;
  const ButtonColor(this.value);
  @override
  String toString() => value.toString();
}

enum ButtonStyle {
  outline('btn-outline'),
  dash('btn-dash'),
  soft('btn-soft'),
  ghost('btn-ghost'),
  link('btn-link'),
  none('');

  final String value;
  const ButtonStyle(this.value);
  @override
  String toString() => value.toString();
}

enum ButtonBehavior {
  active('btn-active'),
  disabled('btn-disabled'),
  none('');

  final String value;
  const ButtonBehavior(this.value);
  @override
  String toString() => value.toString();
}

enum ButtonSize {
  xs('btn-xs'),
  sm('btn-sm'),
  md('btn-md'),
  lg('btn-lg'),
  xl('btn-xl'),
  none('');

  final String value;
  const ButtonSize(this.value);
  @override
  String toString() => value.toString();
}

enum ButtonModifier {
  wide('btn-wide'),
  block('btn-block'),
  square('btn-square'),
  circle('btn-circle'),
  none('');

  final String value;
  const ButtonModifier(this.value);
  @override
  String toString() => value.toString();
}

Component button(
  final List<Component>? children, {
  final String? classes,
  final ButtonColor? color,
  final List<ButtonStyle>? buttonStyle,
  final ButtonSize? size,
  final ButtonBehavior? behavior,
  final ButtonModifier? modifier,
  final Styles? styles,
  final Key? key,
  final String? id,
  final Map<String, String>? attributes,
  final Map<String, EventCallback>? events,
}) {
  String getClasses() {
    List<String> output = [
      'btn',
      if (color != null) color.toString(),
      if (buttonStyle != null) ...buttonStyle.map((style) => style.toString()),
      if (size != null) size.toString(),
      if (behavior != null) behavior.toString(),
      if (modifier != null) modifier.toString(),
      classes ?? '',
    ];
    return output.join(' ');
  }

  return DomComponent(
    tag: 'div',
    classes: getClasses(),
    key: key,
    id: id,
    styles: styles,
    children: children,
    attributes: attributes,
    events: events,
  );
}
