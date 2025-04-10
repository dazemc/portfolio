import 'package:jaspr/jaspr.dart';

// import '../components/counter.dart';

class Home extends StatelessComponent {
  const Home({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield section([
      // img(src: 'images/logo.svg', width: 80),
      h1([text("Hello, I'm Daazed McFarland!")]),
      // p([text("")]),
      div(styles: Styles(height: 100.px), []),
      // const Counter(), // Flutter embeded
    ]);
  }
}
