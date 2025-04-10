// dart format off
// ignore_for_file: type=lint

// GENERATED FILE, DO NOT MODIFY
// Generated with jaspr_builder

import 'package:jaspr/jaspr.dart';
import 'package:portfolio/components/header.dart' as prefix0;
import 'package:portfolio/pages/about.dart' as prefix1;
import 'package:portfolio/app.dart' as prefix2;

/// Default [JasprOptions] for use with your jaspr project.
///
/// Use this to initialize jaspr **before** calling [runApp].
///
/// Example:
/// ```dart
/// import 'jaspr_options.dart';
///
/// void main() {
///   Jaspr.initializeApp(
///     options: defaultJasprOptions,
///   );
///
///   runApp(...);
/// }
/// ```
final defaultJasprOptions = JasprOptions(
  clients: {prefix2.App: ClientTarget<prefix2.App>('app')},
  styles:
      () => [
        ...prefix0.Header.styles,
        ...prefix1.About.styles,
        ...prefix2.AppState.styles,
      ],
);
