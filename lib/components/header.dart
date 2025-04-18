import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

import '../constants/theme.dart';

List<Component> themeListElements(List<String> themeList) {
  List<Component> componentList = [];
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
          [])
    ]));
  }
  return componentList;
}

class Header extends StatelessComponent {
  const Header({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    List<Component> themeComponents = themeListElements(availableThemes);
    var activePath = RouteState.of(context).location;
    yield header([
      nav(
          classes: [
            'm-4',
          ].join(' '),
          [
            // for (var route in [
            //   (label: 'Home', path: '/'),
            //   (label: 'About', path: '/about'),
            // ])
            div(
                classes: ['navbar', 'bg-neutral', 'shadow-sm', 'rounded-box']
                    .join(' '),
                [
                  div(classes: ['flex-1'].join(' '), [
                    ul(
                        classes: [
                          // activePath == route.path ? 'active' : null,
                          // 'btn',
                          // 'btn-ghost',
                        ].join(' '),
                        [
                          Link(
                              to: '/',
                              child: img(
                                  classes: ['btn', 'btn-ghost'].join(' '),
                                  src: '/assets/icons/home.svg')),
                        ]),
                  ]),
                  div(classes: ['dropdown'].join(' '), [
                    div(
                        attributes: {'tabindex': '0', 'role': 'button'},
                        classes: ['btn m-1'].join(' '),
                        [
                          text('Theme'),
                          img(
                              classes:
                                  'inline-block h-2 w-2 fill-current opacity-60',
                              src: '/assets/icons/chevron.svg')
                        ]),
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
