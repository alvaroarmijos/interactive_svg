import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interactive_svg/src/core/commons/widgets.dart';
import 'package:interactive_svg/src/features/map/src/bloc/map_bloc.dart';
import 'package:interactive_svg/src/features/map/src/widgets/map_image.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MapBloc>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Map Page'),
      ),
      body: BlocBuilder<MapBloc, MapState>(builder: (context, state) {
        return switch (state) {
          Empty() => const InformationMessage(
              message: 'There aren\'t information about pokemon.',
            ),
          Loading() => const LoadingWidget(),
          Error() => InformationMessage(
              message: state.message,
            ),
          Loaded(
            countries: final countries,
            currentCountry: final currentCountry,
          ) =>
            MapImage(
              countries: countries,
              currentCountry: currentCountry,
              onCountrySelected: (country) => bloc.onCountrySelected(country),
            ),
        };
      }),
    );
  }
}
