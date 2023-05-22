import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interactive_svg/utils/core/commons/widgets.dart';
import 'package:interactive_svg/utils/features/map/bloc.dart';
import 'package:interactive_svg/utils/features/map/widgets.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MapPageBloc>()..init();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Map Page'),
      ),
      body: BlocBuilder<MapPageBloc, MapPageState>(builder: (context, state) {
        if (state is Empty) {
          return const InformationMessage(
            message: 'There aren\'t information about pokemon.',
          );
        } else if (state is Loading) {
          return const LoadingWidget();
        } else if (state is Loaded) {
          return MapImage(
            countries: state.countries,
            currentCountry: state.currentCountry,
            onCountrySelected: (country) => bloc.onCountrySelected(country),
          );
        } else if (state is Error) {
          return InformationMessage(
            message: state.message,
          );
        }

        return Container();
      }),
    );
  }
}
