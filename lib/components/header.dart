import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';
import 'package:logging/logging.dart';
import 'dart:math';

import 'package:jaspr_lucide/jaspr_lucide.dart' as lucide;
import '../constants/theme.dart';
import 'theme_controller.dart';

final log = Logger('/components/header');
final random = Random();

class Header extends StatefulComponent {
  const Header({super.key});

  @override
  State createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  bool isPathRoot(String path) {
    if (path.isEmpty) {
      return false;
    } else {
      if (path.length > 1) {
        if ('#' == path[1]) {
          return true;
        } else {
          return false;
        }
      } else {
        return true;
      }
    }
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    var activePath = RouteState.of(context).location;
    bool isRoot = isPathRoot(activePath);
    print('active path: $activePath');
    yield header([
      nav(classes: 'm-4', [
        div(classes: 'navbar bg-neutral shadow-sm rounded-box', [
          div(classes: 'flex flex-row flex-1', [
            ul([
              Link(
                classes:
                    'mx-1 btn btn-sm btn-primary ${isRoot ? 'btn-active animate-pulse' : 'btn-dash'}',
                to: '/',
                child: lucide.House(
                  height: Unit.pixels(30),
                  width: Unit.pixels(30),
                ),
              ),
            ]),
            ul([
              div([
                Link(
                    classes:
                        'mx-1 btn btn-sm btn-primary ${!isRoot ? 'animate-pulse' : 'btn-dash'}',
                    to: '/about',
                    child: lucide.Info(
                        height: Unit.pixels(30), width: Unit.pixels(30)))
              ]),
            ]),
          ]),
          ThemeController(
            themeName: defaultTheme,
            dropdownIcon: lucide.ChevronDown(classes: 'animate-wiggle'),
            randomThemeClasses:
                'w-full btn btn-sm btn-block btn-ghost justify-start',
          )
        ]),
      ]),
    ]);
  }

  // @css
  // static final styles = [
  //   css('header', [
  //     css('&').styles(
  //       display: Display.flex,
  //       padding: Padding.all(1.em),
  //       justifyContent: JustifyContent.center,
  //     ),
  //     css('nav', [
  //       css('&').styles(
  //         display: Display.flex,
  //         height: 3.em,
  //         radius: BorderRadius.all(Radius.circular(10.px)),
  //         overflow: Overflow.clip,
  //         justifyContent: JustifyContent.spaceBetween,
  //       ),
  //       css('a', [
  //         css('&').styles(
  //           display: Display.flex,
  //           height: 100.percent,
  //           padding: Padding.symmetric(horizontal: 2.em),
  //           alignItems: AlignItems.center,
  //           color: Colors.white,
  //           fontWeight: FontWeight.w700,
  //           textDecoration: const TextDecoration(line: TextDecorationLine.none),
  //         ),
  //         css('&:hover').styles(
  //           backgroundColor: const Color.hex('#0005'),
  //         ),
  //       ]),
  //       css('div.active', [
  //         css('&').styles(position: const Position.relative()),
  //         css('&::before').styles(
  //           content: '',
  //           display: Display.block,
  //           position:
  //               Position.absolute(bottom: 0.5.em, left: 20.px, right: 20.px),
  //           height: 2.px,
  //           radius: BorderRadius.circular(1.px),
  //           backgroundColor: Colors.white,
  //         ),
  //       ])
  //     ]),
  //   ]),
  // ];
}
