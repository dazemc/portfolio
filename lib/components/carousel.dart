import 'package:jaspr/jaspr.dart';
import 'package:portfolio/components/carousel_item.dart';

class Carousel extends StatelessComponent {
  final String? classes;
  final List<CarouselItem> carouselItems;
  const Carousel({this.classes, required this.carouselItems, super.key});

  String nullCheckDefaults(String? classes, String defaultClasses) {
    return (classes != null) ? '$defaultClasses $classes' : defaultClasses;
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    String _carouselClasses = nullCheckDefaults(classes, 'carousel');

    yield div(classes: _carouselClasses, carouselItems as List<Component>);
  }
}
