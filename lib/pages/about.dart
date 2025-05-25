import 'package:jaspr/jaspr.dart';

class About extends StatelessComponent {
  const About({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield section(classes: 'mx-1', [
      div([text('About')])
    ]);
  }
}
