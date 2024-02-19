part of 'map_bloc.dart';

sealed class MapState {
  const MapState();
}

final class Empty extends MapState {
  const Empty();
}

final class Loading extends MapState {
  const Loading();
}

final class Loaded extends MapState {
  final List<Country> countries;
  final Country? currentCountry;

  const Loaded({
    required this.countries,
    this.currentCountry,
  });

  Loaded copyWith({
    List<Country>? countries,
    Country? currentCountry,
  }) =>
      Loaded(
        countries: countries ?? this.countries,
        currentCountry: currentCountry ?? this.currentCountry,
      );
}

final class Error extends MapState {
  final String message;

  const Error({required this.message});
}
