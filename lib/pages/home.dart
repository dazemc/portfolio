import 'dart:async';

import 'package:jaspr/jaspr.dart';

class Home extends StatefulComponent {
  const Home({super.key});
  @override
  State createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isPrimary = true;
  String initialOpacity = 'opacity-0';

  String mockCodeScript = 'sh greeting.sh';
  String mockCodeRunning = '...';
  String mockCodeGreeting = "Hello I'm Daazed McFarland!";
  String mockCodeGreetingTyper = '';
  String mockCodeScriptTyper = '';
  String mockCodeRunningTyper = '';
  String mockCodeScriptOpacity = 'opacity-100';
  String mockCodeGreetingOpacity = 'opacity-0';
  bool isMockCodeScriptDone = false;
  bool isMockCodeRunningDone = false;
  bool isMockCodeGreetingDone = false;
  int typewriterIndex = 0;

  void toggleStyle() {
    setState(() {
      _isPrimary = !_isPrimary;
    });
  }

  @override
  void initState() {
    super.initState();
    // if (kIsWeb) {
    // some browsers won't update correctly without a small wait
    Future.delayed(const Duration(milliseconds: 1), () {
      setState(() {
        initialOpacity = 'opacity-100';
      });
    });
    // }
    Timer(const Duration(seconds: 3), () {
      Timer.periodic(const Duration(milliseconds: 100), (timer) {
        if (typewriterIndex < mockCodeScript.length && !isMockCodeScriptDone) {
          setState(() {
            mockCodeScriptTyper =
                mockCodeScript.substring(0, typewriterIndex + 1);
            typewriterIndex++;
          });
        } else {
          setState(() {
            if (!isMockCodeScriptDone) {
              typewriterIndex = 0;
              isMockCodeScriptDone = true;
              mockCodeScriptOpacity = 'opacity-0';
            }
          });
        }
        if (typewriterIndex < mockCodeRunning.length &&
            !isMockCodeRunningDone &&
            isMockCodeScriptDone) {
          setState(() {
            mockCodeRunningTyper =
                mockCodeRunning.substring(0, typewriterIndex + 1);
            typewriterIndex++;
          });
        } else {
          if (!isMockCodeRunningDone && isMockCodeScriptDone) {
            setState(() {
              typewriterIndex = 0;
              isMockCodeRunningDone = true;
            });
          }
        }
        if (typewriterIndex < mockCodeGreeting.length &&
            isMockCodeRunningDone) {
          setState(() {
            mockCodeGreetingOpacity = 'opacity-100';
            mockCodeGreetingTyper =
                mockCodeGreeting.substring(0, typewriterIndex + 1);
            typewriterIndex++;
          });
        } else {
          // typewriterIndex = 0;
          // timer.cancel();
        }
      });
    });
  }

  List<String> get mockCodeClasses => [
        'mockup-code',
        'shadow-md',
        'm-4',
        'h-32',
        'duration-1000',
        'ease-in-out',
        initialOpacity,
      ];

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(
      classes:
          "flex flex-col justify-start container mx-auto px-2 min-h-screen bg-base-100 transition-all",
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
                code([
                  span(
                    [
                      text(mockCodeScriptTyper),
                      span(
                        classes:
                            'animate-[blink_0.75s_step-end_infinite] $mockCodeScriptOpacity',
                        styles: Styles(
                          border: Border.only(
                            right: BorderSide(
                              width: Unit.pixels(2),
                              color: const Color.named('currentColor'),
                            ),
                          ),
                        ),
                        [],
                      ),
                    ],
                  ),
                ]),
              ],
            ),
            pre(
                classes:
                    'text-warning ${!isMockCodeScriptDone ? 'hidden' : ''}',
                attributes: {
                  'data-prefix': '>'
                },
                [
                  code([
                    span(
                      [
                        text('running$mockCodeRunning'),
                        span(
                          classes:
                              // TODO: loop '...' for a few seconds
                              'animate-[blink_0.75s_step-end_infinite] $mockCodeScriptOpacity',
                          [],
                        ),
                      ],
                    )
                  ])
                ]),
            pre(
                classes:
                    'text-success ${!isMockCodeRunningDone ? 'hidden' : ''}',
                attributes: {
                  'data-prefix': '>'
                },
                [
                  code([
                    span(
                      [
                        text(mockCodeGreetingTyper),
                        span(
                          classes:
                              'animate-[blink_0.75s_step-end_infinite] $mockCodeGreetingOpacity',
                          styles: Styles(
                            border: Border.only(
                              right: BorderSide(
                                width: Unit.pixels(2),
                                color: const Color.named('currentColor'),
                              ),
                            ),
                          ),
                          [],
                        ),
                      ],
                    )
                  ])
                ])
          ],
        ),
        div(
            classes:
                'px-12 divider divider-accent duration-4000 ease-in-out $initialOpacity',
            [
              div(classes: 'text-current', [
                em([text('Projects')])
              ])
            ]),
        div(classes: 'flex justify-center', [
          div(
              classes:
                  'my-2 carousel rounded-sm w-100 duration-4000 ease-in-out $initialOpacity',
              [
                div(classes: 'carousel-item w-full', id: 'i1', [
                  a(
                    href: 'https://github.com/dazemc/ink_manager',
                    target: Target.blank,
                    [img(classes: 'w-full', src: '/assets/images/ink.jpeg')],
                  )
                ]),
                div(classes: 'carousel-item w-full', id: 'i2', [
                  a(
                      href: '',
                      target: Target.blank,
                      [img(classes: '', src: '')]),
                ])
              ]),
        ]),
        div(
            classes:
                'flex justify-center gap-2 py-2 duration-4000 ease-in-out $initialOpacity',
            [
              a(classes: 'btn btn-xs ', href: '#i1', [text('REST API')])
            ])
      ],
    );
  }
}
