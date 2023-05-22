import 'package:flutter/services.dart';
import 'package:interactive_svg/utils/data/svg_reader/domain.dart';
import 'package:xml/xml.dart';

class Utils {
  static Future<List<Country>> loadSvgImage({required String svgImage}) async {
    List<Country> maps = [];
    String generalString = await rootBundle.loadString(svgImage);

    XmlDocument document = XmlDocument.parse(generalString);

    final paths = document.findAllElements('path');

    for (var element in paths) {
      String partId = element.getAttribute('id').toString();
      String partPath = element.getAttribute('d').toString();
      String name = element.getAttribute('name').toString();
      String color = element.getAttribute('color')?.toString() ?? 'D7D3D2';

      maps.add(Country(id: partId, path: partPath, color: color, name: name));
    }

    return maps;
  }
}
