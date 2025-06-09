import 'package:jaspr/jaspr.dart';
import 'package:jaspr_daisyui_components/jaspr_daisyui_components.dart';

class About extends StatelessComponent {
  const About({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(classes: 'flex justify-start mx-4 lg:mx-100', [
      Card(classes: 'bg-base-50 w-96 shadow-sm', [
        Avatar(classes: 'justify-center my-2', [
          div(classes: 'w-40 h-20 lg:w-120 lg:h-60 rounded-xl', [
            img(src: '/assets/images/me.webp', alt: 'me'),
          ])
        ]),
        CardBody([
          CardTitle(classes: 'lg:text-[36px]', [
            text('Hello:'),
          ]),
          p(
              classes: 'lg:text-[24px]',
              [text('My name is Daazed and this is my portfolio.')]),
        ])
      ])
    ]);
    yield div(classes: 'flex justify-end mx-4 lg:mx-100', [
      Card(classes: 'bg-base-50 w-96 shadow-sm', [
        CardBody([
          CardTitle(classes: 'lg:text-[36px]', [text('About:')]),
          p(classes: 'lg:text-[24px]', [text('about me')])
        ]),
      ])
    ]);
  }
}
