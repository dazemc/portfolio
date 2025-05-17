import 'dart:io';
import 'package:xml/xml.dart';

void main(List<String> args) {
  if (args.isEmpty) {
    print('Usage: dart svg2jaspr.dart <path_to_svg>');
    exit(1);
  }

  final file = File(args[0]);
  if (!file.existsSync()) {
    print('File not found: ${args[0]}');
    exit(1);
  }

  final svgContent = file.readAsStringSync();
  final document = XmlDocument.parse(svgContent);
  final svgElement = document.findAllElements('svg').first;

  final width = svgElement.getAttribute('width') ?? '24';
  final height = svgElement.getAttribute('height') ?? '24';
  final viewBox = svgElement.getAttribute('viewBox') ?? '0 0 24 24';

  final attributes = <String, String>{};
  for (final attr in svgElement.attributes) {
    if (!['width', 'height', 'viewBox'].contains(attr.name.local)) {
      attributes[attr.name.local] = attr.value;
    }
  }

  final children = svgElement.children.whereType<XmlElement>().map((e) {
    final attrs =
        e.attributes.map((a) => "${a.name.local}: '${a.value}'").join(', ');
    return "      ${e.name.local}($attrs, []),";
  }).join('\n');

  final attrMap = attributes.entries
      .map((e) => "      '${e.key}': '${e.value}',")
      .join('\n');

  final output = '''
Component ${_formatName(file.uri.pathSegments.last)}() {
  return svg(
    width: Unit.pixels(${width.replaceAll(RegExp(r'[^0-9.]'), '')}),
    height: Unit.pixels(${height.replaceAll(RegExp(r'[^0-9.]'), '')}),
    viewBox: '$viewBox',
    attributes: {
$attrMap
    },
    [
$children
    ],
  );
}
''';

  print(output);
}

String _formatName(String filename) {
  final name = filename.split('.').first;
  return '${name[0].toLowerCase()}${name.substring(1)}Icon';
}
