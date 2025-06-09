import 'dart:async';

import 'package:jaspr/jaspr.dart';
import 'package:jaspr_daisyui_components/jaspr_daisyui_components.dart';

class Home extends StatefulComponent {
  final String selectedItemId;

  const Home({super.key, required this.selectedItemId});
  @override
  State createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String currentId;
  bool _isPrimary = true;
  String initialOpacity = 'opacity-0';
  String bounceOnce = '';

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
    currentId = component.selectedItemId;

    if (kIsWeb) {
      // some browsers won't update correctly without a small wait
      Future.delayed(const Duration(milliseconds: 1), () {
        setState(() {
          initialOpacity = 'opacity-100';
        });
      });
      Timer(const Duration(seconds: 3), () {
        Timer.periodic(const Duration(milliseconds: 100), (timer) {
          if (typewriterIndex < mockCodeScript.length &&
              !isMockCodeScriptDone) {
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
  }

  @override
  void didUpdateComponent(covariant Home oldComponent) {
    super.didUpdateComponent(oldComponent);

    if (component.selectedItemId != oldComponent.selectedItemId) {
      setState(() {
        currentId = component.selectedItemId;
      });
    }
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(classes: "flex container w-max mx-auto", [
      MockupCode(
        classes:
            'shadow-md m-4 h-32 w-86 lg:h-48 lg:w-128 bg-blend-darken duration-1000 ease-in-out $initialOpacity',
        [
          pre(
            classes: 'lg:text-[24px]',
            attributes: {'data-prefix': r'$'},
            [
              code([
                span(
                  [
                    text(mockCodeScriptTyper),
                    span(
                      classes: 'animate-blink $mockCodeScriptOpacity',
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
                  'lg:text-[24px] text-warning ${!isMockCodeScriptDone ? 'hidden' : ''}',
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
                            'animate-blink $mockCodeScriptOpacity',
                        [],
                      ),
                    ],
                  )
                ])
              ]),
          pre(
              classes:
                  'lg:text-[24px] text-success ${!isMockCodeRunningDone ? 'hidden' : ''}',
              attributes: {
                'data-prefix': '>'
              },
              [
                code([
                  span(
                    [
                      text(mockCodeGreetingTyper),
                      span(
                        classes: 'animate-blink $mockCodeGreetingOpacity',
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
      )
    ]);
    yield Divider(
        direction: DividerDirection.vertical,
        color: DividerColor.accent,
        classes:
            'mx-6 lg:mx-106 duration-2000 ease-in-out animate-stretch $initialOpacity',
        [
          div(classes: 'text-current animate-fall', [
            em([text('Projects')])
          ])
        ]);
    yield div(
        classes:
            'flex justify-center gap-2 mx-auto duration-3000 ease-in-out $initialOpacity',
        [
          a(
            classes: '${currentId == 'i1' ? 'animate-bounce' : 'opacity-50'}',
            [
              Btn(
                  classes:
                      'lg:text-[18px] transition-all duration-1000 ease-in-out',
                  size: BtnSize.xs,
                  [text('REST API')])
            ],
            href: '#i1',
          ),
          a(
              classes: '${currentId == 'i2' ? 'animate-bounce' : 'opacity-50'}',
              href: '#i2',
              [
                Btn(
                    classes:
                        'lg:text-[18px] transition-all duration-1000 ease-in-out',
                    size: BtnSize.xs,
                    [text('FLUTTER APP')])
              ])
        ]);
    yield div(
        classes: 'flex flex-col items-center mx-4 duration-1000 ease-in-out',
        [
          Carousel(
              classes:
                  'm-4 overflow-y-hidden overflow-x-hidden touch-pan-y rounded-sm w-full duration-4000 ease-in-out $initialOpacity',
              [
                CarouselItem(classes: 'w-full m-4', id: 'i1', [
                  Card(classes: 'bg-base-100 shadow-xl mx-4 lg:mx-100 ', [
                    img(classes: 'rounded-xl', src: '/assets/images/ink.jpeg'),
                    CardBody(
                      classes:
                          'bg-base-120 transition-all duration-1000 ease-in-out',
                      [
                        CardTitle(
                          classes: 'text-neutral-400 justify-end',
                          [
                            a(href: 'https://github.com/dazemc/ink_manager', [
                              u(classes: 'lg:text-[36px]', [
                                text('RESTful API for E-Paper device'),
                              ]),
                            ])
                          ],
                        ),
                        p(classes: 'justify-start lg:text-[24px]', [
                          text(
                              'Developed a Python-based project using FastAPI to manage an E-Paper device, including a '),
                          a(
                              href: 'https://github.com/dazemc/e-paper-lib',
                              target: Target.blank,
                              [
                                div(
                                    classes:
                                        'btn btn-dash btn-primary btn-xs lg:btn-md transition-all duration-1000 ease-in-out',
                                    [
                                      text('custom library'),
                                    ])
                              ]),
                          text(' '),
                          a(
                              href: 'https://github.com/dazemc/ink_manager',
                              target: Target.blank,
                              [
                                div(
                                    classes:
                                        'btn btn-dash btn-primary btn-xs lg:btn-md transition-all duration-1000 ease-in-out',
                                    [
                                      text('API'),
                                    ])
                              ]),
                          text(' and a '),
                          a(
                              classes: 'text-',
                              href: 'https://github.com/dazemc/ink_app',
                              target: Target.blank,
                              [
                                div(
                                    classes:
                                        'btn btn-dash btn-primary btn-xs lg:btn-md transition-all duration-1000 ease-in-out',
                                    [
                                      text('Flutter application'),
                                    ])
                              ]),
                          text(' front-end')
                        ])
                      ],
                    ),
                  ]),
                ]),
                CarouselItem(classes: 'w-full m-4', id: 'i2', [
                  Card(
                      classes:
                          'justify-center bg-base-120 mx-4 shadow-xl lg:mx-100',
                      [
                        a(
                            href: 'https://github.com/dazemc/pi7600',
                            target: Target.blank,
                            [
                              img(
                                  classes: 'rounded-xl',
                                  src: '/assets/images/pi7600.jpeg')
                            ]),
                        CardBody(
                          classes:
                              'bg-base-120 transition-all duration-1000 ease-in-out',
                          [
                            CardTitle(
                              classes: 'text-neutral-400 justify-end',
                              [
                                a(
                                    href:
                                        'https://github.com/dazemc/pi7600-flutter',
                                    target: Target.blank,
                                    [
                                      u(classes: 'lg:text-[36px]', [
                                        text('Flutter app for 4g LTE module'),
                                      ]),
                                    ])
                              ],
                            ),
                            p(classes: 'justify-start lg:text-[24px]', [
                              text(
                                  'Developed a Python and Flutter project using FastAPI to manage a 4g LTE SIM, including a '),
                              a(
                                  href: 'https://github.com/dazemc/pi7600-lib',
                                  target: Target.blank,
                                  [
                                    div(
                                        classes:
                                            'btn btn-dash btn-primary btn-xs lg:btn-md transition-all duration-1000 ease-in-out',
                                        [
                                          text('custom library'),
                                        ])
                                  ]),
                              text(' '),
                              a(
                                  href: 'https://github.com/dazemc/pi7600',
                                  target: Target.blank,
                                  [
                                    div(
                                        classes:
                                            'btn btn-dash btn-primary btn-xs lg:btn-md transition-all duration-1000 ease-in-out',
                                        [
                                          text('API'),
                                        ])
                                  ]),
                              text(' and a '),
                              a(
                                  classes: 'text-',
                                  href:
                                      'https://github.com/dazemc/pi7600-flutter',
                                  target: Target.blank,
                                  [
                                    div(
                                        classes:
                                            'btn btn-dash btn-primary btn-xs lg:btn-md transition-all duration-1000 ease-in-out',
                                        [
                                          text('Flutter application'),
                                        ])
                                  ]),
                              text(' front-end')
                            ])
                          ],
                        ),
                      ]),
                ])
              ])
        ]);
  }
}
