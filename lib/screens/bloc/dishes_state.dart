part of 'dishes_bloc.dart';

@immutable
abstract class DishesState {}

class DishesInitial extends DishesState {}

class DishesLoaded extends DishesState {
  final DishesList dishesList;

  DishesLoaded(this.dishesList);
}

class DishesLoading extends DishesState {}

class DishDetailsLoaded extends DishesState {
  final DishDetails dishDetails;

  DishDetailsLoaded(this.dishDetails);
}
