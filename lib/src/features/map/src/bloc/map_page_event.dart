part of 'map_page_bloc.dart';

abstract class MapPageEvent {}

class GetSvgEvent extends MapPageEvent {}

class CountrySelectedEvent extends MapPageEvent {
  final Country country;

  CountrySelectedEvent(this.country);
}
