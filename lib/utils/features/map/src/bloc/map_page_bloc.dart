import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:interactive_svg/utils/data/svg_reader/domain.dart';

import '../../../../utils.dart';

part 'map_page_event.dart';
part 'map_page_state.dart';

class MapPageBloc extends Bloc<MapPageEvent, MapPageState> {
  MapPageBloc() : super(Loading()) {
    on<GetSvgEvent>(_onGetSvgEvent);
    on<CountrySelectedEvent>(_onCountrySelectedEvent);
  }

  FutureOr<void> _onGetSvgEvent(
    GetSvgEvent event,
    Emitter emit,
  ) async {
    await Utils.loadSvgImage(svgImage: 'assets/map.svg')
        .then((data) => emit(Loaded(data, null)));
  }

  FutureOr<void> _onCountrySelectedEvent(
    CountrySelectedEvent event,
    Emitter emit,
  ) async {
    emit(Loaded(state.countries!, event.country));
  }

  void init() {
    add(GetSvgEvent());
  }

  void onCountrySelected(Country country) {
    add(CountrySelectedEvent(country));
  }
}
