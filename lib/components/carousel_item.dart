import 'package:jaspr/jaspr.dart';

class CarouselItem extends StatelessComponent {
  final List<Component> children;
  final String? classes;
  final String? id;
  const CarouselItem(this.children, {this.id, this.classes, super.key});

  String nullCheckDefaults(String? classes, String defaultClasses) {
    return (classes != null) ? '$defaultClasses $classes' : defaultClasses;
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    String _carouselItemClasses = nullCheckDefaults(classes, 'carousel-item');
    yield div(classes: _carouselItemClasses, id: id, children);
  }
}
