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
                child: lucide.house(
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
                    child: lucide.info(
                        height: Unit.pixels(30), width: Unit.pixels(30)))
              ]),
            ]),
          ]),
          ThemeController(
            themeName: defaultTheme,
            dropdownIcon: lucide.chevronDown(classes: 'animate-wiggle'),
            randomThemeClasses:
                'w-full btn btn-sm btn-block btn-primary justify-start animate-bounce',
          )
        ]),
      ]),
    ]);
  }
}
