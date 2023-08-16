import 'package:equatable/equatable.dart';

import '../models/plant.dart';

abstract class PlantsState extends Equatable {
  const PlantsState();

  @override
  List<Object> get props => [];
}

class PlantsInitial extends PlantsState {}

class PlantsLoading extends PlantsState {}

class PlantsLoaded extends PlantsState {
  final List<Plant> plants;

  PlantsLoaded({required this.plants});

  @override
  List<Object> get props => [plants];
}

class PlantsError extends PlantsState {
  final String error;

  PlantsError({required this.error});

  @override
  List<Object> get props => [error];
}
