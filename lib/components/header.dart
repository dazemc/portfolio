import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';
import 'package:logging/logging.dart';
import 'dart:math';

import 'package:jaspr_lucide/jaspr_lucide.dart' as lucide;
import '../constants/theme.dart';
import './svg.dart';

final log = Logger('/components/header');
final random = Random();

class Header extends StatefulComponent {
  const Header({super.key});

  @override
  State createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  List<Component> themeListElements(List<String> themeList) {
    List<Component> componentList = [
      randomTheme(themeList),
    ];
    for (String theme in themeList) {
      componentList.add(li([
        input(
            attributes: {
              'type': 'radio',
              'name': 'theme-dropdown',
              'aria-label': theme,
              'value': theme,
            },
            classes:
                'theme-controller w-full btn btn-sm btn-block btn-ghost justify-start',
            events: {
              'click': (event) {
                log.info('Theme changed');
                changeThemeName(theme);
              }
            },
            [])
      ]));
    }
    return componentList;
  }

  Component randomTheme(themeList) {
    int randomIdx = random.nextInt(themeList.length);
    final String theme = themeList[randomIdx];
    log.info('Random theme chosen: $theme');
    return li([
      input(
          attributes: {
            'type': 'radio',
            'name': 'theme-dropdown',
            'aria-label': 'random',
            'value': currentTheme,
          },
          classes:
              'theme-controller w-full btn btn-sm btn-block btn-primary justify-start animate-bounce',
          events: {
            'click': (event) {
              log.info('Theme changed: $theme');
              changeThemeName(theme);
              randomIdx; // changes theme for the next click
            },
          },
          [])
    ]);
  }

  void changeThemeName(String name) {
    setState(() {
      currentTheme = name;
    });
  }

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

  String currentTheme = defaultTheme;
  @override
  Iterable<Component> build(BuildContext context) sync* {
    List<Component> themeComponents = themeListElements(availableThemes);
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
                  child: lucide.house(
                      height: Unit.pixels(30),
                      width: Unit.pixels(30),
                      [text('test')])),
            ]),
            ul([
              div([
                Link(
                    classes:
                        'mx-1 btn btn-sm btn-primary ${!isRoot ? 'animate-pulse' : 'btn-dash'}',
                    to: '/about',
                    child: lucide.info(
                        height: Unit.pixels(30), width: Unit.pixels(30), []))
              ]),
            ]),
          ]),
          div(classes: 'dropdown', [
            div(
                attributes: {'tabindex': '0', 'role': 'button'},
                classes: 'btn m-1 w-25 hover:opacity-50',
                [text(currentTheme), chevronIcon()]),
            ul(
              attributes: {
                'tabindex': '0',
              },
              classes:
                  'dropdown-content bg-base-300 rounded-box z-1 p-2 shadow-2xl max-h-60 overflow-y-auto',
              themeComponents,
            )
          ])
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
