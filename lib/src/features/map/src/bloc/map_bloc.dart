import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:interactive_svg/src/data/svg_reader/domain.dart';
import 'package:interactive_svg/utils/utils.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  MapBloc() : super(const Loading()) {
    on<GetSvgEvent>(_onGetSvgEvent);
    on<CountrySelectedEvent>(_onCountrySelectedEvent);
  }

  FutureOr<void> _onGetSvgEvent(
    GetSvgEvent event,
    Emitter emit,
  ) async {
    await Utils.loadSvgImage(svgImage: 'assets/map.svg').then(
      (data) => emit(
        Loaded(
          countries: data,
          currentCountry: null,
        ),
      ),
    );
  }

  FutureOr<void> _onCountrySelectedEvent(
    CountrySelectedEvent event,
    Emitter emit,
  ) async {
    emit(
      (state as Loaded).copyWith(
        currentCountry: event.country,
      ),
    );
  }

  void onCountrySelected(Country country) {
    add(CountrySelectedEvent(country));
  }
}
