import 'package:jaspr/jaspr.dart';

Component houseIcon() {
  return svg(
    width: Unit.pixels(30),
    height: Unit.pixels(30),
    viewBox: '0 0 24 24',
    attributes: {
      'fill': 'none',
      'stroke': 'currentColor',
      'stroke-width': '2',
      'stroke-linecap': 'round',
      'stroke-linejoin': 'round',
    },
    [
      path(d: 'M15 21v-8a1 1 0 0 0-1-1h-4a1 1 0 0 0-1 1v8', []),
      path(
          d: 'M3 10a2 2 0 0 1 .709-1.528l7-5.999a2 2 0 0 1 2.582 0l7 5.999A2 2 0 0 1 21 10v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z',
          []),
    ],
  );
}

Component chevronIcon() {
  return svg(
    width: Unit.pixels(12),
    height: Unit.pixels(12),
    viewBox: '0 0 2048 2048',
    attributes: {
      'class': 'inline-block h-2 w-2 fill-current opacity-60',
      'xmlns': 'http://www.w3.org/2000/svg',
    },
    [
      path(d: 'M1799 349l242 241-1017 1017L7 590l242-241 775 775 775-775z', []),
    ],
  );
}
