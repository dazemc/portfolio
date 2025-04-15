import 'package:jaspr/jaspr.dart';

class Home extends StatefulComponent {
  const Home({super.key});
  @override
  State createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isPrimary = true;

  void toggleStyle() {
    setState(() {
      _isPrimary = !_isPrimary;
    });
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(
      classes: "flex justify-center min-h-screen bg-base-100",
      [
        // button(
        //   onClick: toggleStyle,
        //   classes: [
        //     'btn',
        //     'btn-soft',
        //     _isPrimary ? 'btn-primary' : 'btn-secondary',
        //   ].join(' '),
        //   [
        //     text(
        //         _isPrimary ? "I'm a Primary button" : "I'm a Secondary button"),
        //   ],
        // )
        div(
          classes:
              ['mockup-code', 'shadow-md', 'w-full', 'm-4', 'h-32'].join(' '),
          [
            pre(
              attributes: {'data-prefix': r'$'},
              [
                code([text('sh greeting.sh')]),
              ],
            ),
            pre(classes: ['text-warning'].join(' '), attributes: {
              'data-prefix': '>'
            }, [
              code([text('running...')])
            ]),
            pre(classes: ['text-success'].join(' '), attributes: {
              'data-prefix': '>'
            }, [
              code([text("Hello I'm Daazed McFarland")])
            ])
          ],
        )
      ],
    );
  }
}
