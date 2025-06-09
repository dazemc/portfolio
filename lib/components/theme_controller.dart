import 'dart:math';
import 'package:jaspr/jaspr.dart';

import 'package:logging/logging.dart';

final _log = Logger('/components/theme_controller.dart');
final _random = Random();

class ThemeController extends StatefulComponent {
  final String? themeName;
  final String? themeControllerClasses;
  final String? randomThemeClasses;
  final String? dropdownClasses;
  final String? dropdownContentClasses;
  final Component? dropdownIcon;
  const ThemeController(
      {this.themeName,
      this.themeControllerClasses,
      this.dropdownIcon,
      this.randomThemeClasses,
      this.dropdownClasses,
      this.dropdownContentClasses,
      super.key});

  @override
  State<ThemeController> createState() => _ThemeControllerState();
}

class _ThemeControllerState extends State<ThemeController> {
  late String _currentTheme;
  late String _themeControllerClasses;
  late String _randomThemeClasses;
  late String _dropdownClasses;
  late String _dropdownContentClasses;
  late Component _dropdownIcon;
  final List<String> _availableThemes = [
    'light',
    'dark',
    'cupcake',
    'bumblebee',
    'emerald',
    'corporate',
    'synthwave',
    'retro',
    'cyberpunk',
    'valentine',
    'halloween',
    'garden',
    'forest',
    'aqua',
    'lofi',
    'pastel',
    'fantasy',
    'wireframe',
    'black',
    'luxury',
    'dracula',
    'cmyk',
    'autumn',
    'business',
    'acid',
    'lemonade',
    'night',
    'coffee',
    'winter',
    'dim',
    'nord',
    'sunset',
    'caramellatte',
    'abyss',
    'silk',
  ];

  @override
  void initState() {
    super.initState();
    _currentTheme = super.component.themeName ?? 'dark';
    _randomThemeClasses = super.component.randomThemeClasses ??
        super.component.themeControllerClasses ??
        'w-full btn btn-sm btn-block btn-ghost justify-start';
    _themeControllerClasses = super.component.themeControllerClasses ??
        'w-full btn btn-sm btn-block btn-ghost justify-start';
    _dropdownIcon = super.component.dropdownIcon ?? span([]);
    _dropdownClasses =
        super.component.dropdownClasses ?? ' btn m-1 w-25 hover:opacity-50';
    _dropdownContentClasses = super.component.dropdownContentClasses ??
        'bg-base-300 rounded-box z-1 p-2 shadow-2xl max-h-60 overflow-y-auto';
  }

  void changeThemeName(String name) {
    setState(() {
      _currentTheme = name;
    });
  }

  Component randomTheme(themeList) {
    int randomIdx = _random.nextInt(themeList.length);
    final String theme = themeList[randomIdx];
    _log.info('Random theme chosen: $theme');
    return li([
      input(
          attributes: {
            'type': 'radio',
            'name': 'theme-dropdown',
            'aria-label': 'random',
            'value': _currentTheme,
          },
          classes: 'theme-controller ' + _randomThemeClasses,
          events: {
            'click': (event) {
              _log.info('Theme changed: $theme');
              changeThemeName(theme);
              randomIdx; // changes theme for the next click
            },
          },
          [])
    ]);
  }

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
            classes: 'theme-controller ' + _themeControllerClasses,
            events: {
              'click': (event) {
                _log.info('Theme changed');
                changeThemeName(theme);
              }
            },
            [])
      ]));
    }
    return componentList;
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    List<Component> themeComponents = themeListElements(_availableThemes);
    {
      yield Document.html(attributes: {
        'data-theme': _currentTheme,
        'class': 'transition-all duration-2000 ease-in-out'
      });
      yield div(classes: 'dropdown', [
        div(
            attributes: {'tabindex': '0', 'role': 'button'},
            classes: _dropdownClasses,
            [text(_currentTheme), _dropdownIcon]),
        ul(
          attributes: {
            'tabindex': '0',
          },
          classes: 'dropdown-content ' + _dropdownContentClasses,
          themeComponents,
        )
      ]);
    }
  }
}
