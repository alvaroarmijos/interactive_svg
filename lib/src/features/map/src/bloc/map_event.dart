part of 'map_bloc.dart';

abstract class MapEvent {}

class GetSvgEvent extends MapEvent {}

class CountrySelectedEvent extends MapEvent {
  final Country country;

  CountrySelectedEvent(this.country);
}
