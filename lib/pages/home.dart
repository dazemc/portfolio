import 'dart:async';

import 'package:jaspr/jaspr.dart';
import 'package:portfolio/components/card.dart';
import 'package:portfolio/components/card_body.dart';
import 'package:portfolio/components/card_title.dart';
import 'package:portfolio/components/carousel.dart';
import 'package:portfolio/components/carousel_item.dart';

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
                              'animate-blink $mockCodeScriptOpacity',
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
        ),
        div(
            classes:
                'px-12 divider divider-accent duration-4000 ease-in-out animate-stretch $initialOpacity',
            [
              div(classes: 'text-current animate-fall', [
                em([text('Projects')])
              ])
            ]),
        div(
            classes:
                'flex justify-center gap-2 py-2 duration-4000 ease-in-out $initialOpacity',
            [
              a(
                  classes:
                      'btn btn-xs ${currentId == 'i1' ? 'animate-bounce' : 'opacity-50'}',
                  href: '#i1',
                  [text('REST API')]),
              a(
                  classes:
                      'btn btn-xs ${currentId == 'i2' ? 'animate-bounce' : 'opacity-50'}',
                  href: '#i2',
                  [text('FLUTTER APP')])
            ]),
        div(classes: 'flex justify-center', [
          Carousel(
              classes:
                  'my-2 overflow-y-auto overflow-x-hidden touch-pan-y rounded-sm w-100 duration-4000 ease-in-out $initialOpacity',
              carouselItems: [
                CarouselItem(classes: 'w-full', id: 'i1', [
                  Card(
                    [
                      img(classes: 'w-full', src: '/assets/images/ink.jpeg'),
                    ],
                    cardBody: CardBody(
                      [
                        p(classes: 'justify-start', [
                          text(
                              'Developed a Python-based project using FastAPI to manage an E-Paper device, including a '),
                          a(
                              href: 'https://github.com/dazemc/e-paper-lib',
                              target: Target.blank,
                              [
                                div(
                                    classes: 'btn btn-dash btn-primary btn-xs',
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
                                    classes: 'btn btn-dash btn-primary btn-xs',
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
                                    classes: 'btn btn-dash btn-primary btn-xs',
                                    [
                                      text('Flutter application'),
                                    ])
                              ]),
                          text(' front-end')
                        ])
                      ],
                      cardTitle: CardTitle(
                        header: 2,
                        classes: 'text-neutral-400 justify-end',
                        [
                          a(href: 'https://github.com/dazemc/ink_manager', [
                            u([
                              text('RESTful API for E-Paper device'),
                            ]),
                          ])
                        ],
                      ),
                    ),
                  ),
                ]),
                CarouselItem(classes: 'w-full', id: 'i2', [
                  Card(
                    [
                      a(
                          href: 'https://github.com/dazemc/pi7600',
                          target: Target.blank,
                          [
                            img(
                                classes: 'w-full',
                                src: '/assets/images/pi7600.jpeg')
                          ]),
                    ],
                    cardBody: CardBody(
                      [
                        p(classes: 'justify-start', [
                          text(
                              'Developed a Python and Flutter project using FastAPI to manage a 4g LTE SIM, including a '),
                          a(
                              href: 'https://github.com/dazemc/pi7600-lib',
                              target: Target.blank,
                              [
                                div(
                                    classes: 'btn btn-dash btn-primary btn-xs',
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
                                    classes: 'btn btn-dash btn-primary btn-xs',
                                    [
                                      text('API'),
                                    ])
                              ]),
                          text(' and a '),
                          a(
                              classes: 'text-',
                              href: 'https://github.com/dazemc/pi7600-flutter',
                              target: Target.blank,
                              [
                                div(
                                    classes: 'btn btn-dash btn-primary btn-xs',
                                    [
                                      text('Flutter application'),
                                    ])
                              ]),
                          text(' front-end')
                        ])
                      ],
                      cardTitle: CardTitle(
                        header: 2,
                        classes: 'text-neutral-400 justify-end',
                        [
                          a(
                              href: 'https://github.com/dazemc/pi7600-flutter',
                              target: Target.blank,
                              [
                                u([
                                  text('Flutter app for 4g LTE module'),
                                ]),
                              ])
                        ],
                      ),
                    ),
                  ),
                ]),
              ]),
        ]),
      ],
    );
  }
}
