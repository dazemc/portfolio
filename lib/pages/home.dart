import 'package:jaspr/jaspr.dart';

class Home extends StatefulComponent {
  const Home({super.key});
  @override
  State createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isPrimary = true;
  List<String> mockCodeClasses = [
    'mockup-code',
    'shadow-md',
    'w-full',
    'm-4',
    'h-32',
    'transition',
    'duration-300',
    'ease-in-out',
    'opacity-0',
  ];
  void toggleStyle() {
    setState(() {
      _isPrimary = !_isPrimary;
    });
  }

  @override
  void initState() {
    super.initState();
    if (kIsWeb) {
      Future.delayed(const Duration(milliseconds: 1), () {
        List<String> mockCodeClassesUpdate = mockCodeClasses;
        mockCodeClassesUpdate[mockCodeClasses
            .indexWhere((element) => element == "opacity-0")] = 'opacity-100';
        setState(() {
          mockCodeClasses = mockCodeClassesUpdate;
        });
      });
    }
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
          classes: mockCodeClasses.join(' '),
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
