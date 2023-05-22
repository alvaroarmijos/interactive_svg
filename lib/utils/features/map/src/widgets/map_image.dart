import 'package:flutter/material.dart';
import 'package:interactive_svg/utils/data/svg_reader/domain.dart';

import '../../widgets.dart';

class MapImage extends StatelessWidget {
  final List<Country> countries;
  final Country? currentCountry;
  final Function(Country country)? onCountrySelected;

  const MapImage({
    super.key,
    required this.countries,
    this.currentCountry,
    this.onCountrySelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: InteractiveViewer(
            maxScale: 5,
            minScale: 0.1,
            child: Center(
              child: Stack(alignment: Alignment.topCenter, children: [
                for (var country in countries)
                  _getClippedImage(
                    clipper: Clipper(
                      svgPath: country.path,
                    ),
                    color: Color(int.parse('FF${country.color}', radix: 16))
                        .withOpacity(currentCountry == null
                            ? 1.0
                            : currentCountry?.id == country.id
                                ? 1.0
                                : 0.3),
                    country: country,
                    onCountrySelected: onCountrySelected,
                  ),
              ]),
            ),
          ),
        ),
        SafeArea(
          child: Text(
            currentCountry?.name ?? "",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
      ],
    );
  }

  Widget _getClippedImage({
    required Clipper clipper,
    required Color color,
    required Country country,
    final Function(Country country)? onCountrySelected,
  }) {
    return ClipPath(
      clipper: clipper,
      child: GestureDetector(
        onTap: () => onCountrySelected?.call(country),
        child: Container(
          color: color,
        ),
      ),
    );
  }
}
