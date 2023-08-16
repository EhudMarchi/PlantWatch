import 'package:equatable/equatable.dart';

abstract class PlantsEvent extends Equatable {
  const PlantsEvent();

  @override
  List<Object> get props => [];
}

class FetchPlants extends PlantsEvent {}

class SearchPlants extends PlantsEvent {
  final String searchTerm;

  const SearchPlants(this.searchTerm);

  @override
  List<Object> get props => [searchTerm];
}
