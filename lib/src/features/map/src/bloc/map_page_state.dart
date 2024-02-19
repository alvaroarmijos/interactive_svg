part of 'map_page_bloc.dart';

abstract class MapPageState {
  final List<Country>? countries;
  final Country? currentCountry;

  MapPageState({this.countries, this.currentCountry});
}

class Empty extends MapPageState {}

class Loading extends MapPageState {}

class Loaded extends MapPageState {
  @override
  final List<Country> countries;
  @override
  final Country? currentCountry;

  Loaded(
    this.countries,
    this.currentCountry,
  );
}

class Error extends MapPageState {
  final String message;

  Error({required this.message});
}
